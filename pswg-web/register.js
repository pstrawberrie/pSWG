import express from 'express';
import mysql from 'mysql2/promise';
import crypto from 'crypto';

const router = express.Router();

// DB config
const dbConfig = {
    host: process.env.SWGEMU_DB_HOST,
    user: process.env.SWGEMU_DB_USER,
    password: process.env.SWGEMU_DB_PASS,
    database: process.env.SWGEMU_DB_NAME,
};
const DB_SECRET = process.env.SWGEMU_DB_SECRET;

// Utility functions
function generateSalt(length = 32) {
    return crypto.randomBytes(length / 2).toString('hex');
}

function hashPassword(password, salt, dbSecret = '') {
    return crypto
        .createHash('sha256')
        .update(dbSecret + password + salt)
        .digest('hex');
}

// POST /register
router.post('/register', async (req, res) => {
    const { username, password } = req.body;

    if (!username || !password || username.length < 3 || password.length < 6) {
        return res.status(400).json({ error: 'Invalid username or password' });
    }

    const salt = generateSalt();
    const stationId = Math.floor(Math.random() * 2 ** 31); // mimic System::random()
    const hash = hashPassword(password, salt, DB_SECRET);

    const insertQuery = `
        INSERT INTO accounts (username, password, station_id, salt)
        VALUES (?, ?, ?, ?)
    `;

    try {
        const connection = await mysql.createConnection(dbConfig);
        const [result] = await connection.execute(insertQuery, [username, hash, stationId, salt]);
        await connection.end();

        res.status(201).json({ success: true, account_id: result.insertId });
    } catch (err) {
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(409).json({ error: 'Username already exists' });
        }
        console.error('Registration error:', err.message);
        res.status(500).json({ error: 'Database error' });
    }
});

export default router;

import mysql from 'mysql2/promise';
import crypto from 'crypto';

// DB config
const dbConfig = {
    host: process.env.SWGEMU_DB_HOST,
    user: process.env.SWGEMU_DB_USER,
    password: process.env.SWGEMU_DB_PASS,
    database: process.env.SWGEMU_DB_NAME,
};

const DB_SECRET = process.env.SWGEMU_DB_SECRET;
const canRegister = process.env.SWGEMU_ENABLE_REGISTRATION === 'true';

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

/**
 * POST register
 */
export const postRegister = async (req, res) => {
    const { username, password } = req.body;

    if (!canRegister) {
        console.error('/register POST: registration is currently disabled');
        return res.status(403).json({ error: 'Registration is currently disabled' });
    }

    if (!username || !password || username.length < 3 || password.length < 6) {
        console.error(`/register POST: invalid username or password - username: ${username} / password: ${password}`);
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

        console.log(`/register POST: sucessfully registered account "${username}" with password hash "${hash}"`);
        res.status(201).json({ success: true, account_id: result.insertId });
    } catch (err) {
        if (err.code === 'ER_DUP_ENTRY') {
            console.error(`/register POST: username: "${username}" already exists`);
            return res.status(409).json({ error: 'Username already exists' });
        }
        console.error('Registration error:', err.message);
        res.status(500).json({ error: 'Database error' });
    }
};

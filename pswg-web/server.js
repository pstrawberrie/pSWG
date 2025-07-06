import express from 'express';
import helmet from 'helmet';
import cors from 'cors';
import fs from 'fs/promises';
import registerRouter from './register.js';

const app = express();
const PORT = 3000;
const STATUS_JSON_PATH = '/opt/pswg-status-poller/pswg-status.json';

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());

// Register endpoint
app.use('/api', registerRouter)

// Status endpoint
app.get('/status', async (req, res) => {
    try {
        const data = await fs.readFile(STATUS_JSON_PATH, 'utf8');
        const parsed = JSON.parse(data);
        res.json(parsed);
    } catch (err) {
        console.error(`[status] Error reading or parsing JSON: ${err.message}`);
        res.status(500).json({ error: 'Could not read status file' });
    }
});

// Catch-all route
app.use((req, res) => {
    res.status(404).json({ error: 'Not found' });
});

// Start server
app.listen(PORT, () => {
    console.log(`🍓 pSWG web server listening @ http://localhost:${PORT}`);
});
import fs from 'fs/promises';

const canRegister = process.env.SWGEMU_ENABLE_REGISTRATION === 'true';
const statusJsonFile = process.env.SWGEMU_STATUS_JSON;

/**
 * GET index
 */
export const getIndex = (req, res) => {
  res.render('index', {
    title: 'pSWG',
    canRegister
  })
}

/**
 * GET status
 */
export const getStatus = async (req, res) => {
  try {
    const data = await fs.readFile(statusJsonFile, 'utf8');
    const parsed = JSON.parse(data);
    res.json(parsed);
  } catch (err) {
    console.error(`[status] Error reading or parsing JSON: ${err.message}`);
    res.status(500).json({ error: 'Could not read status file' });
  }
}
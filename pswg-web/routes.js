import express from 'express';
import { getIndex, getStatus } from './controllers/general.js';
import { postRegister } from './controllers/register.js';


const router = express.Router();

// General
router.get('/', getIndex)
router.get('/status', getStatus)

// Registration
router.post('/register', postRegister);

export default router;
import express from 'express';
import helmet from 'helmet';
import cors from 'cors';
import routes from './routes.js';
import nonceMiddleware from './middlewares/nonce.js';

const app = express();
const PORT = 3000;

// Middleware
app.use(nonceMiddleware);
app.use(helmet({
  contentSecurityPolicy: {
    useDefaults: true,
    directives: {
      scriptSrc: ["'self'", (req, res) => `'nonce-${res.locals.nonce}'`] // allow nonce scripts via nonceMiddleware
    }
  }
}));
app.use(cors());
app.use(express.json());

// Static Files & Views
app.use(express.static('public'));
app.set('view engine', 'ejs');
app.set('views', 'views');

// Register endpoint
app.use('/', routes)

// Catch-all route
app.use((req, res) => {
    res.status(404).json({ error: 'Not found' });
});

// Start server
app.listen(PORT, () => {
    console.log(`🍓 pSWG web server listening @ http://localhost:${PORT}`);
});
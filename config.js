// # Ghost Configuration
// Setup your Ghost install for various environments

var path = require('path'),
    config;

config = {
    production: {
        url: process.env.GHOST_URL,
        mail: {},
        database: {
            client: 'sqlite3',
            connection: {
                filename: '/data/ghost.db'
            },
            debug: false
        },
        mail: {
          transport: 'SMTP',
          options: {
            service: 'Mailgun',
            auth: {
              user: process.env.MAILGUN_USER,
              pass: process.env.MAILGUN_PASS
            }
          }
        },
        server: {
            host: '0.0.0.0',
            port: '2368'
        }
    }
};

// Export config
module.exports = config;

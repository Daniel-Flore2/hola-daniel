const request = require('supertest');
const express = require('express');

const app = express();
app.get('/api/v1/welcome', (req, res) => {
    res.status(200).send('hola danielito');
});

describe('GET /api/v1/welcome', () => {
    it('respond with hola danielito', (done) => {
        request(app)
            .get('/api/v1/welcome')
            .expect('hola danielito', done);
    });
});

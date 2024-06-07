const express = require('express');
const app = express();
const port = 3001;

app.get('/api/v1/welcome', (req, res) => {
    res.send('! h World!');
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
const express = require('express');
const app = express();
app.use(express.json());
app.get('/', (req, res) => {
    res.send('Rehearsal Scheduler API running');
});
app.listen(3001, () => {
    console.log('API listening on port 3001');
});
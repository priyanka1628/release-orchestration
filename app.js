const express = require('express'); //imports the Express library you just installed
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Hello from Release Orchestration Platform!', version: '4.0-green' }); //when someone hits the root URL, return a JSON message
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP', version: '4.0' }); //this is the critical endpoint — Kubernetes will call this to know if your app is alive. It must return HTTP 200 when healthy
});

const PORT = process.env.PORT || 3000; // reads the PORT from environment variables if set, otherwise defaults to 3000. 
app.listen(PORT, () => { //starts the server and listens on the specified port
  console.log(`App is running on port ${PORT}`);
});
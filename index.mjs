import express from 'express';
const app = express();

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/:name', (req, res) => {
  const name = req.params.name;
  res.send(`<h1>Hello ${name}!</h1>`);
})

;const port = parseInt(process.env.PORT) || 8080;

app.listen(port, () => {
  console.log(`helloworld: listening on port ${port}`);
});

const express = require("express");
// const { f } = require("joi");
const app = express();
const port = 3000;
var bodyParser = require("body-parser");
var fs = require("fs");
const fsPromises = require("fs").promises;
const { exec } = require("child_process");

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

app.get("/", function (req, res) {
  res.sendFile(__dirname + "/public/" + "index.html");
});

app.post("/api", async function (req, res) {
  var input = req.body.input;
  input = input.concat("\n");
  fsPromises.writeFile("in.txt", input, function (err) {
    if (err) throw err;
    console.log("error to save " + filename);
  });
  var command = "./a.out <in.txt";
  var x = {};
  await exec(command, (error, stdout, stderr) => {
    // console.log( "From the execute function");
    x = stdout;
    console.log(stdout);
    res.send(x);
    // console.log(r);
  });
  // res.send(x);
});
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

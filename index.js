const express = require("express");

const cors = require("cors");

const app = express();

app.use(cors());

// get the client

const Wizard = require("./models/wizard");

app.get("/wizards", (req, res) => {
  const myWizard = new Wizard();

  myWizard.getAllWizardsWithWands().then((data) => {
    res.send(data[0]);
  });
});

app.get("/wizards/:id", (req, res) => {
  // code with functions
  // const wizardId = req.params.id;

  // getWizardDetails(wizardId).then((data) => {
  //   res.send(data[0]);
  // });

  // code with object
  const wizardId = req.params.id;
  const myWizard = new Wizard();

  myWizard.getWizardDetails(wizardId).then((data) => {
    res.send(data[0]);
  });
});

app.listen(5000);

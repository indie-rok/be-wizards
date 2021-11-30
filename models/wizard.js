const mysql = require("mysql2");

// create the connection to database

class Wizard {
  constructor() {
    this.connection = mysql.createConnection({
      host: "localhost",
      port: 3306,
      user: "root",
      password: "",
      database: "arch_app",
    });
  }

  getAllWizards() {
    return this.connection.promise().query("SELECT * FROM wizards");
  }

  getAllWizardsWithWands() {
    return this.connection
      .promise()
      .query(
        "SELECT wizards.id AS id, wizards.name AS wizard_name, wands.name AS wand_name, wizards.email AS wizard_email FROM wizards INNER JOIN wands ON wizards.id=wands.wizard_id"
      );
  }

  getWizardDetails(wizardId) {
    return this.connection
      .promise()
      .query(
        "SELECT * from wizards_classes_relationship INNER JOIN classes ON wizards_classes_relationship.class_id=classes.id  WHERE wizards_classes_relationship.wizard_id=?",
        [wizardId]
      );
  }
}

module.exports = Wizard;

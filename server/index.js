const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());
app.use(express.json());

// db
const db = mysql.createConnection({
    user: "root",
    host: "localhost",
    password: "",
    database: "ops",
}, console.log("connect to db ops"));

// insert contact
app.post("/creatcontact", (req, res) => {
    const compname = req.body.compname
    const taxid = req.body.taxid
    const name = req.body.name
    const tel = req.body.tel
    const address = req.body.address

    db.query("INSERT INTO contact (compname, taxid, name, tel, address) VALUES (?, ?, ?, ?, ?)", [compname, taxid, name, tel, address], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send("Data inserted")
        }
    })
})

// Setting Port
app.listen(3001, () => {
    console.log("Server is running on port 3001");
});

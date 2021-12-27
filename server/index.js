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
app.post("/createcontact", (req, res) => {
    const compname = req.body.compname
    const taxid = req.body.taxid
    const name = req.body.name
    const tel = req.body.tel
    const address = req.body.address

    db.query("INSERT INTO contact (compname, taxid, name, tel, address) VALUES (?, ?, ?, ?, ?)", [compname, taxid, name, tel, address], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send("Contact inserted")
        }
    })
})

// insert payment (Bank)
app.post("/createpayment", (req, res) => {
    const taxid = req.body.taxid
    const bankname = req.body.bankname
    const accname = req.body.accname
    const acctype = req.body.acctype
    const accno = req.body.accno
    const accbranch = req.body.accbranch

    db.query("INSERT INTO payment (taxid, bankname, accname, acctype, accno, accbranch) VALUES (?, ?, ?, ?, ?, ?)", [taxid, bankname, accname, acctype, accno, accbranch], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send("Payment inserted")
        }
    })
})

// insert coordinate 
app.post("/createcoordinate", (req, res) => {
    const taxid = req.body.taxid
    const name = req.body.name
    const email = req.body.email
    const tel = req.body.tel

    db.query("INSERT INTO coordinate (taxid, name, email, tel) VALUES (?, ?, ?, ?)", [taxid, name, email, tel], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send("Coordinate inserted")
        }
    })
})

// insert finance 
app.post("/createfinance", (req, res) => {
    const taxid = req.body.taxid
    const name = req.body.name
    const email = req.body.email
    const tel = req.body.tel

    db.query("INSERT INTO finance (taxid, name, email, tel) VALUES (?, ?, ?, ?)", [taxid, name, email, tel], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send("Finance inserted")
        }
    })
})

// Setting Port
app.listen(3001, () => {
    console.log("Server is running on port 3001");
});

// Express betöltése (webszerver létrehozásához)
const express = require("express");
const app = express();

// CORS engedélyezése (hogy máshonnan is el lehessen érni az API-t)
const cors = require("cors");

// MySQL betöltése
const mysql = require("mysql");

// JSON kérések feldolgozása
const bodyParser = require('body-parser');
app.use(bodyParser.json());

// CORS aktiválása
app.use(cors());

// Adatbázis kapcsolat beállítása
const db = mysql.createConnection({
    user: "root",
    host: "127.0.0.1",
    port: 3307,
    password: "",
    database: "kozutak",
}); 

// Teszt útvonal ellenőrzi hogy fut-e a backend
app.get("/", (req, res) => {
    res.send("Fut a backend!");
})

// Az API végpont lekéri az összes régiót az adatbázisból
app.get("/regiok", (req, res) => {
    const sql = "SELECT * FROM `regiok`";
    db.query(sql, (err, result) => {
        if (err) return res.json(err); // hiba esetén hibát ír ki
        return res.json(result);       // ha sikerült visszaadja az eredményt
    })
})
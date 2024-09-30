const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");
const Product = require("./model/product");
app.use(cors());

app.use(express.json());
app.get("/", (req, res) => {
  res.send("hello asool love u");
});
app.post("/pro", async (req, res) => {
  try {
    const product = await Product.create(req.body);
    // Product;

    res.status(200).json(product);
    console.log(error.massage);
  } catch (eroor) {}
  // console.log(req.body);
  // res.send(req.body);
});
app.put("/pro/:id", async (req, res) => {
  const { id } = req.params;
  const product = await Product.findByIdAndUpdate(id, req.body);
  if (!product) {
    res.status(500).json({ massage: "massage.eroor" });
  }
  res.status(500).json(product);
});
//// sign in page
app.get("/pro/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Product.findOne({ email: id });

    res.status(200).json(product);
  } catch (eroor) {
    res.status(500).json({ massage: massage.eroor });
  }
  // console.log(req.body);
  // res.send(req.body);
});

mongoose
  .connect(
    "mongodb+srv://ezzmasre:ezzmasre10@cluster0.jyhqr.mongodb.net/ezz?retryWrites=true&w=majority&appName=Cluster0"
  )
  .then(() => {
    console.log("conected to mogo");
    app.listen(3000, () => {
      console.log("fuker");
    });
  })
  .catch(() => {
    console.log("eroor");
  });

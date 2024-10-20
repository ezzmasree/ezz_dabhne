const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");
const Product = require("./model/product");
const nodemailer = require("nodemailer");
app.use(cors());

app.use(express.json());
///////////          for email
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "s12011015@stu.najah.edu", // Your Gmail account
    pass: "snrb bxxq soft kcyb", // Gmail app password
  },
});
app.post("/send-email", (req, res) => {
  const { to, subject, text } = req.body;

  const mailOptions = {
    from: "your-email@gmail.com",
    to,
    subject,
    text,
  };
  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      return res.status(500).send(error.toString());
    }
    res.status(200).send("Email sent: " + info.response);
  });
});

///////////////////////
app.get("/", (req, res) => {
  res.send("hello asool love u");
});

/////
app.post("/users", async (req, res) => {
  try {
    const product = await Product.create(req.body);
    // Product;

    res.status(200).json(product);
    console.log(error.massage);
  } catch (eroor) {}
});
////////

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

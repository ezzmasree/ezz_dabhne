const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  id: String,
  password: String,
  name: String,
  quantity: Number,
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;

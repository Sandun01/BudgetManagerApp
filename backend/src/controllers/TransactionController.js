import Transaction from "../models/TransactionModel.js";
import asyncHandler from "express-async-handler";

const createTransaction = asyncHandler(async (req, res) => {
  if (req.body) {
    const transaction = new Transaction(req.body);

    await transaction
      .save()
      .then((data) => {
        res
          .status(201)
          .send({
            success: true,
            message: "Transaction Created Successfully!",
          });
      })
      .catch((error) => {
        console.log(error);
        res.status(200).send({ success: false, message: error });
      });
  } else {
    res.status(400).send({ success: false, message: "No Data Found" });
  }
});

const getAllTransactions = asyncHandler(async (req, res) => {
  await Transaction.find({}).populate('category').populate('account')
    .then((data) => {
      res.status(200).send({ success: true, transactions: data });
    })
    .catch((error) => {
      console.log(error);
      res.status(200).send({ success: false, message: error });
    });
});

const deleteTransaction = asyncHandler(async (req, res) => {
  if (req.params.id) {
    const query = { _id: req.params.id };
    await Transaction.deleteOne(query)
      .then((data) => {
        res
          .status(200)
          .send({ success: true, message: "Deleted Successfully!" });
      })
      .catch((error) => {
        console.log(error);
        res.status(200).send({ success: false, message: error });
      });
  } else {
    res.status(200).send({ success: false, message: "ID Not Found!" });
  }
});

export default {
  createTransaction,
  getAllTransactions,
  deleteTransaction,
};

import Account from "../models/AccountModel.js";
import asyncHandler from "express-async-handler";

const createAccount = asyncHandler(async (req, res) => {
  if (req.body) {
    const account = new Account(req.body);

    await account
      .save()
      .then((data) => {
        res
          .status(201)
          .send({ success: true, message: "Created Successfully!" });
      })
      .catch((error) => {
        console.log(error);
        res.status(200).send({ success: false, message: error });
      });
  } else {
    res.status(400).send({ success: false, message: "No Data Found" });
  }
});

const getAllAccounts = asyncHandler(async (req, res) => {
  await Account.find({})
    .then((data) => {
      res.status(200).send({ success: true, accounts: data });
    })
    .catch((error) => {
      console.log(error);
      res.status(200).send({ success: false, message: error });
    });
});

const deleteAccount = asyncHandler(async (req, res) => {
  if (req.params.id) {
    const query = { _id: req.params.id };
    await Account.deleteOne(query)
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
  createAccount,
  getAllAccounts,
  deleteAccount,
};

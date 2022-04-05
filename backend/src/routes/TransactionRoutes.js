import express from "express";
import TransactionController from "../controllers/TransactionController.js";

const router = express.Router();

router
  .route("/")
  .post(TransactionController.createTransaction)
  .get(TransactionController.getAllTransactions);

router.route("/:id").delete(TransactionController.deleteTransaction);

export default router;
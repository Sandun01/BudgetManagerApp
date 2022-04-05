import express from "express";
import AccountController from "../controllers/AccountController.js";

const router = express.Router();

router
  .route("/")
  .post(AccountController.createAccount)
  .get(AccountController.getAllAccounts);

router.route("/:id").delete(AccountController.deleteAccount);

export default router;

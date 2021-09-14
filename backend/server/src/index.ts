import * as dotenv from "dotenv";
import express from "express";
import cors from "cors";
import helmet from "helmet";
import appConfig from "./app";

dotenv.config();

if (!process.env.PORT) {
  process.exit(1);
}

const PORT: number = parseInt(process.env.PORT as string, 10);

const app = appConfig.expressApp();

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});

import * as dotenv from "dotenv";
import helmet from "helmet";
import { Application } from "express";
import bodyParser from "body-parser";
import cors from "cors";
import express from "express";
import { BlockEventsController } from "./controller/block.events.controller";
import { BlockEventsService } from "./service/block.events.service";
import { handleErrors } from "./middleware/error-handler.middleware";
import { Client } from "@elastic/elasticsearch";
import { ElasticSearchClient } from "./middleware/elastic.search.client";
import { ElasticSearchController } from "./controller/elastic.search.controller";
import { ElasticSearchService } from "./service/elastic.search.service";

class App {
  private app: express.Application;
  private elasticSearchClient: Client;
  constructor() {
    this.app = express();
    this.elasticSearchClient = new ElasticSearchClient().client;
    this.setConfig(this.app);
    this.elasticSearchConfig(this.elasticSearchClient);
    this.setControllers(this.app, this.elasticSearchClient);
    this.setErrorHandlingMiddleware();
  }

  private elasticSearchConfig(elasticSearchClient: Client) {
    elasticSearchClient
      .info()
      .then(
        (
          response //console.log(JSON.stringify(response)))
        ) => console.log("elastic Search Client connected!!!")
      )
      .catch((error) => console.error(JSON.stringify(error)));
  }
  private setConfig(expressApp: express.Application) {
    expressApp.use(helmet());
    expressApp.use(cors());
    expressApp.use(express.json());
  }

  private setControllers(expressApp: express.Application, elasticSearchClient: Client) {
    const blockEventsController = new BlockEventsController(new BlockEventsService(elasticSearchClient));
    this.app.use("/block", blockEventsController.router);
    const elasticSearchController = new ElasticSearchController(new ElasticSearchService(elasticSearchClient));
    this.app.use("/eSearch", elasticSearchController.router);
  }
  private setErrorHandlingMiddleware() {
    this.app.use(handleErrors);
  }
  public expressApp() {
    return this.app;
  }
}

export default new App();

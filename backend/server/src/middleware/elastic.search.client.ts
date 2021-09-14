import { Client } from "@elastic/elasticsearch";
import { ELASTIC_SEARCH_INDEX } from "../common/constants";
import * as dotenv from "dotenv";
export class ElasticSearchClient {
  public client: Client;

  constructor() {
    dotenv.config();
    //Cloud Elastic Search
    /*const cloudClient = new Client({
      cloud: {
        id: "Cloud ID",
      },
      auth: {
        username: "username",
        password: "password",
      },
    });*/
    // Local Elastic Search
    this.client = new Client({
      node: process.env.ELASTIC_SEARCH_URL,
    });

    this.client.indices
      .create({ index: ELASTIC_SEARCH_INDEX })
      .then(
        (
          response //console.log("Created a new index.", JSON.stringify(response)))
        ) => console.log("Created a new index.")
      )
      .catch(
        (
          error //console.error(JSON.stringify(error)));
        ) => console.error("Index already exist.")
      );
  }
}

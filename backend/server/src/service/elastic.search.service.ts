import { NextFunction, Request, Response, Router } from "express";
import { BlockEventsService } from "./block.events.service";
import { ParamsDictionary } from "express-serve-static-core";
import { ParsedQs } from "qs";
import { Client } from "@elastic/elasticsearch";
import { ELASTIC_SEARCH_INDEX } from "../common/constants";

export class ElasticSearchService {
  private elasticSearchClient: Client;
  constructor(elasticSearchClient: Client) {
    this.elasticSearchClient = elasticSearchClient;
  }

  async search(req: Request<ParamsDictionary, any, any, ParsedQs, Record<string, any>>, res: Response<any, Record<string, any>>) {
    console.log(req.query);
    const { search } = req.query;
    const body = {
      index: ELASTIC_SEARCH_INDEX,
      //type: "_doc",
      body: {
        size: 200,
        from: 0,
        query: { match: { name: search } },
      },
    };
    await this.elasticSearchClient
      .search(body)
      .then((response) => {
        console.log(response);
        return res.send(response.body);
      })
      .catch((error) => console.error(JSON.stringify(error)));
  }
}

import { Client, RequestParams } from "@elastic/elasticsearch";
import { ParamsDictionary } from "express-serve-static-core";
import { ParsedQs } from "qs";
import { NextFunction, Request, Response, Router } from "express";
import { ELASTIC_SEARCH_INDEX } from "../common/constants";

export class BlockEventsService {
  private elasticSearchClient: Client;
  constructor(elasticSearchClient: Client) {
    this.elasticSearchClient = elasticSearchClient;
  }

  process(req: Request<ParamsDictionary, any, any, ParsedQs, Record<string, any>>) {
    const document: RequestParams.Index = {
      index: ELASTIC_SEARCH_INDEX,
      id: req.body.event.id,
      //type: "block",
      body: JSON.stringify(req.body.event.data.new),
    };
    this.elasticSearchClient
      .index(document)
      .then(
        (
          response //console.log("==============> Created a new index.", JSON.stringify(response)))
        ) => console.log("==============> Created a new index.")
      )
      .catch((error) => console.error(JSON.stringify(error)));
    console.log(req.body);
    //console.log(req.body.event.data.new);
    //throw new Error("Method not implemented.");
  }
}

import { NextFunction, Request, Response, Router } from "express";
import { BlockEventsService } from "../service/block.events.service";
import { ElasticSearchService } from "../service/elastic.search.service";

export class ElasticSearchController {
  public router = Router();
  private elasticSearchService: ElasticSearchService;

  constructor(private esService: ElasticSearchService) {
    this.setRoutes();
    this.elasticSearchService = esService;
  }

  public setRoutes() {
    this.router.get("/", this.search);
  }

  private search = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const result = await this.elasticSearchService.search(req, res);
      //res.send(result);
    } catch (e) {
      next(e);
    }
  };
}

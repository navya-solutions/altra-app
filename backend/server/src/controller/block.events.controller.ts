import { NextFunction, Request, Response, Router } from "express";
import { BlockEventsService } from "../service/block.events.service";

export class BlockEventsController {
  public router = Router();
  private blockEventsService: BlockEventsService;

  constructor(private beService: BlockEventsService) {
    this.setRoutes();
    this.blockEventsService = beService;
  }

  public setRoutes() {
    this.router.post("/block_events", this.process);
  }

  private process = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const result = await this.blockEventsService.process(req);
      res.send(result);
    } catch (e) {
      next(e);
    }
  };
}

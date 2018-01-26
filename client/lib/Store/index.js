import Accounts from "./accounts"
import Boards from "./boards"
import BaseStore from "./BaseStore"

export default class AppStore extends BaseStore {
  constructor(config) {
    super(config)
    this.accounts = new Accounts(config, this)
    this.boards = new Boards(config, this)
  }
}

import Accounts from "./accounts"
import Boards from "./boards"

export default class AppStore {
  constructor(config) {
    this.accounts = new Accounts(config, this)
    this.boards = new Boards(config, this)
  }
}

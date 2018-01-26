import { observable, computed, action } from "mobx"
import BaseStore from "./BaseStore"

export default class BoardsStore extends BaseStore {
  @observable messageMap = observable.map()

  @computed get messages() { return this.messageMap.values() }

  @action async load() {
    const response = await this.api.messages.show()
    console.log(response)
  }

  @action async post({ body }) {
    const response = await this.api.messages.post({ body })
    console.log(response)
  }
}

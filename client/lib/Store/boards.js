import { observable, computed, action } from "mobx"

export default class BoardsStore {
  @observable messageMap = observable.map()

  @computed get messages() { return this.messageMap.values() }

  constructor({ apiClient }) {
    this.api = apiClient
  }

  @action async load() {
    const response = await this.api.messages.show()
    console.log(response)
  }

  @action async post({ body }) {
    const response = await this.api.messages.post({ body })
    console.log(response)
  }
}

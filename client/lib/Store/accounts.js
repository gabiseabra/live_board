import { observable, computed, action } from "mobx"
import BaseStore from "./BaseStore"

export default class AccountsStore extends BaseStore {
  @observable currentUser = null
  @observable userMap = observable.map()

  @computed get users() { return this.userMap.values() }

  getUser(id) { return this.userMap.get(id) }

  @action async signUp({ name }) {
    const { data } = await this.api.users.create({ user: { name } })
    this.currentUser = data.id
    this.userMap.set(data.id, data)
  }
}

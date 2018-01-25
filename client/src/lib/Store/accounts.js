import { observable, computed, action } from "mobx"

export default class AccountsStore {
  @observable currentUser = null
  @observable userMap = observable.map()

  @computed get users() { return this.userMap.values() }
}

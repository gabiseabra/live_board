export default class BaseStore {
  constructor({ apiClient }, root) {
    this.store = root
    this.api = apiClient
  }
}

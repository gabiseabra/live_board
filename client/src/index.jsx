import React from "react"
import ReactDOM from "react-dom"
import { Provider } from "mobx-react"
import ApiClient from "./lib/ApiClient"
import Store from "./lib/Store"
import Shell from "./components/views/Shell"

const apiClient = new ApiClient("/api")

const store = new Store({ apiClient })

ReactDOM.render(
  <Provider store={store}>
    <Shell />
  </Provider>,
  document.getElementById("root")
)

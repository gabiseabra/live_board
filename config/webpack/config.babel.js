import path from "path"
import { createConfig, resolve, setContext, entryPoint, setOutput } from "webpack-blocks"
import blocks from "./blocks"

const context = path.join(__dirname, "../../")

const outputPath = path.join(context, "priv/static")

export default createConfig([
  setContext(context),
  entryPoint({
    vendor: [
      "babel-polyfill",
      "react",
      "react-dom",
      "mobx",
      "mobx-react"
    ],
    main: [
      "./client/index.jsx"
    ]
  }),
  setOutput({
    filename: "dist/[name].js",
    path: outputPath,
    publicPath: "/"
  }),
  resolve({
    extensions: [ ".html", ".js", ".jsx" ]
  }),
  ...blocks({ context, outputPath })
])

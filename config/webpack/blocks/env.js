import { env, devServer, sourceMaps, uglify } from "webpack-blocks"

export default ({ outputPath }) => [
  env("development", [
    devServer({
      contentBase: outputPath,
      publicPath: "/"
    }),
    sourceMaps()
  ]),
  env("production", [
    uglify()
  ])
]

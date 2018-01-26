import path from "path"
import CopyPlugin from "copy-webpack-plugin"
import HtmlPlugin from "html-webpack-plugin"
import { addPlugins } from "webpack-blocks"

export default ({ context }) => [
  addPlugins([
    new CopyPlugin([ { from: path.join(context, "client/static") } ], {
      ignore: [ "*.html" ]
    }),
    new HtmlPlugin({
      inject: true,
      template: path.join(context, "client/static/index.html")
    })
  ])
]

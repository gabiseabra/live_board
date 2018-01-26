import loaders from "./loaders"
import plugins from "./plugins"
import env from "./env"

export default options => [
  ...loaders(options),
  ...plugins(options),
  ...env(options)
]

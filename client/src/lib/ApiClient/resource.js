import _ from "lodash"

export async function index($) {
  return this.fetch($)
}

export async function show($, id) {
  return this.fetch(`${$}/${id}`)
}

export async function create($, data) {
  return this.fetch(`${$}`, {
    method: "POST",
    contentType: "application/json",
    body: JSON.stringify(data)
  })
}

const METHODS = { index, show, create }

export default function createResource(api, name, methods = null) {
  const result = methods ? _.pick(METHODS, methods) : { ...METHODS }
  return _.mapValues(result, fun => fun.bind(api, name))
}

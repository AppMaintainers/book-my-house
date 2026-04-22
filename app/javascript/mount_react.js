import { createRoot } from "react-dom/client"
import { createElement } from "react"
import * as components from "./components"

document.addEventListener("turbo:load", mountComponents)
document.addEventListener("DOMContentLoaded", mountComponents)

function mountComponents() {
  const nodes = document.querySelectorAll("[data-react-component]")

  nodes.forEach((node) => {
    const name = node.dataset.reactComponent
    const Component = components[name]

    if (!Component) {
      console.warn(`React component "${name}" not found`)
      return
    }

    const props = node.dataset.reactProps ? JSON.parse(node.dataset.reactProps) : {}
    const root = createRoot(node)
    root.render(createElement(Component, props))
  })
}

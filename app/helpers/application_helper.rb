module ApplicationHelper
  def react_component(name, props = {})
    tag.div(data: { react_component: name, react_props: props.to_json })
  end
end

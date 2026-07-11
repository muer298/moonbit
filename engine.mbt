///| Public layout engine entry point.

///| Run a layout algorithm and return a layout report.
pub fn layout(graph : Graph, options : LayoutOptions) -> LayoutReport {
  let warnings = validate_graph(graph)
  match options.algorithm {
    Fixed => layout_fixed(graph, warnings)
    Grid => layout_grid(graph, options, warnings)
    Tree => layout_tree(graph, options, warnings)
    Layered => layout_layered(graph, options, warnings)
  }
}

///| Convenience API: run grid layout.
pub fn layout_grid_default(graph : Graph) -> LayoutReport {
  layout(graph, grid_options(3))
}

///| Convenience API: run simplified layered layout.
pub fn layout_layered_default(graph : Graph) -> LayoutReport {
  layout(graph, layered_options())
}

///| Grid / box layout.
///|
///| Nodes are placed in row-major order. This is useful as a deterministic
///| fallback and for examples where no graph structure is available.

fn normalize_columns(columns : Int) -> Int {
  if columns <= 0 { 1 } else { columns }
}

fn layout_grid(
  graph : Graph,
  options : LayoutOptions,
  warnings : Array[String]
) -> LayoutReport {
  let columns = normalize_columns(options.columns)
  let nodes : Array[Node] = []

  for index, node in graph.nodes {
    let col = index % columns
    let row = index / columns
    let x = options.origin_x + col.to_double() * (node.width + options.spacing_x)
    let y = options.origin_y + row.to_double() * (node.height + options.spacing_y)
    nodes.push({ ..node, x, y })
  }

  let (edges, routed_edges) = route_edges(nodes, graph.edges)
  {
    graph: { ..graph, nodes, edges },
    warnings,
    changed_nodes: nodes.length(),
    routed_edges,
  }
}

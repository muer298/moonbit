///|
/// Fixed layout keeps user-supplied coordinates and only routes edges.
fn layout_fixed(graph : Graph, warnings : Array[String]) -> LayoutReport {
  let (edges, routed_edges) = route_edges(graph.nodes, graph.edges)
  { graph: { ..graph, edges, }, warnings, changed_nodes: 0, routed_edges }
}

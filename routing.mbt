///| Simple edge routing.

///|

///| MVP routing creates a two-point polyline from source center to target

///|
/// center. Later versions can add orthogonal routing and ELK-style sections.
fn route_edge(nodes : Array[Node], edge : Edge) -> Edge {
  match (find_node(nodes, edge.source), find_node(nodes, edge.target)) {
    (Some(source), Some(target)) =>
      { ..edge, points: [node_center(source), node_center(target)] }
    _ => edge
  }
}

///|
fn route_edges(nodes : Array[Node], edges : Array[Edge]) -> (Array[Edge], Int) {
  let routed : Array[Edge] = []
  let mut count = 0
  for edge in edges {
    let edge2 = route_edge(nodes, edge)
    if edge2.points.length() > 0 {
      count = count + 1
    }
    routed.push(edge2)
  }
  (routed, count)
}

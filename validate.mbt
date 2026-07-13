///| Validation helpers for graph input.

///|
/// Validate duplicated ids and missing edge endpoints.
pub fn validate_graph(graph : Graph) -> Array[String] {
  let warnings : Array[String] = []

  for i, node in graph.nodes {
    for j, other in graph.nodes {
      if i < j && node.id == other.id {
        warnings.push("duplicate node id: \{node.id}")
      }
    }
  }

  for edge in graph.edges {
    if find_node_index(graph.nodes, edge.source) < 0 {
      warnings.push("edge \{edge.id} has missing source: \{edge.source}")
    }
    if find_node_index(graph.nodes, edge.target) < 0 {
      warnings.push("edge \{edge.id} has missing target: \{edge.target}")
    }
  }

  warnings
}

///| A lightweight cycle warning for the simplified layered algorithm.

///|

///| The algorithm itself is defensive and runs a bounded relaxation pass.

///| This helper is intentionally conservative: it warns when every node has

///|
/// an incoming edge, which is a common sign of a directed cycle in small DAGs.
fn cycle_like_warning(graph : Graph) -> Array[String] {
  let warnings : Array[String] = []
  if graph.nodes.length() > 0 && root_indices(graph).length() == 0 {
    warnings.push(
      "no root node found; input may contain a directed cycle or only cyclic components",
    )
  }
  warnings
}

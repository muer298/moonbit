///| Linear lookup helpers.

///|

///| The MVP deliberately uses simple arrays and linear scans. This keeps the

///| implementation easy to audit and avoids depending on advanced data

///| structures before the public API stabilizes.

///|
/// Return the index of a node id, or -1 when not found.
pub fn find_node_index(nodes : Array[Node], id : String) -> Int {
  for index, node in nodes {
    if node.id == id {
      return index
    }
  }
  -1
}

///|
/// Return a node by id.
pub fn find_node(nodes : Array[Node], id : String) -> Node? {
  for node in nodes {
    if node.id == id {
      return Some(node)
    }
  }
  None
}

///|
/// Count nodes that appear before `index` and have the same level.
fn position_in_level(levels : Array[Int], index : Int) -> Int {
  let level = levels[index]
  let mut pos = 0
  for i in 0..<index {
    if levels[i] == level {
      pos = pos + 1
    }
  }
  pos
}

///|
/// Return true when `id` is used as the target of at least one edge.
fn has_incoming_edge(graph : Graph, id : String) -> Bool {
  for edge in graph.edges {
    if edge.target == id {
      return true
    }
  }
  false
}

///|
/// Return root candidate indices: nodes with no incoming edge.
fn root_indices(graph : Graph) -> Array[Int] {
  let roots : Array[Int] = []
  for index, node in graph.nodes {
    if !has_incoming_edge(graph, node.id) {
      roots.push(index)
    }
  }
  roots
}

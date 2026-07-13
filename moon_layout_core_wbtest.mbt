///|
/// White-box tests for the MVP implementation.
test "construct graph" {
  let graph = new_graph("g")
  let graph = add_node(graph, new_node("a", 80.0, 40.0))
  let graph = add_node(graph, new_node("b", 80.0, 40.0))
  let graph = add_edge(graph, new_edge("e1", "a", "b"))
  assert_eq(graph.nodes.length(), 2)
  assert_eq(graph.edges.length(), 1)
}

///|
test "grid layout places nodes row major" {
  let graph = new_graph("grid")
  let graph = add_node(graph, new_node("a", 80.0, 40.0))
  let graph = add_node(graph, new_node("b", 80.0, 40.0))
  let graph = add_node(graph, new_node("c", 80.0, 40.0))
  let report = layout(graph, grid_options(2))
  assert_eq(report.graph.nodes[0].x, 0.0)
  assert_eq(report.graph.nodes[0].y, 0.0)
  assert_eq(report.graph.nodes[1].x, 120.0)
  assert_eq(report.graph.nodes[1].y, 0.0)
  assert_eq(report.graph.nodes[2].x, 0.0)
  assert_eq(report.graph.nodes[2].y, 80.0)
}

///|
test "layered layout follows edge direction" {
  let graph = new_graph("dag")
  let graph = add_node(graph, new_node("a", 80.0, 40.0))
  let graph = add_node(graph, new_node("b", 80.0, 40.0))
  let graph = add_node(graph, new_node("c", 80.0, 40.0))
  let graph = add_edge(graph, new_edge("e1", "a", "b"))
  let graph = add_edge(graph, new_edge("e2", "b", "c"))
  let report = layout(graph, layered_options())
  assert_eq(report.graph.nodes[0].x, 0.0)
  assert_eq(report.graph.nodes[1].x, 120.0)
  assert_eq(report.graph.nodes[2].x, 240.0)
}

///|
test "validation catches missing endpoint" {
  let graph = new_graph("bad")
  let graph = add_node(graph, new_node("a", 80.0, 40.0))
  let graph = add_edge(graph, new_edge("e1", "a", "missing"))
  let report = layout(graph, fixed_options())
  assert_eq(report.warnings.length(), 1)
}

///|
test "fixed layout routes edge without moving nodes" {
  let graph = new_graph("fixed")
  let graph = add_node(graph, new_node_at("a", 80.0, 40.0, 10.0, 20.0))
  let graph = add_node(graph, new_node_at("b", 80.0, 40.0, 200.0, 20.0))
  let graph = add_edge(graph, new_edge("e1", "a", "b"))
  let report = layout(graph, fixed_options())
  assert_eq(report.graph.nodes[0].x, 10.0)
  assert_eq(report.routed_edges, 1)
  assert_eq(report.graph.edges[0].points.length(), 2)
}

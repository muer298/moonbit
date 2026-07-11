///| ELK JSON compatible subset exporter.
///|
///| The first MVP exports the internal graph model to a small ELK-style JSON
///| shape. Full import/parsing support is planned for the next iteration.

///| Convert a point to JSON.
pub fn point_to_json(point : Point) -> Json {
  { "x": point.x, "y": point.y }
}

///| Convert a node to an ELK-style JSON object.
pub fn node_to_elk_json(node : Node) -> Json {
  let children : Array[Json] = [for child in node.children => node_to_elk_json(child)]
  {
    "id": node.id,
    "width": node.width,
    "height": node.height,
    "x": node.x,
    "y": node.y,
    "children": children,
  }
}

///| Convert an edge to an ELK-style JSON object.
pub fn edge_to_elk_json(edge : Edge) -> Json {
  let points : Array[Json] = [for point in edge.points => point_to_json(point)]
  {
    "id": edge.id,
    "sources": [edge.source],
    "targets": [edge.target],
    "points": points,
  }
}

///| Convert a graph to an ELK-style JSON object.
pub fn graph_to_elk_json(graph : Graph) -> Json {
  let children : Array[Json] = [for node in graph.nodes => node_to_elk_json(node)]
  let edges : Array[Json] = [for edge in graph.edges => edge_to_elk_json(edge)]
  { "id": graph.id, "children": children, "edges": edges }
}

///| Current importer status.
///|
///| Kept as a public API marker so README examples and TODO tracking stay
///| aligned with the implementation.
pub fn elk_json_import_status() -> String {
  "planned: parse ELK JSON subset into Graph in v0.2"
}

///| Constructors and small helpers for the public graph model.

///|
/// Construct a point.
pub fn new_point(x : Double, y : Double) -> Point {
  { x, y }
}

///|
/// Construct a size.
pub fn new_size(width : Double, height : Double) -> Size {
  { width, height }
}

///|
/// Construct a node at the origin.
pub fn new_node(id : String, width : Double, height : Double) -> Node {
  { id, width, height, x: 0.0, y: 0.0, children: [] }
}

///|
/// Construct a node with an explicit position.
pub fn new_node_at(
  id : String,
  width : Double,
  height : Double,
  x : Double,
  y : Double,
) -> Node {
  { id, width, height, x, y, children: [] }
}

///|
/// Construct an edge with no routed points.
pub fn new_edge(id : String, source : String, target : String) -> Edge {
  { id, source, target, points: [] }
}

///|
/// Construct an empty graph.
pub fn new_graph(id : String) -> Graph {
  { id, nodes: [], edges: [] }
}

///|
/// Add a node and return a new graph value.
pub fn add_node(graph : Graph, node : Node) -> Graph {
  { ..graph, nodes: [..graph.nodes, node] }
}

///|
/// Add an edge and return a new graph value.
pub fn add_edge(graph : Graph, edge : Edge) -> Graph {
  { ..graph, edges: [..graph.edges, edge] }
}

///|
/// Default options for grid layout.
pub fn default_options() -> LayoutOptions {
  {
    algorithm: Grid,
    origin_x: 0.0,
    origin_y: 0.0,
    spacing_x: 40.0,
    spacing_y: 40.0,
    columns: 3,
  }
}

///|
/// Options for fixed layout.
pub fn fixed_options() -> LayoutOptions {
  { ..default_options(), algorithm: Fixed }
}

///|
/// Options for grid layout.
pub fn grid_options(columns : Int) -> LayoutOptions {
  { ..default_options(), algorithm: Grid, columns }
}

///|
/// Options for tree layout.
pub fn tree_options() -> LayoutOptions {
  { ..default_options(), algorithm: Tree, columns: 1 }
}

///|
/// Options for simplified layered DAG layout.
pub fn layered_options() -> LayoutOptions {
  { ..default_options(), algorithm: Layered, columns: 1 }
}

///|
/// Center point of a node.
pub fn node_center(node : Node) -> Point {
  { x: node.x + node.width / 2.0, y: node.y + node.height / 2.0 }
}

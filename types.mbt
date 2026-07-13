///| Basic geometry and graph model types for Moon Layout Core.

///|

///| The MVP intentionally keeps the public data model small and explicit.

///| Later versions can add ports, labels, hierarchy options and richer edge

///| routing without breaking the top-level `Graph -> Graph` layout workflow.

///|
/// A 2D point in layout coordinates.
pub(all) struct Point {
  x : Double
  y : Double
} derive(Debug)

///|
/// A rectangular size.
pub(all) struct Size {
  width : Double
  height : Double
} derive(Debug)

///| A graph node.

///|

///| `children` is included so that a future ELK JSON subset can represent

///|
/// nested graphs. The first MVP algorithms treat only top-level nodes.
pub(all) struct Node {
  id : String
  width : Double
  height : Double
  x : Double
  y : Double
  children : Array[Node]
} derive(Debug)

///|
/// A routed edge. `points` contains a simple polyline after layout.
pub(all) struct Edge {
  id : String
  source : String
  target : String
  points : Array[Point]
} derive(Debug)

///|
/// A graph with top-level nodes and edges.
pub(all) struct Graph {
  id : String
  nodes : Array[Node]
  edges : Array[Edge]
} derive(Debug)

///|
/// Supported MVP layout algorithms.
pub(all) enum LayoutAlgorithm {
  Fixed
  Grid
  Tree
  Layered
} derive(Debug)

///|
/// Layout options shared by the MVP algorithms.
pub(all) struct LayoutOptions {
  algorithm : LayoutAlgorithm
  origin_x : Double
  origin_y : Double
  spacing_x : Double
  spacing_y : Double
  columns : Int
} derive(Debug)

///|
/// Layout execution report.
pub(all) struct LayoutReport {
  graph : Graph
  warnings : Array[String]
  changed_nodes : Int
  routed_edges : Int
} derive(Debug)

///| Tree layout.
///|
///| The MVP tree layout reuses the simplified level computation from the
///| layered layout. It is deterministic and works well for directed trees and
///| small DAG-like examples.

fn layout_tree(
  graph : Graph,
  options : LayoutOptions,
  warnings : Array[String]
) -> LayoutReport {
  let levels = compute_longest_path_levels(graph)
  layout_by_levels(graph, options, levels, warnings)
}

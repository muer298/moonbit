///| Simplified layered DAG layout.
///|
///| This is not a full ELK Layered implementation. The MVP computes a rough
///| longest-path layer by bounded relaxation, then places nodes by layer.
///| Crossing minimization, ports, labels, compound graphs and advanced edge
///| routing are explicit future work.

fn compute_longest_path_levels(graph : Graph) -> Array[Int] {
  let levels : Array[Int] = [for _node in graph.nodes => 0]

  // Bounded relaxation. On a DAG this converges to longest path levels.
  // On cyclic input it remains bounded by the node count and emits a warning.
  for _pass in 0..<graph.nodes.length() {
    for edge in graph.edges {
      let source_index = find_node_index(graph.nodes, edge.source)
      let target_index = find_node_index(graph.nodes, edge.target)
      if source_index >= 0 && target_index >= 0 {
        let candidate = levels[source_index] + 1
        if candidate > levels[target_index] {
          levels[target_index] = candidate
        }
      }
    }
  }

  levels
}

fn layout_by_levels(
  graph : Graph,
  options : LayoutOptions,
  levels : Array[Int],
  warnings : Array[String]
) -> LayoutReport {
  let nodes : Array[Node] = []

  for index, node in graph.nodes {
    let level = levels[index]
    let pos = position_in_level(levels, index)
    let x = options.origin_x + level.to_double() * (node.width + options.spacing_x)
    let y = options.origin_y + pos.to_double() * (node.height + options.spacing_y)
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

fn layout_layered(
  graph : Graph,
  options : LayoutOptions,
  warnings : Array[String]
) -> LayoutReport {
  let levels = compute_longest_path_levels(graph)
  let all_warnings = [..warnings, ..cycle_like_warning(graph)]
  layout_by_levels(graph, options, levels, all_warnings)
}

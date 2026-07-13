///| Human-readable summaries for demos.

///|
/// Return a compact graph summary.
pub fn graph_summary(graph : Graph) -> String {
  "Graph(\{graph.id}, nodes=\{graph.nodes.length()}, edges=\{graph.edges.length()})"
}

///|
/// Return a compact report summary.
pub fn report_summary(report : LayoutReport) -> String {
  "LayoutReport(nodes=\{report.changed_nodes}, routed_edges=\{report.routed_edges}, warnings=\{report.warnings.length()})"
}

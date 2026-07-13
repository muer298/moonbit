///|
fn main {
  let graph = @layout.new_graph("demo")
  let graph = @layout.add_node(graph, @layout.new_node("start", 80.0, 40.0))
  let graph = @layout.add_node(graph, @layout.new_node("parse", 80.0, 40.0))
  let graph = @layout.add_node(graph, @layout.new_node("layout", 80.0, 40.0))
  let graph = @layout.add_edge(graph, @layout.new_edge("e1", "start", "parse"))
  let graph = @layout.add_edge(graph, @layout.new_edge("e2", "parse", "layout"))
  let report = @layout.layout(graph, @layout.layered_options())
  println(@layout.graph_summary(report.graph))
  println(@layout.report_summary(report))
}

# Moon Layout Core

Moon Layout Core 是一个面向 MoonBit 生态的轻量图布局核心库，目标是为流程图、状态机、数据流图、IDE/可视化工具和 WebAssembly 场景提供可复用的基础布局能力。

本项目参考 Eclipse Layout Kernel（ELK）的图模型思想和 JSON 交换格式，但不完整复刻 ELK 的 Java 插件体系和全部算法。MVP 聚焦在 MoonBit 生态当前最需要、也最容易验收的核心子集：

- 图数据模型：`Graph`、`Node`、`Edge`、`Point`、`LayoutOptions`
- 统一布局入口：`layout(graph, options)`
- 布局算法：`fixed`、`grid`、`tree`、简化 `layered` DAG
- ELK JSON 子集导出：`graph_to_elk_json(graph)`
- 基础校验、简单边路由、示例和测试

> 项目定位：轻量图布局核心库，不是完整 ELK 移植。

## Quick Start

先把模块名替换成你自己的 MoonBit 用户名：

```toml
# moon.mod
name = "yourname/moon-layout-core"
```

然后同步修改 `cmd/demo/moon.pkg` 里的 import 路径。

运行检查：

```bash
moon check
moon test
moon run cmd/demo
```

## Example

```moonbit
let graph = new_graph("demo")
let graph = add_node(graph, new_node("start", 80.0, 40.0))
let graph = add_node(graph, new_node("parse", 80.0, 40.0))
let graph = add_node(graph, new_node("layout", 80.0, 40.0))
let graph = add_edge(graph, new_edge("e1", "start", "parse"))
let graph = add_edge(graph, new_edge("e2", "parse", "layout"))
let report = layout(graph, layered_options())
println(report_summary(report))
```

## MVP Algorithms

### Fixed

保留节点已有坐标，只根据节点中心点生成简单边路线。

### Grid / Box

按节点顺序进行行优先网格布局，适合作为默认展示、调试和无结构图的兜底布局。

### Tree

基于有向边计算层级并进行树形排列。MVP 适合有向树和小型 DAG。

### Layered DAG

基于最长路径的简化分层布局。MVP 不包含完整 ELK Layered 的交叉最小化、端口约束、标签布局、复合节点和复杂边路由。

## ELK JSON Subset

当前支持导出一个小型 ELK 风格 JSON 对象：

```json
{
  "id": "demo",
  "children": [
    { "id": "start", "width": 80, "height": 40, "x": 0, "y": 0 }
  ],
  "edges": [
    { "id": "e1", "sources": ["start"], "targets": ["parse"] }
  ]
}
```

下一步计划补充 JSON import、pretty print 和 golden tests。

## Project Status

当前版本是申报和验收导向的 MVP 初稿：

- [x] 仓库结构
- [x] 公共数据模型
- [x] fixed/grid/tree/layered MVP
- [x] 基础测试
- [x] ELK JSON 子集导出 API
- [x] README / 设计文档 / 移植说明
- [ ] 本地 `moon check` 后按具体编译器版本修正语法细节
- [ ] mooncakes.io 发布
- [ ] Gitlink 同步

## Non-goals

短期内不承诺：

- 完整移植 Eclipse Layout Kernel
- 与 ELK / elkjs 完全兼容
- 完整 Layered 算法
- Force / Stress / Radial 等复杂算法
- 端口约束、标签布局、复合图布局、复杂边路由
- Graph Text / ELK Text 完整解析

## License

Apache-2.0。

本项目没有复制 ELK 上游源码。若后续直接移植 ELK 源码或测试用例，需要重新审查 Eclipse Public License 2.0 及相关第三方许可证要求。

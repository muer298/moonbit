# Moon Layout Core

Moon Layout Core 是一个面向 MoonBit 生态的轻量图布局核心库，参考 ELK 的图模型思想和 JSON 交换方式，使用 MoonBit 原生类型系统重新实现。

## 已完成

- MoonBit 模块及许可证
- `Point`、`Size`、`Node`、`Edge`、`Graph`
- `LayoutAlgorithm`、`LayoutOptions`、`LayoutReport`
- 图、节点、边和布局选项构造函数

## Graph Model Example

```moonbit
let graph = new_graph("demo")
let graph = add_node(graph, new_node("start", 80.0, 40.0))
let graph = add_node(graph, new_node("end", 80.0, 40.0))
let graph = add_edge(graph, new_edge("e1", "start", "end"))
```

## 下一步

增加节点查找、重复 ID 与缺失端点校验。

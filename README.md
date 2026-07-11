# Moon Layout Core

Moon Layout Core 是一个面向 MoonBit 生态的轻量图布局核心库，支持统一布局 API、四类基础布局和 ELK JSON 子集导出。

## Quick Start

先将 `moon.mod.json` 和 `cmd/demo/moon.pkg` 中的模块名替换为你的实际 MoonBit 模块名，然后运行：

```bash
moon check
moon run cmd/demo
```

## ELK JSON Subset

```moonbit
let json = graph_to_elk_json(report.graph)
```

当前导出节点 ID、尺寸、坐标、层级子节点、边的 source/target 和路由点。JSON 导入与 pretty print 将在下一阶段补充。

## Demo

`cmd/demo` 构造一个三节点有向图，执行简化 Layered 布局，并输出图和布局报告摘要。

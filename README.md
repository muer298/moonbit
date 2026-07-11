# Moon Layout Core

Moon Layout Core 现在提供统一的布局入口：

```moonbit
let report = layout(graph, layered_options())
```

## 支持算法

- `Fixed`：保留现有坐标
- `Grid`：确定性网格排列
- `Tree`：按有向边层级进行树形排列
- `Layered`：简化 DAG 分层布局

布局执行前会运行输入校验，并在 `LayoutReport` 中返回警告、变更节点数量和成功路由的边数量。

下一步将增加 ELK JSON 子集导出和命令行演示。

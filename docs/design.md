# Design Notes

## Goal

Moon Layout Core 提供一个 MoonBit 原生的轻量图布局核心库。它优先服务于以下场景：

- 流程图、状态机、数据流图预布局
- IDE 插件、低代码编辑器和可视化工具中的基础布局
- WebAssembly / JS 后端中可复用的图布局逻辑
- MoonBit 生态中的图算法和可视化基础设施

## Public Model

核心模型保持小而稳定：

```text
Graph
  id: String
  nodes: Array[Node]
  edges: Array[Edge]

Node
  id: String
  width/height: Double
  x/y: Double
  children: Array[Node]

Edge
  id/source/target: String
  points: Array[Point]
```

`children` 用于未来支持 ELK JSON 中的嵌套图，但 MVP 算法只处理顶层节点。

## Algorithm Boundary

MVP 算法以确定性和可测试为优先级：

- fixed：保留坐标，路由边
- grid：按节点顺序网格排布
- tree：按边方向分层排布
- layered：最长路径分层，暂不做完整交叉最小化

这不是 ELK Layered 的完整实现。完整 ELK Layered 涉及层分配、节点排序、端口约束、标签布局、边路由、复合图等大量策略，MVP 明确不承诺。

## Validation

当前校验覆盖：

- 重复节点 id
- 边 source/target 缺失
- 无 root 的 cycle-like 警告

后续可增加：

- 真实 DAG cycle detection
- 节点尺寸合法性
- 端口和标签一致性
- JSON schema 验证

## JSON Strategy

第一版提供 ELK JSON 子集导出。第二版补 import 和 pretty print，使 examples 可以形成 golden tests。

目标不是 100% 兼容 ELK，而是让 MoonBit 项目可以用熟悉的 ELK 风格数据交换格式对接前端渲染器或后续工具链。

# Moon Layout Core

Moon Layout Core 已实现 Fixed、Grid 和简化 Layered DAG 三类布局核心逻辑。

## Simplified Layered DAG

当前实现使用有界松弛计算近似最长路径层级，然后按照“层级 + 层内顺序”放置节点。算法适合有向无环图和小型流程图。

明确不包含：

- 完整交叉最小化
- 端口约束与标签布局
- 复合节点
- ELK Layered 的全部策略
- 复杂正交边路由

下一步将补充 Tree 包装器和统一布局入口。

# Moon Layout Core

Moon Layout Core 是一个面向 MoonBit 生态的轻量图布局核心库。

## 当前能力

- 图模型和构造函数
- 按节点 ID 查找节点及索引
- 根节点候选识别
- 重复节点 ID 检查
- 边源节点、目标节点缺失检查
- 对简化分层布局提供环状输入提示

```moonbit
let warnings = validate_graph(graph)
```

下一步将实现 Fixed 布局和基础边路由。

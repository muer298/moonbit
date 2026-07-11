# Moon Layout Core

Moon Layout Core 是一个面向 MoonBit 生态的轻量图布局核心库。

## Quick Start

```bash
moon check
moon test
moon run cmd/demo
```

## 当前测试

- 图模型构造与节点/边数量
- Grid 行优先坐标结果
- Layered 沿边方向分层
- 缺失边端点告警
- Fixed 保留坐标并完成基础路由

`examples/` 提供简单图、树和 DAG 的 ELK 风格 JSON 样例，后续用于 JSON 导入和 golden tests。

下一步补齐设计文档、CI 和验收材料。

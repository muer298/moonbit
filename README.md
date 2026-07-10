# Moon Layout Core

Moon Layout Core 是一个面向 MoonBit 生态的轻量图布局核心库，计划为流程图、状态机、数据流图、IDE 插件和 Web 可视化工具提供可复用的基础布局能力。

本项目参考 Eclipse Layout Kernel（ELK）的图模型思想和 JSON 交换方式，但不完整复刻 ELK 的 Java/Eclipse 插件体系，也不复制上游源码。

## 当前阶段

- [x] 初始化 MoonBit 模块和仓库元数据
- [x] 添加开源许可证与第三方项目说明
- [ ] 实现图数据模型
- [ ] 实现基础布局算法
- [ ] 增加测试、示例和 CI

## Planned API

```moonbit
let graph = new_graph("demo")
let report = layout(graph, grid_options(3))
```

## License

Apache-2.0。

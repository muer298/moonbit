# Moon Layout Core

Moon Layout Core 是面向 MoonBit 的轻量图布局核心库。

## 已实现布局

### Fixed

保留节点已有坐标并生成基础边路线。

### Grid / Box

按节点输入顺序进行行优先网格排列，支持设置列数、原点和水平/垂直间距。该算法具有确定性，适合作为无结构图的默认布局和调试兜底方案。

下一步将实现简化 Layered DAG 布局。

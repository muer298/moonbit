# Porting Notes

## Relation to ELK

Moon Layout Core 参考 Eclipse Layout Kernel 的图布局生态定位、图模型思想和 JSON 交换格式，但 MVP 不是完整移植。

## What is intentionally different

- 不复刻 Java / Eclipse / OSGi 插件工程结构。
- 不移植完整 ELK Layered 策略集合。
- 不处理 Eclipse UI、SWT/JFace、桌面插件依赖。
- 不承诺与 elkjs 输出完全一致。
- 优先提供 MoonBit 原生类型、测试和包结构。

## MVP compatibility target

MVP 的 ELK JSON 子集聚焦以下字段：

- graph: `id`, `children`, `edges`
- node: `id`, `width`, `height`, `x`, `y`, `children`
- edge: `id`, `sources`, `targets`, `points`

## License note

MVP 未复制 ELK 源码，当前项目使用 Apache-2.0。若未来直接移植 ELK 代码，应重新评估 EPL-2.0 的许可证要求，并在仓库中补充完整 notice。

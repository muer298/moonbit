# Moon Layout Core 项目申报书

## 基本信息

项目名称：Moon Layout Core：ELK JSON 子集兼容的 MoonBit 轻量图布局核心库

参赛者：请填写你的姓名 / 昵称

联系方式：请填写手机号 / 邮箱 / 微信

GitHub 仓库链接：https://github.com/YOUR_GITHUB_USERNAME/moon-layout-core

Gitlink 仓库链接：请填写同步后的 Gitlink 仓库链接

项目方向：MoonBit 图布局基础库 / 图可视化基础设施 / ELK JSON 子集兼容工具

是否为移植或参考项目：参考成熟开源项目，不完整移植

## 项目简介

Moon Layout Core 面向 MoonBit 生态中的流程图、状态机、数据流图、IDE 插件、低代码编辑器和可视化分析工具，提供一个轻量、可复用、可测试的图布局核心库。项目参考 Eclipse Layout Kernel 的图模型思想和 JSON 交换格式，但不完整复刻 ELK 的 Java 插件体系和全部算法，而是优先实现适合 MoonBit 当前生态阶段使用的核心子集。

本项目希望补齐 MoonBit 生态中图可视化基础设施不足的问题，让开发者可以在 MoonBit 中直接构建图模型、执行基础布局、导出 ELK 风格 JSON，并进一步对接 Web、CLI、IDE 或可视化渲染场景。

## 核心功能范围

1. 提供 MoonBit 原生图模型，包括 `Graph`、`Node`、`Edge`、`Point`、`LayoutOptions` 等核心类型。
2. 提供统一布局入口 `layout(graph, options)`，根据算法选项分发到不同布局器。
3. 实现 `Fixed` 布局：保留已有坐标并生成基础边路线。
4. 实现 `Grid / Box` 布局：按节点顺序进行确定性网格排列。
5. 实现 `Tree` 布局：面向树形结构和小型 DAG 的层级排列。
6. 实现简化版 `Layered DAG` 布局：基于最长路径分层，支持基础有向图展示。
7. 提供 ELK JSON 子集导出能力，便于和前端渲染器或现有图工具链交换数据。
8. 提供 README、示例 JSON、测试用例、CI 配置、设计说明和移植说明。

## 参考项目与差异说明

参考项目名称：Eclipse Layout Kernel（ELK）

参考项目链接：https://github.com/eclipse-elk/elk

参考项目许可证：Eclipse Public License 2.0

本项目许可证：Apache-2.0

本项目不复制 ELK 上游源码，主要参考其图模型和布局交换格式思想。与 ELK 相比，本项目会做以下简化和重新设计：

- 使用 MoonBit 原生包结构、类型系统和测试方式组织代码；
- 不复刻 Eclipse UI、OSGi、SWT/JFace 等桌面插件体系；
- 不承诺完整实现 ELK Layered 的全部选项和策略；
- 优先实现 fixed、grid、tree、简化 layered 等可验收、可复用的核心布局能力；
- 以 MoonBit API 和 ELK JSON 子集为主要交付接口。

## 最终交付

项目完成后将交付公开 GitHub/Gitlink 仓库、MoonBit 源码、测试用例、CI、README、示例 JSON、设计文档、移植说明和限制说明。验收阶段重点展示项目的可运行性、工程结构、测试覆盖、文档质量和对 MoonBit 图可视化生态的复用价值。

# Limitations

当前版本是申报和验收导向的 MVP，不是生产级完整图布局系统。

## Known limitations

- `layered` 仅是简化 DAG 分层布局。
- 暂不支持完整 cycle detection。
- 暂不支持端口约束、标签布局、复合图布局。
- 暂不支持高级 crossing minimization。
- 边路由只是 source center 到 target center 的两点 polyline。
- ELK JSON 当前以导出为主，import 在 v0.2 计划中。

## Acceptance-oriented scope

验收阶段重点展示：

- MoonBit 原生图模型
- 可运行的布局入口
- 4 个确定性 MVP 算法
- 测试、示例、README 和 CI
- 清晰边界和后续计划

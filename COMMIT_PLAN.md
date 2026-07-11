# 10-Commit Plan

本仓库按以下 10 个实际功能阶段提交。每次提交都对应独立的代码、测试或工程交付，不使用空提交、重复文件或无意义拆分。

1. `chore: initialize MoonBit module and repository metadata`
2. `feat: add graph model and constructors`
3. `feat: add graph lookup and validation`
4. `feat: add fixed layout and basic edge routing`
5. `feat: add deterministic grid layout`
6. `feat: add simplified layered DAG layout`
7. `feat: add tree layout and unified layout engine`
8. `feat: add ELK JSON export and demo command`
9. `test: add core layout tests and example graphs`
10. `docs: add CI, design docs and application materials`

每次提交前应运行当时可运行的检查；从第 7 次提交起至少运行 `moon check`，从第 9 次提交起运行 `moon test`，第 10 次提交检查 CI 与文档链接。

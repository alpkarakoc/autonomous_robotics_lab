# Traceability Matrix

This document maps project requirements to quality attributes and verification evidence.

| ID | Requirement | Quality Attribute | Verification Method | Evidence |
|---|---|---|---|---|
| FR-1 | Maintain a ROS 2 workspace under version control | Maintainability, Traceability | Git repository inspection | git log, git status |
| FR-2 | Ignore generated ROS 2 build artifacts | Maintainability, Reliability | .gitignore review and ignored-file check | build/, install/, log/ ignored |
| FR-3 | Document setup steps for future maintainers | Reproducibility | Documentation review | docs/setup_guide.md |
| FR-4 | Support an Autoware simulation/lab workflow | Reproducibility, Maintainability | Planned lab documentation review | future Autoware lab docs |
| FR-5 | Keep source files separate from generated build outputs | Maintainability, Reliability | Repository file tree inspection | src/ tracked, build outputs ignored |
| NFR-1 | Repository shall be reproducible from source files | Reproducibility | Setup guide review | README.md, docs/setup_guide.md |
| NFR-2 | Repository shall be maintainable through clear folder structure | Maintainability | Folder structure inspection | docs/, src/ |
| NFR-3 | Repository shall be traceable through meaningful Git commits | Traceability | Commit history review | git log |
| NFR-4 | Repository shall avoid generated or machine-specific files | Portability, Reliability | Git tracked-file inspection | git ls-files |
| NFR-5 | Documentation shall help another developer understand setup | Reproducibility, Maintainability | Documentation review | README.md and docs/ |

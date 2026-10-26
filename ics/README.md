# ICS 计算机系统复习资料

网站：https://blog.zjzj.work/ics/
独立仓库：https://github.com/zjzj1206/ics-review
汇总仓库：https://github.com/zjzj1206/study-hub

17 个阅读单元：范围说明、第 1～12 讲、第一次测验、往年题、小班研讨和覆盖索引。第 11、12 讲依据 2026-10-22 / 2026-10-26 课件整理 PIPE、冒险控制、存储技术、局部性和缓存基础，包含对应研讨逐项路线。第一次测验原范围仍为第 1～8 讲。

2026 第一次测验来源是 5 页纯答案版，缺题干和选项的小问明确标注资料限制。原创 Y86 示例 len.ys、汇编结果 len.yo 和官方 yis 实测输出随网站提供。课程 PDF 原件不上传公开仓库。

## 编辑与构建

仓库根目录是发布产物；source.zip 包含完整 Markdown、构建器、样式和检查脚本。解压 source.zip 到独立工作目录，再运行：

```sh
python3 -m pip install -r requirements.txt
npm ci
python3 build.py
python3 checks/verify.py
python3 checks/verify_math.py
python3 checks/verify_code.py
python3 -m http.server 8765 --directory dist
```

修改 content/*.md 后重新构建。build.py 会重建 dist 并生成 source.zip 和复习资料汇总.md。表格必须包含表头分隔行；单元格中的 C 声明与表达式使用反引号，竖线即使在行内代码中也必须写成 \|。测验、往年题、研讨与覆盖索引的旧 URL 保留，显示为附录 A～D，排在课程主线之后；新课使用 11-pipeline.html、12-memory-hierarchy.html。

## 发布与同步

将 dist 内容同步到独立仓库根目录、study-hub 的 ics/。旧 09-architecture.html、10-optimization.html、11-memory.html 继续不发布；课程章节采用 09-isa-logic.html、10-sequential.html、11-pipeline.html、12-memory-hierarchy.html，不上传 ICS 独立 CNAME，不把章节放回学习空间根目录。

正式托管是 Cloudflare Pages 的 zjzj-study-hub；GitHub 提交不会自动更新网站。完整部署由高党项目整合，其受保护内容及服务端鉴权文件必须保留，只替换 /ics/。具体流程见该项目 gaodang-site/DEPLOYMENT.md。完整部署包只上传 Cloudflare，公开 GitHub 仅接收总览及 ICS 文件。

## Markdown 数学公式

行内公式写作 `$2^{w}-1$`，独立公式用单独成行的 `$$` 包围：

```markdown
$$
\operatorname{B2U}(x)=\sum_{i=0}^{w-1}x_i2^i
$$
```

支持分式、上下标、求和、矩阵、aligned 对齐和 cases 分段式。数学中的竖线请用 `\lvert`、`\rvert` 或 `\mid`，避免干扰 Markdown 表格。C 和汇编继续放在反引号或代码块里，立即数 `$8` 不会作为公式解析。

构建需要 Python 依赖和 Node.js；KaTeX 版本由 package-lock.json 固定。公式在构建时生成 HTML + MathML，CSS 和字体随网站托管，不依赖第三方 CDN 或浏览器 JavaScript。非法公式会中止构建，避免错误公式上线。长公式与宽表格可横向滚动。

## 代码高亮

C、AT&T/x86/Y86 汇编与 HCL 代码在构建时由本地 Pygments 高亮，无需浏览器加载第三方脚本。代码围栏分别使用 c、asm、hcl；text 保持纯文本。verify_code.py 检查高亮后文字与源码逐字一致，并校验源码压缩包包含高亮模块与依赖。


## 硬件总图与读图正文

第 10、11 章分别以 `assets/hardware-seq.jpg`、`assets/hardware-pipe.jpg` 两张用户提供的原始照片为总图。图片点击打开原文件；稳定定位点为 `10-sequential.html#seq-hardware` 和 `11-pipeline.html#pipe-hardware`，整本阅读中也保留这两个锚点。正文围绕图内模块、字段、选择器、反馈与状态边界讲解，局部 SVG 作为辅助展开。两张 JPG 随 source.zip 一并提供，不压缩或改写原图。

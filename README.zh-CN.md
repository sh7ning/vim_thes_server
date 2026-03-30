# vim_thes_server

[English README](./README.md)

一份面向服务器环境的 Vim 配置，尽量保持轻量、直接、开箱可用。

如果你主要在服务器上编辑日志、配置文件、脚本或后端代码，这份配置更适合直接使用。如果你需要更完整的插件生态，尤其是 PHP 开发环境，可以参考：

- [vim_thes](https://github.com/sh7ning/vim_thes)

## 特点

- 轻量配置，不依赖插件管理器
- 适合 Linux 和 macOS 终端环境
- 默认开启语法高亮、行号、智能缩进、搜索高亮等常用能力
- 内置持久化撤销、分屏方向、状态栏、大小写智能搜索等实用配置
- 更偏向服务器场景，尽量减少额外依赖和性能负担

## 配置文件说明

仓库中包含两个版本。

### .vimrc

推荐默认使用的版本，适合当前大多数服务器和终端环境。

特点：

- 兼容 macOS 和 Linux
- 对部分能力增加存在性判断，减少精简版 Vim 报错概率
- 默认关闭自动换行，更适合查看日志、配置和后端代码
- 在支持持久化撤销时自动创建 `~/.vim_undo`
- 为 JSON、YAML、JavaScript、TypeScript、HTML、CSS 设置 2 空格缩进

### .vimrc.classic

保留的经典版本，适合偏好旧行为或需要更简单回退方案的场景。

特点：

- 配置更老、更直接
- 默认开启自动换行
- 可作为兼容版本或回退版本使用

## 快速安装

建议先备份已有配置，再安装需要的版本。

### 安装默认版 `.vimrc`

```bash
cp ~/.vimrc ~/.vimrc_bak 2>/dev/null; curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc -o ~/.vimrc
```

### 或安装经典版 `.vimrc.classic`

```bash
cp ~/.vimrc ~/.vimrc_bak 2>/dev/null; curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc.classic -o ~/.vimrc && mkdir -p ~/.vim_undo
```

## 分步安装

### 1. 备份现有配置

```bash
cp ~/.vimrc ~/.vimrc_bak
```

### 2. 安装默认版

```bash
curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc -o ~/.vimrc
```

### 3. 或安装经典版

```bash
curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc.classic -o ~/.vimrc
mkdir -p ~/.vim_undo
```

### 4. 重新打开 Vim

### 5. Enjoy it ^_^ 😊

## 适用场景

- 登录服务器后快速编辑配置文件
- 查看和处理日志文件
- 编写 Shell、PHP 及常见后端代码
- 用更轻量、更稳定的方案替代较重的本地插件配置

## 说明

- 本仓库专注于“服务器可直接用”的 Vim 配置，不追求完整 IDE 化
- 如果你更需要插件增强、语言支持和更丰富的开发体验，建议使用 [vim_thes](https://github.com/sh7ning/vim_thes)

## License

MIT
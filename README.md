
# vim_thes_server

[简体中文说明](./README.zh-CN.md)

A lightweight Vim configuration for server-side usage, designed to stay simple, practical, and ready to use without plugin managers.

If you mainly edit logs, config files, scripts, or backend code on remote servers, this setup is intended for that workflow. If you want a more feature-rich Vim distribution, especially for PHP development, see:

- [vim_thes](https://github.com/sh7ning/vim_thes)

## Features

- Lightweight setup with no plugin manager dependency
- Suitable for Linux and macOS terminal environments
- Sensible defaults such as syntax highlighting, line numbers, smart indentation, and search highlighting
- Includes persistent undo, split behavior, statusline, and smart case search settings
- Keeps server-side editing fast and low-maintenance

## Configuration Files

This repository includes two configuration variants.

### .vimrc

The recommended default version for most modern server and terminal environments.

Highlights:

- Works with macOS and Linux
- Guards some features with capability checks to reduce errors on minimal Vim builds
- Uses `nowrap` by default, which is better for logs, configs, and backend code
- Automatically creates `~/.vim_undo` when persistent undo is available
- Uses 2-space indentation for JSON, YAML, JavaScript, TypeScript, HTML, and CSS

### .vimrc.classic

The older classic version, kept for users who prefer the previous behavior or want a simpler fallback.

Highlights:

- More direct and legacy-style configuration
- Uses line wrapping by default
- Useful as a compatibility or rollback option

## Quick Install

Back up your existing configuration first, then install the version you want.

### Install default `.vimrc`

```bash
cp ~/.vimrc ~/.vimrc_bak 2>/dev/null; curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc -o ~/.vimrc
```

### Install classic `.vimrc.classic`

```bash
cp ~/.vimrc ~/.vimrc_bak 2>/dev/null; curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc.classic -o ~/.vimrc && mkdir -p ~/.vim_undo
```

## Step-by-Step Installation

### 1. Back up your current configuration

```bash
cp ~/.vimrc ~/.vimrc_bak
```

### 2. Install the default version

```bash
curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc -o ~/.vimrc
```

### 3. Or install the classic version

```bash
curl -fsSL https://raw.githubusercontent.com/sh7ning/vim_thes_server/master/.vimrc.classic -o ~/.vimrc
mkdir -p ~/.vim_undo
```

### 4. Reopen Vim

### 5. Enjoy it ^_^ 😊

## Good Fit For

- Quick editing of server configuration files
- Viewing and processing log files
- Writing Shell, PHP, and common backend code
- Replacing a heavier local plugin setup with something simpler and more stable

## Notes

- This repository focuses on a practical server-ready Vim experience rather than a full IDE-style setup
- If you want plugin-heavy enhancements and richer language tooling, use [vim_thes](https://github.com/sh7ning/vim_thes)

## License

MIT

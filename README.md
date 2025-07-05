# Win Custom Boot Sounds

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Windows 10+](https://img.shields.io/badge/Windows-10+-0078D6)

为 Windows 添加自定义开关机提示音的轻量级解决方案，通过Windows服务实现稳定播放。

## ✨ 功能特性
- 开机自动播放自定义提示音（≤8秒）
- 关机时完整播放提示音（≤8秒）
- 无 GUI 后台服务运行
- 一键安装/卸载脚本
- 使用 .NET 9.0

## ⚡ 快速开始

### 准备工作
1. 准备两个WAV音频文件：
   - `startup.wav` - 开机提示音（≤8秒）
   - `shutdown.wav` - 关机提示音（≤8秒）
2. 确保系统已安装 [.NET 9.0 运行时](https://dotnet.microsoft.com/download/dotnet/9.0)

### 安装步骤
```bash
# 克隆仓库
git clone https://github.com/yourusername/Win10-Custom-Boot-Sounds.git
cd Win10-Custom-Boot-Sounds

# 复制音频文件到项目根目录
cp "你的开机音频.wav" startup.wav
cp "你的关机音频.wav" shutdown.wav

# 以管理员身份运行安装脚本
右键点击 install.bat -> "以管理员身份运行"
```

### 卸载服务
```bash
右键点击 uninstall.bat -> "以管理员身份运行"
```

## 🛠️ 技术细节
- **运行机制**：Windows 服务监听系统事件
- **播放模式**：同步播放确保完整性
- **服务名称**：`SoundService`
- **音频位置**：`C:\Sounds\` 目录
- **日志查看**：Windows 事件查看器 -> Windows 日志 -> 应用程序

## ⚠️ 注意事项
1. 必须使用**管理员权限**运行安装/卸载脚本
2. 音频格式要求：
   - WAV 格式（16位PCM）
   - 时长 ≤8秒
   - 采样率建议 44100Hz 或更低
3. 测试建议：
   - 开机音：`net start SoundService`
   - 关机音：`net stop SoundService`

## 🤝 贡献指南
欢迎提交 PR！建议改进方向：
- 添加音量控制功能
- 支持 MP3 等其他格式转换
- 创建图形化配置界面

## 📜 许可协议
本项目采用 [MIT 许可证](LICENSE)
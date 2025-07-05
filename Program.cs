using System;
using System.ServiceProcess;
using System.Media;
using System.IO;
using System.Threading;

public class SoundService : ServiceBase
{
    // 配置你的音频文件路径
    private const string StartupSound = @"C:\Sounds\startup.wav";
    private const string ShutdownSound = @"C:\Sounds\shutdown.wav";
    
    protected override void OnStart(string[] args)
    {
        ThreadPool.QueueUserWorkItem(_ => PlaySound(StartupSound));
    }

    protected override void OnShutdown()
    {
        PlaySound(ShutdownSound);
        Thread.Sleep(2000); // 确保播放完成
    }

    private void PlaySound(string filePath)
    {
        if (!File.Exists(filePath)) return;
        
        using (var player = new SoundPlayer(filePath))
        {
            player.PlaySync(); // 同步播放确保完整
        }
    }

    public static void Main()
    {
        Run(new SoundService());
    }
}
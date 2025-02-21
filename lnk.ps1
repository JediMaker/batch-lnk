# 目标文件夹路径，修改路径成为自己快捷方式存放的地方
$SavePath = "C:\Users\kkkmoat\Desktop\explore\lnk" 

# 确保目标文件夹存在，如果不存在则创建
if (!(Test-Path -Path $SavePath)) {
New-Item -ItemType Directory -Path $SavePath | Out-Null
}

# 目标程序路径，修改成为你需要创建的快捷方式的目标路径
$TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe" 

# 循环创建 1-100 个快捷方式，可以自行修改创建200、300、400...
for ($i = 1; $i -le 100; $i++) {
$ShortcutName = "App$i.lnk"
$Shortcut = "$SavePath\$ShortcutName"

# 生成随编号变化的参数，存放对应编号Chrome的缓存文件，建议与快捷方式文件夹同级
$Arguments = " --user-data-dir=`"C:\Users\kkkmoat\Desktop\explore\chrome\$i`""

$WScriptShell = New-Object -ComObject WScript.Shell
$ShortcutObj = $WScriptShell.CreateShortcut($Shortcut)

# 设置 TargetPath 和 参数
$ShortcutObj.TargetPath = $TargetPath
$ShortcutObj.Arguments = $Arguments # 追加参数
$ShortcutObj.WorkingDirectory = "C:\Program Files\Google\Chrome\Application" #修改成为目标程序路径的起始位置
$ShortcutObj.Save()
}
#任务成功提示
Write-Host "1-100 个快捷方式已创建到 $SavePath，并已添加参数"

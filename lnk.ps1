# 目标文件夹路径
$SavePath = "E:\chromemuli\lnk"

# 确保目标文件夹存在（如果不存在则创建）
if (!(Test-Path -Path $SavePath)) {
New-Item -ItemType Directory -Path $SavePath | Out-Null
}

# 目标程序路径
$TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# 循环创建 1-300 个快捷方式
for ($i = 1; $i -le 300; $i++) {
$ShortcutName = "$i.lnk"
$Shortcut = "$SavePath\$ShortcutName"

# 生成随编号变化的参数
$Arguments = " --user-data-dir=`"E:\chromemuli\chromeData\$i`""

$WScriptShell = New-Object -ComObject WScript.Shell
$ShortcutObj = $WScriptShell.CreateShortcut($Shortcut)

# 设置 TargetPath 和 参数
$ShortcutObj.TargetPath = $TargetPath
$ShortcutObj.Arguments = $Arguments # 追加参数
$ShortcutObj.WorkingDirectory = "C:\Program Files\Google\Chrome\Application"
$ShortcutObj.Save()
}

Write-Host "创建成功，1-300 个快捷方式已创建到 $SavePath，并已添加参数"

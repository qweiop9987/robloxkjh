local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/main.lua"))()

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "ACUM脚本",
    IconThemed = true,
    Content = "免费脚本 ",
    Buttons = {
        {
            Title = "退出",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "进入",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "ACUM集合",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Folder = "XYScript",
    Size = UDim2.fromOffset(580, 340),
    Transparent = true,
    Theme = "Light",
    User = { Enabled = true },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

Window:Tag({
        Title = "测试版",
        Color = Color3.fromHex("#30ff6a")
    })

Window:EditOpenButton({
    Title = "ACUM脚本",
    Icon = "rbxassetid://6026568198",
    CornerRadius = UDim.new(0,16),
    Size = UDim2.fromOffset(580, 340),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Draggable = true,
})

local Tabs = {}

Tabs.ElementsSection = Window:Section({
    Title = "ACUM脚本",
    Icon = "rbxassetid://6026568198",
    Opened = true,
})

Tabs.ZhuanmenSection = Window:Section({
    Title = "专门脚本",
    Opened = true,
})

Tabs.WindowSection = Window:Section({
    Title = "窗口管理",
    Icon = "app-window-mac",
    Opened = true,
})

Tabs.ParagraphTab = Tabs.ElementsSection:Tab({ Title = "首页", Icon = "type" })
Tabs.ButtonTab = Tabs.ElementsSection:Tab({ Title = "脚本", Icon = "mouse-pointer-2" })
Tabs.FE1Tab = Tabs.ElementsSection:Tab({ Title = "FE脚本", Icon = "paintbrush" })
Tabs.ActionTab = Tabs.ElementsSection:Tab({ Title = "动作", Icon = "paintbrush" })
Tabs.otherTab = Tabs.ElementsSection:Tab({ Title = "其它脚本中心", Icon = "toggle-left" })
Tabs.PictureTab = Tabs.ElementsSection:Tab({ Title = "画面", Icon = "toggle-left" })
Tabs.DevelopmentTab = Tabs.ElementsSection:Tab({ Title = "开发", Icon = "toggle-left" })
Tabs.BeiyiqiTab = Tabs.ZhuanmenSection:Tab({ Title = "服务器脚本", Icon = "type" })
Tabs.N99nightTab = Tabs.ZhuanmenSection:Tab({ Title = "99夜", Icon = "type" })

Tabs.WindowTab = Tabs.WindowSection:Tab({ 
    Title = "窗口和文件配置", 
    Icon = "settings", 
    ShowTabTitle = true 
})
Tabs.CreateThemeTab = Tabs.WindowSection:Tab({ Title = "创建主题", Icon = "palette" })

Window:SelectTab(1)

Tabs.ParagraphTab:Paragraph({
    Title = "qwrtui114587的脚本",
    Desc = "更便捷",
    Image = "https://i.postimg.cc/QtzNTpgP/Image-1756518369463.jpg",
    ImageSize = 42,
    Thumbnail = "https://i.postimg.cc/QtzNTpgP/Image-1756518369463.jpg",
    ThumbnailSize = 120
})

Tabs.ParagraphTab:Button({
    Title = "发送",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/phonto"))()
    end
})

Tabs.ParagraphTab:Input({
    Title = "图片ID",
    PlaceholderText = "Enter file name",
    Callback = function(phonto)
    end
})
-------------------------------------通用-------------------------------------
Tabs.ButtonTab:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

Tabs.ButtonTab:Slider({
    Title = "移速",
    Value = {
        Min = 16,
        Max = 100,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

Tabs.ButtonTab:Slider({
    Title = "重力",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

Tabs.ButtonTab:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(state)
        if state then
            game.Lighting.Ambient = Color3.new(1, 1, 1)  
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0) 
        end
    end
})

local Noclip = false
local NoclipConnection
Tabs.ButtonTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        if state then
            Noclip = true
            NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if Noclip then
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                else
                    NoclipConnection:Disconnect()
                end
            end)
        else
            Noclip = false
            if NoclipConnection then
                NoclipConnection:Disconnect()
            end
        end
    end
})

Tabs.ButtonTab:Button({
    Title = "点击传送工具",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "点击传送" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
    end
})


Tabs.ButtonTab:Button({
    Title = "肘击",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'),true))()

    end
})

Tabs.ButtonTab:Button({
    Title = "玩家实时数据",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%AE%9E%E6%97%B6%E6%95%B0%E6%8D%AE.txt"))()

    end
})

Tabs.ButtonTab:Button({
    Title = "vapev4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()

    end
})

Tabs.ButtonTab:Button({
    Title = "查看别人物品栏",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%9C%8B%E7%89%A9%E5%93%81%E6%A0%8F.txt"))()

    end
})

-------------------------------------FE-------------------------------------
Tabs.FE1Tab:Button({
    Title = "别人可见音效",
    Callback = function()
        loadstring(game.HttpGet(game, "https://rawscripts.net/raw/Brookhaven-RP-Audio-Player-Script-Brookhaven-RP-33531"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "隐身",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/vP6CrQJj"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "蜘蛛侠",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E8%9C%98%E8%9B%9B%E4%BE%A0.txt"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "拥抱",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ExploitFin/Animations/refs/heads/main/Front%20and%20Back%20Hug%20Tool"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "隐身",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/vP6CrQJj"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "隐身2",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/3Rnd9rHf"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "失重",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/0%20Graviy%20Trip%20Universal"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "跳墙",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "蜘蛛侠",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E8%9C%98%E8%9B%9B%E4%BE%A0.txt"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "前后空翻",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E6%97%8B%E8%BD%AC.txt"))()
    end
})

-------------------------------------其它脚本-------------------------------------
Tabs.otherTab:Button({
    Title = "DHJB脚本卡密",
    Callback = function()
        setclipboard("wjbhd")
    end
})

Tabs.otherTab:Button({
    Title = "DHJB脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/1.3.txt"))()
    end
})

Tabs.otherTab:Button({
    Title = "XK脚本",
    Callback = function()
        loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
    end
})

Tabs.otherTab:Button({
    Title = "小月脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Syndromehsh/bypass-Script/refs/heads/main/xiaoyue/Main%20Script.lua"))()
    end
})

Tabs.otherTab:Button({
    Title = "殺脚本",
    Callback = function()
        FengYu_HUB = "殺脚本"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/main/QQ1926190957.lua"))()
    end
})

Tabs.otherTab:Button({
    Title = "情云脚本",
    Callback = function()
        loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
    end
})

-------------------------------------窗口配置-------------------------------------
local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
if not isfolder(folderPath) then
    makefolder(folderPath)
end

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
    return nil
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

Tabs.WindowTab:Section({ Title = "窗口", Icon = "app-window-mac" })

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

local themeDropdown = Tabs.WindowTab:Dropdown({
    Title = "选择主题",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

local ToggleTransparency = Tabs.WindowTab:Toggle({
    Title = "切换窗口透明度",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

Tabs.WindowTab:Section({ Title = "保存" })

local fileNameInput = ""
Tabs.WindowTab:Input({
    Title = "写入文件名",
    PlaceholderText = "Enter file name",
    Callback = function(text)
        fileNameInput = text
    end
})

Tabs.WindowTab:Button({
    Title = "保存文件",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Section({ Title = "加载" })

local filesDropdown
local files = ListFiles()

filesDropdown = Tabs.WindowTab:Dropdown({
    Title = "选择文件",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

Tabs.WindowTab:Button({
    Title = "加载文件",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "文件已加载",
                    Content = "Loaded data: "..HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then 
                    WindUI:SetTheme(data.Theme)
                    themeDropdown:Select(data.Theme)
                end
            end
        end
    end
})

Tabs.WindowTab:Button({
    Title = "覆盖文件",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Button({
    Title = "刷新列表",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})

local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()

local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].Placeholder

function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        Placeholder = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end

local CreateInput = Tabs.CreateThemeTab:Input({
    Title = "主题名称",
    Value = currentThemeName,
    Callback = function(name)
        currentThemeName = name
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "背景颜色",
    Default = Color3.fromHex(ThemeAccent),
    Callback = function(color)
        ThemeAccent = color:ToHex()
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "轮廓颜色",
    Default = Color3.fromHex(ThemeOutline),
    Callback = function(color)
        ThemeOutline = color:ToHex()
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "文本颜色",
    Default = Color3.fromHex(ThemeText),
    Callback = function(color)
        ThemeText = color:ToHex()
    end
})

Tabs.CreateThemeTab:Colorpicker({
    Title = "占位符文本颜色",
    Default = Color3.fromHex(ThemePlaceholderText),
    Callback = function(color)
        ThemePlaceholderText = color:ToHex()
    end
})

Tabs.CreateThemeTab:Button({
    Title = "更新主题",
    Callback = function()
        updateTheme()
    end
})

-------------------------------------开发-------------------------------------
Tabs.DevelopmentTab:Button({
    Title = "http spy",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Best-HTTP-SPY-38448"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "汉化dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/bex.lua"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "simple say",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Tools/SimpleSpy.lua"))()
    end
})

Tabs.DevelopmentTab:Button({
    Title = "Sigma-Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"))()
    end
})
-------------------------------------画面-------------------------------------
Tabs.PictureTab:Button({
    Title = "光影",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

Tabs.PictureTab:Button({
    Title = "提高画质",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Xingtaiduan/Script/main/Content/HighQuality"))()
    end
})

-------------------------------------动作
Tabs.ActionTab:Button({
    Title = "芦管r6",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

Tabs.ActionTab:Button({
    Title = "芦管r15",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

Tabs.ActionTab:Button({
    Title = "TSB动作脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NotEnoughJack/socializehub/refs/heads/main/script.lua"))()
    end
})

-------------------------------------专门-------------------------------------
Tabs.BeiyiqiTab:Button({
    Title = "被遗弃情云中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Forsaken"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "墨水游戏",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/TexRBLlX"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "墨水游戏hook防封",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/05e1141b8fdeec9dd262dde9f071d6ffdaccd5b1/inkgamereducer.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "静默瞄准1.2最新",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fcsdsss/games/refs/heads/main/Silent%20aim/1.2"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "犯罪脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UNDETECTEDWARE/SCRIPT/refs/heads/main/UNDETECTEDWARENEW"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "犯罪脚本jx",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jianlobiano/LOADER/refs/heads/main/JX-CRIMINALITY"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "被遗弃脚本最强需要卡密",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "内脏与黑火鲨鱼",
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\65\51\78\113\122\52\78\112\47\114\97\119"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "最强战场",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/refs/heads/main/ZygardeV1.txt"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "墨水游戏简易版（功能少，但够用）",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/GameLoad.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "鱼服务器脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxheikeji/script/refs/heads/main/SpeedHubFisch.txt", true))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "3008脚本",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Viserromero/Antex/master/SCP3008'))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "最强战场无限侧闪",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/10tempest01/tempest-hub/refs/heads/main/Launcher.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "战争大亨",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fba7aeffae0253b8860a9dda57f80318.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "压力脚本",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "ohio宿摊破解",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiProDev/XiPro/refs/heads/main/Free/宿傩Ohio破解版.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "kanl终极战场",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/ubg-script/refs/heads/main/kanl"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "汉化版后门",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pijiaobenMSJMleng/backdoor/refs/heads/main/backdoor.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "血债",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccacca444/scripts1/main/especially"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "最强战场垃圾桶",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "被遗弃2",
    Callback = function()
        local L = loadstring or loadlocal ID = "https://raw.github.com/OAO-Kamu/I/main/Forsaken-CHANGED.Luau"L(game:HttpGet(ID))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "doors out",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/DOORS-Doors-outdoors-subfloor-script-48463"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "doorsout脚本卡密",
    Callback = function()
        setclipboard("98353-95725-25739-93462-92526-91246")
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "通用透视",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()	

    end
})

Tabs.BeiyiqiTab:Button({
    Title = "死铁轨刷债券全自动",
    Callback = function()
        getgenv().AutoExecute = true(loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHUB/main/loader.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "chain",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/LESum4rq'))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "bf",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
    end
})

Tabs.BeiyiqiTab:Button({
    Title = "一路向西",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fcsdsss/westboundscp/refs/heads/main/obfuscated.lua%20(1).txt"))()
    end
})

Window:OnClose(function()
    print("UI closed.")
    if NoclipConnection then
        NoclipConnection:Disconnect()
    end
end)
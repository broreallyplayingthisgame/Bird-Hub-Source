if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {
    autofarm = false,
    toggleguikey = "z",
    autodrink = false,
    nightvision = false,
    autotptoken = false,
    nightnumber = 4
}
local a = "Bird Hub"
local b = "CreatureOfSonoria.lua"
function saveSettings()
    local c = game:GetService("HttpService")
    local d = c:JSONEncode(_G.Settings)
    if writefile then
        if isfolder(a) then
            writefile(a .. "\\" .. b, d)
        else
            makefolder(a)
            writefile(a .. "\\" .. b, d)
        end
    end
end
function loadSettings()
    local c = game:GetService("HttpService")
    if isfile(a .. "\\" .. b) then
        _G.Settings = c:JSONDecode(readfile(a .. "\\" .. b))
    end
end
loadSettings()
local e = game:GetService("ReplicatedStorage")
local f = game:GetService("VirtualInputManager")
local g = game:GetService("Players")
local h = game:GetService("VirtualUser")
local i = game:GetService("TweenService")
local j = g.LocalPlayer
function HideGui()
    local k = game.CoreGui:FindFirstChild("Orion")
    local l
    for m, n in pairs(k:GetChildren()) do
        if m == 2 then
            l = n
        end
    end
    if k.Enabled then
        l:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
        repeat
            task.wait()
        until l.Size.Y.Offset < 1
        k.Enabled = false
    else
        l:TweenSize(UDim2.new(0, 615, 0, 344), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
        repeat
            task.wait()
        until l.Size.Y.Offset > 1
        k.Enabled = true
    end
end
spawn(
    function()
        j = game.Players.LocalPlayer
        Mouse = j:GetMouse()
        Mouse.KeyDown:connect(
            function(o)
                o = o:lower()
                if o == _G.Settings.toggleguikey then
                    task.spawn(HideGui)
                end
            end
        )
    end
)
j.Idled:Connect(
    function()
        h:ClickButton2(Vector2.new())
    end
)
local p = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local q = p:MakeWindow({Name = "Bird Hub", HidePremium = true})
local r = q:MakeTab({Name = "Main", PremiumOnly = false})
local s = q:MakeTab({Name = "Creature Option", PremiumOnly = false})
local t = q:MakeTab({Name = "Teleport", PremiumOnly = false})
local u = q:MakeTab({Name = "Extra", PremiumOnly = false})
local v = q:MakeTab({Name = "Setting", PremiumOnly = false})
local w = q:MakeTab({Name = "Credits", PremiumOnly = false})
r:AddToggle(
    {
        Name = "Afk Farm",
        Default = _G.Settings.autofarm,
        Callback = function(x)
            _G.Settings.autofarm = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.autofarm then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                            local y
                            for m, n in pairs(getloadedmodules()) do
                                if n.Name == "MotionTracker" then
                                    y = n
                                end
                            end
                            task.spawn(
                                function()
                                    task.wait(0.1)
                                    local CFrame =
                                        CFrame.new(353.2420349121094, -268.8212585449219, -1111.9737548828125)
                                    for z, A in pairs(debug.getupvalues(require(y))) do
                                        if type(A) == "function" then
                                            if getinfo(A).name == "TeleportTo" then
                                                setupvalue(A, 3, CFrame)
                                            end
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
        end
    }
)
r:AddToggle(
    {
        Name = "Token Farm",
        Default = _G.Settings.autotptoken,
        Callback = function(x)
            _G.Settings.autotptoken = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.autotptoken then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                            local y
                            local B = debug.getupvalues or getupvalues or getupvals
                            local C = getloadedmodules or get_loaded_modules
                            for m, n in pairs(C()) do
                                if n.Name == "MotionTracker" then
                                    y = n
                                end
                            end
                            task.spawn(
                                function()
                                    task.spawn(
                                        function()
                                            task.wait(0.1)
                                            local CFrame =
                                                game:GetService("Workspace"):FindFirstChild("ExplorerCapsule").CFrame
                                            for z, A in pairs(B(require(y))) do
                                                if type(A) == "function" then
                                                    if getinfo(A).name == "TeleportTo" then
                                                        setupvalue(A, 3, CFrame)
                                                    end
                                                end
                                            end
                                        end
                                    )
                                    task.spawn(
                                        function()
                                            task.wait(0.1)
                                            local CFrame =
                                                game:GetService("Workspace"):FindFirstChild("LimitedCapsule").CFrame
                                            for z, A in pairs(B(require(y))) do
                                                if type(A) == "function" then
                                                    if getinfo(A).name == "TeleportTo" then
                                                        setupvalue(A, 3, CFrame)
                                                    end
                                                end
                                            end
                                        end
                                    )
                                    task.spawn(
                                        function()
                                            task.wait(0.1)
                                            local CFrame =
                                                game:GetService("Workspace"):FindFirstChild("DietCapsule").CFrame
                                            for z, A in pairs(B(require(y))) do
                                                if type(A) == "function" then
                                                    if getinfo(A).name == "TeleportTo" then
                                                        setupvalue(A, 3, CFrame)
                                                    end
                                                end
                                            end
                                        end
                                    )
                                    task.spawn(
                                        function()
                                            task.wait(0.1)
                                            local CFrame =
                                                game:GetService("Workspace"):FindFirstChild("MutateCapsule").CFrame
                                            for z, A in pairs(B(require(y))) do
                                                if type(A) == "function" then
                                                    if getinfo(A).name == "TeleportTo" then
                                                        setupvalue(A, 3, CFrame)
                                                    end
                                                end
                                            end
                                        end
                                    )
                                    task.spawn(
                                        function()
                                            task.wait(0.1)
                                            local CFrame =
                                                game:GetService("Workspace"):FindFirstChild("GalaxyExplorerCapsule").CFrame
                                            for z, A in pairs(B(require(y))) do
                                                if type(A) == "function" then
                                                    if getinfo(A).name == "TeleportTo" then
                                                        setupvalue(A, 3, CFrame)
                                                    end
                                                end
                                            end
                                        end
                                    )
                                end
                            )
                        end
                    end
                end
            )
        end
    }
)
r:AddButton(
    {
        Name = "Load All Map",
        Callback = function()
            local y
            local B = debug.getupvalues or getupvalues or getupvals
            local C = getloadedmodules or get_loaded_modules
            for m, n in pairs(C()) do
                if n.Name == "MotionTracker" then
                    y = n
                end
            end
            wait(2)
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(2077.852783203125, 242.5062255859375, -935.6098022460938)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
            wait(2)
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(-1010.4036254882812, 184.9303436279297, -1381.181396484375)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(893.381591796875, 276.25006103515625, -984.1700439453125)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
            wait(2)
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(1610.789794921875, 243.11407470703125, 225.0277862548828)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(880.1900634765625, 573.5634155273438, -2595.145751953125)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
            wait(2)
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(-2014.8013916015625, 216.9436798095703, 151.13536071777344)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
            wait(2)
            task.spawn(
                function()
                    task.wait(0.1)
                    local CFrame = CFrame.new(-265.4371032714844, 219.32887268066406, 1491.4090576171875)
                    for z, A in pairs(debug.getupvalues(require(y))) do
                        if type(A) == "function" then
                            if getinfo(A).name == "TeleportTo" then
                                setupvalue(A, 3, CFrame)
                            end
                        end
                    end
                end
            )
        end
    }
)
r:AddLabel("Need Photovore and Toggle Auto Drink")
r:AddLabel("Token Farm Need Load All Map Before")
t:AddButton(
    {
        Name = "TP Desert Oasis",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(-1010.4036254882812, 184.9303436279297, -1381.181396484375)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
t:AddButton(
    {
        Name = "TP RedWood",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(893.381591796875, 276.25006103515625, -984.1700439453125)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
t:AddButton(
    {
        Name = "TP Swamp",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(1610.789794921875, 243.11407470703125, 225.0277862548828)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
t:AddButton(
    {
        Name = "TP Tundra",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(880.1900634765625, 573.5634155273438, -2595.145751953125)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
t:AddButton(
    {
        Name = "TP Dunes",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(-2014.8013916015625, 216.9436798095703, 151.13536071777344)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
t:AddButton(
    {
        Name = "TP Plains",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(-265.4371032714844, 219.32887268066406, 1491.4090576171875)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
t:AddButton(
    {
        Name = "TP Ocean",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                local y
                for m, n in pairs(getloadedmodules()) do
                    if n.Name == "MotionTracker" then
                        y = n
                    end
                end
                task.spawn(
                    function()
                        task.wait(0.1)
                        local CFrame = CFrame.new(0, 0, 0)
                        for z, A in pairs(debug.getupvalues(require(y))) do
                            if type(A) == "function" then
                                if getinfo(A).name == "TeleportTo" then
                                    setupvalue(A, 3, CFrame)
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)
s:AddToggle(
    {
        Name = "Night Vision",
        Default = _G.Settings.nightvision,
        Callback = function(x)
            _G.Settings.nightvision = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.nightvision then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Character.Enabled == false then
                            for m, n in ipairs(workspace.Dinosaurs:GetDescendants()) do
                                if n.Name == "Nightvision" then
                                    n.Value = _G.Settings.nightnumber
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
u:AddToggle(
    {
        Name = "Auto Drink",
        Default = _G.Settings.autodrink,
        Callback = function(x)
            _G.Settings.autodrink = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.autodrink then
                            break
                        end
                        wait()
                        game:GetService("Players").LocalPlayer.RemoteEvent:FireServer("drink", workspace.Water.Model)
                    end
                end
            )
        end
    }
)
u:AddToggle(
    {
        Name = "Rejoin If Kick",
        Default = _G.Settings.autorejoin,
        Callback = function(x)
            _G.Settings.autorejoin = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autorejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(D)
                                if
                                    D.Name == "ErrorPrompt" and D:FindFirstChild("MessageArea") and
                                        D.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(5233782396, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
v:AddSlider(
    {Name = "Night Vision", Default = _G.Settings.nightnumber, Min = 0, Max = 4, Callback = function(x)
            _G.Settings.nightnumber = x
            saveSettings()
        end}
)
w:AddButton(
    {Name = "Script by Bird Hub", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
w:AddButton(
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
w:AddTextbox(
    {Name = "Toggle Gui Key", Default = _G.Settings.toggleguikey, TextDisappear = false, Callback = function(x)
            _G.Settings.toggleguikey = x
            saveSettings()
        end}
)
p:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Creature Of Sonoria", Time = 15})
p:Init()

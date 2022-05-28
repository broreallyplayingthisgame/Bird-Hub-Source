if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {
    autofarmlvl = false,
    hidename = false,
    jumpower = 50,
    walkspeed = 28,
    autorespawn = true,
    autorejoin = false,
    toggleguikey = "z"
}
local a = "Bird Hub"
local b = "ElementalAwakening.lua"
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
local s = q:MakeTab({Name = "Extra", PremiumOnly = false})
local t = q:MakeTab({Name = "Edit Character", PremiumOnly = false})
local u = q:MakeTab({Name = "Teleport", PremiumOnly = false})
local v = q:MakeTab({Name = "Credits", PremiumOnly = false})
r:AddToggle(
    {
        Name = "Auto Lvl",
        Default = _G.Settings.autofarmlvl,
        Callback = function(w)
            _G.Settings.autofarmlvl = w
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autofarmlvl then
                            break
                        end
                        spawn(
                            function()
                                wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 49, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 49, false, game)
                                wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 50, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 50, false, game)
                                wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 51, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 51, false, game)
                                wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 52, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 52, false, game)
                                wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 53, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 53, false, game)
                                wait(1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, 54, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, 54, false, game)
                            end
                        )
                    end
                end
            )
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.autofarmlvl then
                            break
                        end
                        spawn(
                            function()
                                local x = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                                x.Parent = game.Players.LocalPlayer.Character
                                x:Activate()
                            end
                        )
                        spawn(
                            function()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(3353.2420349121094, 3068.8212585449219, -5111.9737548828125)
                            end
                        )
                    end
                end
            )
        end
    }
)
s:AddToggle(
    {
        Name = "Auto Respawn",
        Default = _G.Settings.autorespawn,
        Callback = function(w)
            _G.Settings.autorespawn = w
            saveSettings()
            task.spawn(
                function()
                    while task.wait(10) do
                        if not _G.Settings.autorespawn then
                            break
                        end
                        game:GetService("ReplicatedStorage").Events.Spawn2:InvokeServer()
                    end
                end
            )
        end
    }
)
s:AddToggle(
    {
        Name = "Rejoin If Kick",
        Default = _G.Settings.autorejoin,
        Callback = function(w)
            _G.Settings.autorejoin = w
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autorejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(y)
                                if
                                    y.Name == "ErrorPrompt" and y:FindFirstChild("MessageArea") and
                                        y.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(6969185078, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
s:AddToggle(
    {
        Name = "Hide Name",
        Default = _G.Settings.hidename,
        Callback = function(w)
            _G.Settings.hidename = w
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.hidename then
                            break
                        end
                        spawn(
                            function()
                                game.Players.LocalPlayer.Character.Head.Healthbar:Destroy()
                                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
                            end
                        )
                        spawn(
                            function()
                                local j = game:GetService("Players").LocalPlayer
                                local z
                                j.CharacterAdded:Connect(
                                    function(A)
                                        z = A:WaitForChild("Humanoid")
                                    end
                                )
                                z.Died:Connect(
                                    function()
                                        game.Players.LocalPlayer.Character.Head.Healthbar:Destroy()
                                        game:GetService("StarterGui"):SetCoreGuiEnabled(
                                            Enum.CoreGuiType.PlayerList,
                                            false
                                        )
                                    end
                                )
                            end
                        )
                    end
                end
            )
        end
    }
)
t:AddButton(
    {Name = "Edit Walkspeed", Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Settings.walkspeed
        end}
)
t:AddButton(
    {Name = "Edit JumpPower", Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.Settings.jumpower
        end}
)
t:AddSlider(
    {Name = "Speed", Default = _G.Settings.walkspeed, Min = 28, Max = 300, Callback = function(w)
            _G.Settings.walkspeed = w
            saveSettings()
        end}
)
t:AddSlider(
    {Name = "Jump", Default = _G.Settings.jumpower, Min = 50, Max = 250, Callback = function(w)
            _G.Settings.jumpower = w
            saveSettings()
        end}
)
u:AddButton(
    {
        Name = "City",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(835.3651733398438, 319.6105041503906, 2318.0302734375)
        end
    }
)
u:AddButton(
    {
        Name = "Origin",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(1931.5955810546875, 338.9911804199219, 1534.0364990234375)
        end
    }
)
u:AddButton(
    {
        Name = "The Plain",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(1901.9959716796875, 333.888671875, 2753.741455078125)
        end
    }
)
u:AddButton(
    {
        Name = "Fight Club",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(2447.869873046875, 405.88653564453125, 2857.719482421875)
        end
    }
)
u:AddButton(
    {
        Name = "Lavender Respite",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(3293.928466796875, 297.6727294921875, 2081.46435546875)
        end
    }
)
u:AddButton(
    {
        Name = "Grand Crossing",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(1940.39208984375, 250.74188232421875, 408.3445129394531)
        end
    }
)
u:AddButton(
    {
        Name = "Monolith",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(1713.0108642578125, 261.1494445800781, -493.89617919921875)
        end
    }
)
u:AddButton(
    {
        Name = "Desert",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(2034.0189208984375, 256.156982421875, 12.99642562866211)
        end
    }
)
v:AddButton(
    {Name = "Script by Bird Hub", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
v:AddButton(
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
v:AddTextbox(
    {Name = "Toggle Gui Key", Default = _G.Settings.toggleguikey, TextDisappear = false, Callback = function(w)
            _G.Settings.toggleguikey = w
            saveSettings()
        end}
)
p:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Elemental Awakening ", Time = 15})
p:Init()

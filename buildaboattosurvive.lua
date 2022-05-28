if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {autocomplete = false, autorejoin = false, autospin = false, autoremoveskin = false, toggleguikey = "z"}
local a = "Bird Hub"
local b = "BuilToBoatSurviveBird.lua"
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
game:GetService("RunService").Stepped:Connect(
    function()
        pcall(
            function()
                noclip()
            end
        )
    end
)
local p = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local q = p:MakeWindow({Name = "Bird Hub", HidePremium = true})
local r = q:MakeTab({Name = "Main", PremiumOnly = false})
local s = q:MakeTab({Name = "Extra", PremiumOnly = false})
local t = q:MakeTab({Name = "Setting", PremiumOnly = false})
local u = q:MakeTab({Name = "Credits", PremiumOnly = false})
r:AddToggle(
    {
        Name = "Auto Complete",
        Default = _G.Settings.autocomplete,
        Callback = function(v)
            _G.Settings.autocomplete = v
            saveSettings()
            task.spawn(
                function()
                    while task.wait(20) do
                        if not _G.Settings.autocomplete then
                            break
                        end
                        for v, w in pairs(workspace.Map:GetChildren()) do
                            if w.Name == "Water" then
                                if #w:GetChildren() >= 1 then
                                    w:Destroy()
                                end
                            end
                        end
                        game:GetService("ReplicatedStorage").Remotes.launchBoat:FireServer()
                        tweenService, tweenInfo =
                            game:GetService("TweenService"),
                            TweenInfo.new(5, Enum.EasingStyle.Linear)
                        tweenService:Create(
                            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                            tweenInfo,
                            {CFrame = CFrame.new(3792.36279296875, 402.3984069824219, -4.879030704498291)}
                        ):Play()
                        wait(5)
                        tweenService, tweenInfo =
                            game:GetService("TweenService"),
                            TweenInfo.new(5, Enum.EasingStyle.Linear)
                        tweenService:Create(
                            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                            tweenInfo,
                            {CFrame = CFrame.new(-3331.44482421875, 403.3824157714844, -18.85951042175293)}
                        ):Play()
                        wait(5)
                        tweenService, tweenInfo =
                            game:GetService("TweenService"),
                            TweenInfo.new(5, Enum.EasingStyle.Linear)
                        tweenService:Create(
                            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                            tweenInfo,
                            {
                                CFrame = CFrame.new(
                                    -4242.271,
                                    196.536041,
                                    -40.0492935,
                                    0.882951856,
                                    -0,
                                    -0.469463557,
                                    0,
                                    1,
                                    -0,
                                    0.469463557,
                                    0,
                                    0.882951856
                                )
                            }
                        ):Play()
                    end
                end
            )
        end
    }
)
r:AddToggle(
    {
        Name = "Auto Spin",
        Default = _G.Settings.autospin,
        Callback = function(v)
            _G.Settings.autospin = v
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autospin then
                            break
                        end
                        game:GetService("ReplicatedStorage").Remotes.getDailyReward:InvokeServer()
                    end
                end
            )
        end
    }
)
s:AddToggle(
    {
        Name = "Auto Rejoin",
        Default = _G.Settings.autorejoin,
        Callback = function(v)
            _G.Settings.autorejoin = v
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autorejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(x)
                                if
                                    x.Name == "ErrorPrompt" and x:FindFirstChild("MessageArea") and
                                        x.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(6783611814, LocalPlayer)
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
        Name = "Remove Skin",
        Default = _G.Settings.autoremoveskin,
        Callback = function(v)
            _G.Settings.autoremoveskin = v
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoremoveskin then
                            break
                        end
                        spawn(
                            function()
                                for v, w in pairs(game.Workspace[game.Players.LocalPlayer.Name].Head:GetChildren()) do
                                    if w:IsA("Decal") and w.Name == "face" then
                                        w.Parent = nil
                                    end
                                end
                                local y = game:GetService("Players").LocalPlayer.Character
                                if y:FindFirstChild("Shirt") then
                                    y.Shirt:Remove()
                                end
                                if y:FindFirstChild("Pants") then
                                    y.Pants:Remove()
                                end
                                if y:FindFirstChild("Shirt Graphic") then
                                    y["Shirt Graphic"].Graphic = ""
                                end
                                if y:FindFirstChild("") then
                                    y.Pants:Remove()
                                end
                                for v, z in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
                                    if z:IsA("Accessory") then
                                        z:Destroy()
                                    end
                                end
                                game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                            end
                        )
                        spawn(
                            function()
                                local j = game:GetService("Players").LocalPlayer
                                local A
                                j.CharacterAdded:Connect(
                                    function(B)
                                        A = B:WaitForChild("Humanoid")
                                    end
                                )
                                A.Died:Connect(
                                    function()
                                        for v, w in pairs(
                                            game.Workspace[game.Players.LocalPlayer.Name].Head:GetChildren()
                                        ) do
                                            if w:IsA("Decal") and w.Name == "face" then
                                                w.Parent = nil
                                            end
                                        end
                                        local y = game:GetService("Players").LocalPlayer.Character
                                        if y:FindFirstChild("Shirt") then
                                            y.Shirt:Remove()
                                        end
                                        if y:FindFirstChild("Pants") then
                                            y.Pants:Remove()
                                        end
                                        if y:FindFirstChild("Shirt Graphic") then
                                            y["Shirt Graphic"].Graphic = ""
                                        end
                                        if y:FindFirstChild("") then
                                            y.Pants:Remove()
                                        end
                                        for v, z in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
                                            if z:IsA("Accessory") then
                                                z:Destroy()
                                            end
                                        end
                                        game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                        game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                        game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                        game.Players.LocalPlayer.Character.CharacterMesh:Remove()
                                        game.Players.LocalPlayer.Character.CharacterMesh:Remove()
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
t:AddLabel("None Setting for this Game")
u:AddButton(
    {Name = "Script by Bird Hub", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
u:AddButton(
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
u:AddTextbox(
    {Name = "Toggle Gui Key", Default = _G.Settings.toggleguikey, TextDisappear = false, Callback = function(v)
            _G.Settings.toggleguikey = v
            saveSettings()
        end}
)
p:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Build a Boat To Survive!", Time = 15})
p:Init()

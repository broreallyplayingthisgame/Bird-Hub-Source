if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {
    usemethod2 = false,
    enabled = false,
    antistuck = true,
    infinitestamina = false,
    usehitbox = 10,
    esp = false,
    autoequip = false,
    autospawn = false,
    usecustomaudio = true,
    antiparry = false,
    tpOverHead = false,
    loopspeed = 3.1,
    followclosest = false,
    autohit = false,
    range = 15,
    drawlines = false,
    autorejoin = false,
    antiradgoll = false,
    toggleguikey = "z"
}
local a = "Bird Hub"
local b = "Combat Warrior.lua"
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
function addLine(p, q)
    if not q.Parent.Torso:FindFirstChild("Beam") then
        if _G.Settings.drawlines == true then
            local r = Instance.new("Beam", q.Parent.Torso)
            local s = Instance.new("Attachment", q.Parent.Torso)
            local t = Instance.new("Attachment", p)
            r.Attachment0 = s
            r.Attachment1 = t
            r.Width0 = 0.2
            r.Width1 = 0.2
            r.LightEmission = 1
            r.LightInfluence = 0
            r.FaceCamera = true
            if q.Parent.Humanoid.Health <= 15 then
                r.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 0))
            else
                if q.Parent.Humanoid.Health >= 16 and q.Parent.Humanoid.Health <= 50 then
                    r.Color = ColorSequence.new(Color3.fromRGB(255, 170, 0), Color3.fromRGB(255, 170, 0))
                else
                    r.Color = ColorSequence.new(Color3.fromRGB(59, 255, 0), Color3.fromRGB(59, 255, 0))
                end
            end
        end
    end
end
function addEsp()
    for m, n in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if not n.HumanoidRootPart:FindFirstChild("eyeesspee") then
                local u = Instance.new("BillboardGui", n:WaitForChild("Head"))
                u.LightInfluence = 0
                u.Size = UDim2.new(40, 40, 1, 1)
                u.StudsOffset = Vector3.new(0, 3, 0)
                u.ZIndexBehavior = "Global"
                u.ClipsDescendants = false
                u.AlwaysOnTop = true
                u.Name = "Head"
                local v = Instance.new("BillboardGui", n:WaitForChild("HumanoidRootPart"))
                v.LightInfluence = 0
                v.Size = UDim2.new(3, 3, 5, 5)
                v.StudsOffset = Vector3.new(0, 0, 0)
                v.ZIndexBehavior = "Global"
                v.ClipsDescendants = false
                v.AlwaysOnTop = true
                v.Name = "eyeesspee"
                local w = Instance.new("TextBox", u)
                w.BackgroundTransparency = 1
                w.ClearTextOnFocus = false
                w.MultiLine = true
                w.Size = UDim2.new(1, 1, 1, 1)
                w.Font = "GothamBold"
                w.Text = n.Name
                w.TextScaled = true
                w.TextYAlignment = "Top"
                w.TextColor3 = Color3.fromRGB(255, 55, 55)
                local x = Instance.new("TextBox", v)
                x.BackgroundTransparency = 1
                x.ClearTextOnFocus = false
                x.MultiLine = true
                x.Size = UDim2.new(1, 1, 1, 1)
                x.Font = "GothamBold"
                x.Text = " "
                x.BackgroundTransparency = 0.85
                x.TextScaled = true
                x.TextYAlignment = "Top"
                x.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
            end
        end
    end
end
function removeEsp()
    for m, n in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.HumanoidRootPart:FindFirstChild("eyeesspee") then
                n.HumanoidRootPart:FindFirstChild("eyeesspee"):Destroy()
                n.Head.Head:Destroy()
            end
        end
    end
end
function randomPlayer()
    math.randomseed(os.time())
    local y = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    return y.DisplayName
end
local z = {""}
local function A(B)
    return B[math.random(1, #B)]
end
game.Players.LocalPlayer.leaderstats.Score.Changed:connect(
    function()
        if _G.Settings.killsay == true then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(A(z), "All")
        end
    end
)
function remLine(q)
    if q.Parent.Torso:FindFirstChild("Beam") then
        q.Parent.Torso:FindFirstChild("Beam"):Destroy()
    end
end
function walkToClosest()
    local C = nil
    local D = 999999
    local p = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    for m, n in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.Humanoid.Health ~= 0 then
                local q = n:FindFirstChild("HumanoidRootPart")
                if (p.Position - q.Position).Magnitude < D then
                    if q.Parent.Humanoid.Health ~= 0 then
                        D = (p.Position - q.Position).Magnitude
                        C = q
                    end
                end
            end
        end
    end
    if _G.Settings.autojump == true then
    end
    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").WalkToPoint = C.Position
end
function getClosestHrp()
    local C = nil
    local D = 999999
    local p = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    for m, n in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.Humanoid.Health ~= 0 then
                local q = n:FindFirstChild("HumanoidRootPart")
                if (p.Position - q.Position).Magnitude < D then
                    if (p.Position - q.Position).Magnitude <= _G.Settings.range and q.Parent.Humanoid.Health ~= 0 then
                        D = (p.Position - q.Position).Magnitude
                        C = q
                        addLine(p, q)
                    else
                        remLine(q)
                    end
                end
            end
        end
    end
    return C
end
function setAttachmentWorldCFrame(E, F)
    E.CFrame = E.Parent.CFrame:toObjectSpace(F)
end
local G = 0
local H = 0
local I = 0
local J = 0
local K = false
local L = 0
game:GetService("RunService").RenderStepped:connect(
    function()
        if game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") and _G.Settings.autospawn == true then
            keypress(0x20)
            keyrelease(0x20)
        end
        if _G.Settings.autoequip == true then
            if
                not game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool") and
                    not game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")
             then
                keypress(0x31)
                keyrelease(0x31)
            end
        end
        if I == 60 then
            if _G.Settings.esp == true then
                addEsp()
            else
                removeEsp()
            end
            I = 0
        end
        I = I + 1
        J = J + 1
        L = L + 1
        if H == 10 then
            if _G.Settings.followclosest == true then
                walkToClosest()
            end
            H = 0
        end
        H = H + 1
        if
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild(
                "Hitbox2"
            )
         then
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild(
                "Hitbox2"
            ):Destroy()
        end
        local M =
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool"):FindFirstChild(
            "ClientEquipProgress"
        )
        local q = getClosestHrp()
        if _G.Settings.usemethod2 == false then
            if J == _G.Settings.loopspeed or J > _G.Settings.loopspeed then
                J = 0
                for m, n in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes.Hitbox:GetChildren(

                    )
                ) do
                    if m <= _G.Settings.usehitbox then
                        if n.Name == "DmgPoint" then
                            if _G.Settings.antiparry == true then
                                if q.Parent.SemiTransparentShield.Transparency == 1 then
                                    M.Value = 1
                                    if _G.Settings.enabled == true then
                                        setAttachmentWorldCFrame(
                                            n,
                                            CFrame.new(
                                                q.Position +
                                                    Vector3.new(
                                                        math.random(-1, 1),
                                                        math.random(-1, 1),
                                                        math.random(-1, 1)
                                                    )
                                            )
                                        )
                                    end
                                else
                                    setAttachmentWorldCFrame(n, CFrame.new(q.Position + Vector3.new(123, 123, 123)))
                                    M.Value = 0
                                end
                            else
                                if _G.Settings.enabled == true then
                                    setAttachmentWorldCFrame(
                                        n,
                                        CFrame.new(
                                            q.Position +
                                                Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                        )
                                    )
                                end
                            end
                        end
                    else
                        setAttachmentWorldCFrame(
                            n,
                            CFrame.new(
                                game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Head").Position +
                                    Vector3.new(0, 10, 0)
                            )
                        )
                    end
                end
            end
            if _G.Settings.stompaura == true then
                for m, N in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren(

                    )
                ) do
                    if N.Name == "DmgPoint" then
                        N.Visible = true
                        if m <= _G.Settings.usehitbox then
                            if q.Parent.Humanoid.Health <= 15 then
                                setAttachmentWorldCFrame(
                                    N,
                                    CFrame.new(
                                        q.Position +
                                            Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                    )
                                )
                                if L >= 30 then
                                    keypress(0x51)
                                    keyrelease(0x51)
                                    L = 0
                                end
                            end
                        end
                    end
                end
            end
        else
            local O =
                game:GetService("Workspace").PlayerCharacters:FindFirstChild(
                game:GetService("Players").LocalPlayer.Name
            )
            local P = O:FindFirstChildOfClass("Tool").Hitboxes.Hitbox
            local Q = O:FindFirstChildOfClass("Tool").Hitboxes
            local R = O:FindFirstChildOfClass("Tool")
            local M = R:FindFirstChild("ClientEquipProgress")
            if Q:FindFirstChild("Hitbox2") then
                Q:FindFirstChild("Hitbox2"):Destroy()
            end
            if _G.Settings.stompaura == true then
                for m, N in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren(

                    )
                ) do
                    if N.Name == "DmgPoint" then
                        N.Visible = true
                        if m <= _G.Settings.usehitbox then
                            if q.Parent.Humanoid.Health <= 15 then
                                setAttachmentWorldCFrame(
                                    N,
                                    CFrame.new(
                                        q.Position +
                                            Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                    )
                                )
                                if L >= 30 then
                                    keypress(0x51)
                                    keyrelease(0x51)
                                    L = 0
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)
if _G.Settings.usecustomaudio == true then
    game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound.SoundId = "rbxassetid://5148302439"
    game:GetService("ReplicatedStorage").Shared.Assets.Sounds.AirdropOpen.SoundId = "rbxassetid://904663967"
    game:GetService("ReplicatedStorage").Shared.Assets.Sounds.UIClickSound.SoundId = "rbxassetid://2483029612"
    game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound.SoundId = "rbxassetid://165013277"
end
local S = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local T = S:MakeWindow({Name = "Bird Hub", HidePremium = true})
local U = T:MakeTab({Name = "AutoFarm", PremiumOnly = false})
local V = T:MakeTab({Name = "Player Setting", PremiumOnly = false})
local W = T:MakeTab({Name = "Extra", PremiumOnly = false})
local X = T:MakeTab({Name = "Credits", PremiumOnly = false})
U:AddToggle(
    {Name = "Auto Walk", Default = _G.Settings.followclosest, Callback = function(Y)
            _G.Settings.followclosest = Y
            saveSettings()
        end}
)
U:AddToggle(
    {Name = "Auto Respawn", Default = _G.Settings.autospawn, Callback = function(Y)
            _G.Settings.autospawn = Y
            saveSettings()
        end}
)
U:AddToggle(
    {Name = "Auto Equip", Default = _G.Settings.autoequip, Callback = function(Y)
            _G.Settings.autoequip = Y
            saveSettings()
        end}
)
U:AddToggle(
    {
        Name = "Auto Attack (Need stay in roblox)",
        Default = _G.Settings.autohit,
        Callback = function(Y)
            _G.Settings.autohit = Y
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autohit then
                            break
                        end
                        mouse1click()
                    end
                end
            )
        end
    }
)
V:AddToggle(
    {Name = "Anti-Parry", Default = _G.Settings.antiparry, Callback = function(Y)
            _G.Settings.antiparry = Y
            saveSettings()
        end}
)
W:AddToggle(
    {
        Name = "Rejoin If Kick",
        Default = _G.Settings.autorejoin,
        Callback = function(Y)
            _G.Settings.autorejoin = Y
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autorejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(Z)
                                if
                                    Z.Name == "ErrorPrompt" and Z:FindFirstChild("MessageArea") and
                                        Z.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(4282985734, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
W:AddToggle(
    {Name = "Esp", Default = _G.Settings.esp, Callback = function(Y)
            _G.Settings.esp = Y
            saveSettings()
        end}
)
V:AddToggle(
    {
        Name = "Anti Radgoll",
        Default = _G.Settings.antiradgoll,
        Callback = function(Y)
            _G.Settings.antiradgoll = Y
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.antiradgoll then
                            break
                        end
                        game:GetService("Players").LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
                    end
                end
            )
        end
    }
)
X:AddButton(
    {Name = "Script by Bird Hub", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
X:AddButton(
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
X:AddTextbox(
    {Name = "Toggle Gui Key", Default = _G.Settings.toggleguikey, TextDisappear = false, Callback = function(Y)
            _G.Settings.toggleguikey = Y
            saveSettings()
        end}
)
S:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Combat Warrior", Time = 15})
S:Init()

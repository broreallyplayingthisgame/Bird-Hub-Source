if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {
    autofarmcustom = false,
    autofarmevent = false,
    toggleguikey = "z",
    autorejoin = false,
    autospin1 = false,
    selectlevel = 1,
    spindelay = 1,
    spinnumber = 1,
    autospin2 = false,
    autolvl = false,
    autoultimate = false,
    selectdifficulty = "Easy",
    selectworld = 1,
    LeaveOneLeft = false,
    autoquit = false,
    autoretry = true,
    AutoFeed1 = false,
    AutoFeed2 = false,
    AutoFeed3 = false,
    AutoFeed4 = false,
    UnitToFeed = "None"
}
local a = "Bird Hub"
local b = "AnimeBrawler.lua"
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
local p = {1, 10}
local q = {"Easy", "Normal", "Hard", "Extreme"}
local r = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 500}
local s = {1, 2, 3, 4, 5}
local t = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local u = t:MakeWindow({Name = "Bird Hub", HidePremium = true})
local v = u:MakeTab({Name = "Main", PremiumOnly = false})
local w = u:MakeTab({Name = "Extra", PremiumOnly = false})
local x = u:MakeTab({Name = "Auto Feed", PremiumOnly = false})
local y = u:MakeTab({Name = "Auto Spin", PremiumOnly = false})
local z = u:MakeTab({Name = "Setting", PremiumOnly = false})
local A = u:MakeTab({Name = "Credits", PremiumOnly = false})
v:AddToggle(
    {
        Name = "Farm Map",
        Default = _G.Settings.autofarmcustom,
        Callback = function(B)
            _G.Settings.autofarmcustom = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autofarmcustom then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            game:GetService("ReplicatedStorage").RemoteFunctions.JoinWorld:InvokeServer(
                                _G.Settings.selectworld,
                                _G.Settings.selectlevel,
                                _G.Settings.selectdifficulty
                            )
                        end
                    end
                end
            )
        end
    }
)
v:AddToggle(
    {
        Name = "Farm Event",
        Default = _G.Settings.autofarmevent,
        Callback = function(B)
            _G.Settings.autofarmevent = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.autofarmevent then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            game:GetService("ReplicatedStorage").RemoteFunctions.JoinWorld:InvokeServer(
                                1,
                                600,
                                _G.Settings.selectdifficulty
                            )
                        end
                    end
                end
            )
        end
    }
)
v:AddToggle(
    {
        Name = "Auto Lvl (In-Dev)",
        Default = _G.Settings.autolvl,
        Callback = function(B)
            _G.Settings.autolvl = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autolvl then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                        end
                    end
                end
            )
        end
    }
)
y:AddToggle(
    {
        Name = "Spin With Gold",
        Default = _G.Settings.autospin1,
        Callback = function(B)
            _G.Settings.autospin1 = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.autospin1 then
                            break
                        end
                        wait(_G.Settings.spindelay)
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            game:GetService("ReplicatedStorage").RemoteFunctions.BuySpin:InvokeServer(
                                false,
                                _G.Settings.spinnumber
                            )
                        end
                    end
                end
            )
        end
    }
)
y:AddToggle(
    {
        Name = "Spin With Gem",
        Default = _G.Settings.autospin2,
        Callback = function(B)
            _G.Settings.autospin2 = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.autospin2 then
                            break
                        end
                        wait(_G.Settings.spindelay)
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            game:GetService("ReplicatedStorage").RemoteFunctions.BuySpin:InvokeServer(
                                true,
                                _G.Settings.spinnumber
                            )
                        end
                    end
                end
            )
        end
    }
)
y:AddDropdown(
    {Name = "Much Spin", Default = _G.Settings.spinnumber, Options = p, Callback = function(B)
            _G.Settings.spinnumber = B
            saveSettings()
        end}
)
y:AddSlider(
    {Name = "Spin Delay", Default = _G.Settings.spindelay, Min = 0, Max = 3, Callback = function(B)
            _G.Settings.spindelay = B
            saveSettings()
        end}
)
w:AddLabel("Utility")
w:AddToggle(
    {
        Name = "Auto Ultimate",
        Default = _G.Settings.autoultimate,
        Callback = function(B)
            _G.Settings.autoultimate = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.autoultimate then
                            break
                        end
                        wait()
                        for m, n in pairs(game:GetService("Workspace"):WaitForChild("Team1").Units:GetChildren()) do
                            if n:FindFirstChild("Stats") then
                                if
                                    n.Stats.UltimatePoints.Value >= n.Stats.UltimateMax.Value and
                                        n.Stats.UltRequest.Value == false and
                                        (not n.Stats:FindFirstChild("UseUlt") or n.Stats.UseUlt.Value == false)
                                 then
                                    local C = n.Stats.PositionPlate.Value.Name
                                    local D = game:GetService("ReplicatedStorage").RemoteEvents.UltRequestFromClient
                                    D:FireServer(C)
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
w:AddToggle(
    {
        Name = "Auto Spin Wheel",
        Default = _G.Settings.autospin,
        Callback = function(B)
            _G.Settings.autospin = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(2) do
                        if not _G.Settings.autospin then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            game:GetService("ReplicatedStorage").RemoteFunctions.SpinWheel:InvokeServer()
                        end
                    end
                end
            )
        end
    }
)
x:AddLabel("Rarity You Want Use For Feed")
x:AddToggle(
    {
        Name = "Feed With Common",
        Default = _G.Settings.AutoFeed1,
        Callback = function(B)
            _G.Settings.AutoFeed1 = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoFeed1 then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            _G.Settings.allowedRarity = {"Common"}
                            local function E()
                                return game:GetService("ReplicatedStorage").RemoteFunctions.GivePlayerData:InvokeServer(

                                )
                            end
                            local function F(G)
                                if
                                    game:GetService("ReplicatedStorage").Units:FindFirstChild(G) and
                                        game:GetService("ReplicatedStorage").Units[G]:FindFirstChild("Stats")
                                 then
                                    return game:GetService("ReplicatedStorage").Units[G].Stats.Stars.Value
                                end
                            end
                            local function H()
                                local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                                local J = {}
                                local K = E().Units
                                for m, n in pairs(K) do
                                    if type(n) == "string" then
                                        table.insert(J, {Unit = n, Amount = K[m + 2], Rarity = I[F(n)]})
                                    end
                                end
                                return J
                            end
                            local function L(I)
                                for m, n in pairs(_G.Settings.allowedRarity) do
                                    if n == I then
                                        return true
                                    end
                                end
                                return false
                            end
                            local M = E().Units
                            local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                            local N = E()
                            for m, n in pairs(H()) do
                                if L(n.Rarity) then
                                    if n.Amount == 1 and not _G.Settings.LeaveOneLeft or n.Amount > 1 then
                                        local O = 0
                                        if _G.Settings.LeaveOneLeft and n.Amount > 1 then
                                            O = n.Amount - 1
                                        else
                                            O = n.Amount
                                        end
                                        local C = _G.Settings.UnitToFeed
                                        local P = {[1] = n.Unit, [2] = O}
                                        local D = game:GetService("ReplicatedStorage").RemoteEvents.FeedUnit
                                        D:FireServer(C, P)
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
x:AddToggle(
    {
        Name = "Feed With Uncommon",
        Default = _G.Settings.AutoFeed2,
        Callback = function(B)
            _G.Settings.AutoFeed2 = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoFeed2 then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            _G.Settings.allowedRarity = {"Uncommon"}
                            local function E()
                                return game:GetService("ReplicatedStorage").RemoteFunctions.GivePlayerData:InvokeServer(

                                )
                            end
                            local function F(G)
                                if
                                    game:GetService("ReplicatedStorage").Units:FindFirstChild(G) and
                                        game:GetService("ReplicatedStorage").Units[G]:FindFirstChild("Stats")
                                 then
                                    return game:GetService("ReplicatedStorage").Units[G].Stats.Stars.Value
                                end
                            end
                            local function H()
                                local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                                local J = {}
                                local K = E().Units
                                for m, n in pairs(K) do
                                    if type(n) == "string" then
                                        table.insert(J, {Unit = n, Amount = K[m + 2], Rarity = I[F(n)]})
                                    end
                                end
                                return J
                            end
                            local function L(I)
                                for m, n in pairs(_G.Settings.allowedRarity) do
                                    if n == I then
                                        return true
                                    end
                                end
                                return false
                            end
                            local M = E().Units
                            local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                            local N = E()
                            for m, n in pairs(H()) do
                                if L(n.Rarity) then
                                    if n.Amount == 1 and not _G.Settings.LeaveOneLeft or n.Amount > 1 then
                                        local O = 0
                                        if _G.Settings.LeaveOneLeft and n.Amount > 1 then
                                            O = n.Amount - 1
                                        else
                                            O = n.Amount
                                        end
                                        local C = _G.Settings.UnitToFeed
                                        local P = {[1] = n.Unit, [2] = O}
                                        local D = game:GetService("ReplicatedStorage").RemoteEvents.FeedUnit
                                        D:FireServer(C, P)
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
x:AddToggle(
    {
        Name = "Feed With Epic",
        Default = _G.Settings.AutoFeed3,
        Callback = function(B)
            _G.Settings.AutoFeed3 = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoFeed3 then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            _G.Settings.allowedRarity = {"Epic"}
                            local function E()
                                return game:GetService("ReplicatedStorage").RemoteFunctions.GivePlayerData:InvokeServer(

                                )
                            end
                            local function F(G)
                                if
                                    game:GetService("ReplicatedStorage").Units:FindFirstChild(G) and
                                        game:GetService("ReplicatedStorage").Units[G]:FindFirstChild("Stats")
                                 then
                                    return game:GetService("ReplicatedStorage").Units[G].Stats.Stars.Value
                                end
                            end
                            local function H()
                                local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                                local J = {}
                                local K = E().Units
                                for m, n in pairs(K) do
                                    if type(n) == "string" then
                                        table.insert(J, {Unit = n, Amount = K[m + 2], Rarity = I[F(n)]})
                                    end
                                end
                                return J
                            end
                            local function L(I)
                                for m, n in pairs(_G.Settings.allowedRarity) do
                                    if n == I then
                                        return true
                                    end
                                end
                                return false
                            end
                            local M = E().Units
                            local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                            local N = E()
                            for m, n in pairs(H()) do
                                if L(n.Rarity) then
                                    if n.Amount == 1 and not _G.Settings.LeaveOneLeft or n.Amount > 1 then
                                        local O = 0
                                        if _G.Settings.LeaveOneLeft and n.Amount > 1 then
                                            O = n.Amount - 1
                                        else
                                            O = n.Amount
                                        end
                                        local C = _G.Settings.UnitToFeed
                                        local P = {[1] = n.Unit, [2] = O}
                                        local D = game:GetService("ReplicatedStorage").RemoteEvents.FeedUnit
                                        D:FireServer(C, P)
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
x:AddToggle(
    {
        Name = "Feed With Legendary",
        Default = _G.Settings.AutoFeed4,
        Callback = function(B)
            _G.Settings.AutoFeed4 = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoFeed4 then
                            break
                        end
                        wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.OpenSpinWheel.Visible == true then
                            _G.Settings.allowedRarity = {"Legendary"}
                            local function E()
                                return game:GetService("ReplicatedStorage").RemoteFunctions.GivePlayerData:InvokeServer(

                                )
                            end
                            local function F(G)
                                if
                                    game:GetService("ReplicatedStorage").Units:FindFirstChild(G) and
                                        game:GetService("ReplicatedStorage").Units[G]:FindFirstChild("Stats")
                                 then
                                    return game:GetService("ReplicatedStorage").Units[G].Stats.Stars.Value
                                end
                            end
                            local function H()
                                local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                                local J = {}
                                local K = E().Units
                                for m, n in pairs(K) do
                                    if type(n) == "string" then
                                        table.insert(J, {Unit = n, Amount = K[m + 2], Rarity = I[F(n)]})
                                    end
                                end
                                return J
                            end
                            local function L(I)
                                for m, n in pairs(_G.Settings.allowedRarity) do
                                    if n == I then
                                        return true
                                    end
                                end
                                return false
                            end
                            local M = E().Units
                            local I = {"Common", "Uncommon", "Epic", "Mythical", "Legendary"}
                            local N = E()
                            for m, n in pairs(H()) do
                                if L(n.Rarity) then
                                    if n.Amount == 1 and not _G.Settings.LeaveOneLeft or n.Amount > 1 then
                                        local O = 0
                                        if _G.Settings.LeaveOneLeft and n.Amount > 1 then
                                            O = n.Amount - 1
                                        else
                                            O = n.Amount
                                        end
                                        local C = _G.Settings.UnitToFeed
                                        local P = {[1] = n.Unit, [2] = O}
                                        local D = game:GetService("ReplicatedStorage").RemoteEvents.FeedUnit
                                        D:FireServer(C, P)
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
x:AddLabel("Options")
x:AddToggle(
    {Name = "Only Feed If Have Double", Default = _G.Settings.LeaveOneLeft, Callback = function(B)
            _G.Settings.LeaveOneLeft = B
            saveSettings()
        end}
)
w:AddLabel("Game Rejoin Option")
w:AddToggle(
    {
        Name = "Auto Leave",
        Default = _G.Settings.autoquit,
        Callback = function(B)
            _G.Settings.autoquit = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.autoquit then
                            break
                        end
                        wait()
                        if
                            game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and
                                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("OutroFrame") and
                                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.OutroFrame.Visible == true
                         then
                            game.ReplicatedStorage.RemoteFunctions.JoinWorld:InvokeServer()
                        end
                    end
                end
            )
        end
    }
)
w:AddToggle(
    {
        Name = "Auto Retry",
        Default = _G.Settings.autoretry,
        Callback = function(B)
            _G.Settings.autoretry = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.autoretry then
                            break
                        end
                        wait()
                        if
                            game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and
                                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("OutroFrame") and
                                game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.OutroFrame.Visible == true
                         then
                            game:GetService("ReplicatedStorage").RemoteFunctions.ReplayWorld:InvokeServer()
                        end
                    end
                end
            )
        end
    }
)
z:AddLabel("Map Farm Option")
z:AddDropdown(
    {Name = "Select World", Default = _G.Settings.selectworld, Options = s, Callback = function(B)
            _G.Settings.selectworld = B
            saveSettings()
        end}
)
z:AddLabel("500 = Infinite")
z:AddDropdown(
    {Name = "Select Map", Default = _G.Settings.selectlevel, Options = r, Callback = function(B)
            _G.Settings.selectlevel = B
            saveSettings()
        end}
)
z:AddDropdown(
    {Name = "Select Difficulty", Default = _G.Settings.selectdifficulty, Options = q, Callback = function(B)
            _G.Settings.selectdifficulty = B
            saveSettings()
        end}
)
x:AddTextbox(
    {Name = "Unit To Feed", Default = _G.Settings.UnitToFeed, TextDisappear = false, Callback = function(B)
            _G.Settings.UnitToFeed = B
            saveSettings()
        end}
)
w:AddToggle(
    {
        Name = "Rejoin If Kick",
        Default = _G.Settings.autorejoin,
        Callback = function(B)
            _G.Settings.autorejoin = B
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autorejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(Q)
                                if
                                    Q.Name == "ErrorPrompt" and Q:FindFirstChild("MessageArea") and
                                        Q.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(6310438798, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
A:AddButton(
    {Name = "Script by Bird Hub", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
A:AddButton(
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
A:AddTextbox(
    {Name = "Toggle Gui Key", Default = _G.Settings.toggleguikey, TextDisappear = false, Callback = function(B)
            _G.Settings.toggleguikey = B
            saveSettings()
        end}
)
t:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Anime Brawl All Out", Time = 15})
t:Init()

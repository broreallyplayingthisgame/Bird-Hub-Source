if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {
    farmraidtoken = false,
    skilldelay = false,
    Raidselectmap = "None",
    distance = 10,
    toggleguikey = "z",
    Hardcore = false,
    afkandraid = false,
    autospingem = false,
    autoclaimrewardraid = false,
    FriendsOnly = true,
    eggspintime = "3",
    autoclaimrewardspeed = false,
    equipselectmain = false,
    equipselectmain1 = false,
    equipselectmain2 = false,
    selectmain = "None",
    selectmain1 = "None",
    selectmain2 = "None",
    autosellcommon = false,
    autoselluncommon = false,
    autosellrare = false,
    autosellepic = false,
    selectegg = "None",
    autoselllegendary = false,
    autoequipbest = false,
    autoupgrade = false,
    Height = 20,
    Height1 = -20,
    otherds = "@here",
    dsuser = "Not Set",
    AutoPunch = true,
    punchdelay = "1.5",
    custommapselect = "None",
    webhookspeed = "6",
    AutoFarm = false,
    AutoTP = false,
    AutoTP1 = false,
    AutoTP2 = true,
    CustomDifficulty = "None",
    Autocustom = false,
    AutoRetry = false,
    webhookurl = "",
    AutoSkill1 = true,
    AutoSkill2 = true,
    AutoSkill3 = true,
    AutoSkill4 = true,
    AutoSkill5 = true,
    AutoSkill6 = true,
    kickwebhook = false,
    Speed = 80,
    Hidename = false,
    Autolvl = false,
    Autospeedraid = false,
    Autoboss = false,
    webhook = false,
    raidwebhook = false,
    Autoraid = false,
    kickrejoin = false
}
local a = "Bird Hub"
local b = "AnimeDimension.lua"
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
local p = {
    "Yoriichi",
    "Saber Alter Character",
    "Alice",
    "Sung Jin Woo",
    "Infinity Gojo",
    "MilimCharacter (Valentine)",
    "Ryuko",
    "Broly",
    "Gilgamesh",
    "Attack Titan",
    "Kokushibo",
    "Ice Queen Esdeath",
    "Eugeo",
    "Katakuri",
    "Levi",
    "Naruto Six Paths",
    "Genos",
    "Gojo",
    "RimuruDemonLord",
    "KiritoCharacter",
    "Megumin (Halloween)",
    "RengokuCharacter",
    "KanekiCharacter",
    "Lancer",
    "Nezuko (New Year)",
    "TogaCharacter (Halloween)",
    "Megumin (Halloween)",
    "Emiya Archer",
    "Sukuna",
    "AsunaCharacter",
    "Zoro",
    "All Might",
    "Rukia",
    "Shinra",
    "Tanjiro",
    "Gray",
    "Sasuke",
    "Akaza",
    "Asta",
    "Killua",
    "Natsu",
    "Sakura",
    "Accelerator",
    "Deku",
    "Goku",
    "Ichigo",
    "Luffy",
    "Naruto"
}
local q = {
    "Infinite Mode",
    "Titan Dimension",
    "Demon Dimension",
    "Curse Dimension",
    "Villain Dimension",
    "Sword Dimension",
    "Ghoul Dimension",
    "Fate Dimension",
    "Slime Dimension"
}
local r = {"Easy", "Hard", "Nightmare", "Infinite"}
local s = {"Capsule Series 1", "Raid Capsule", "Infinity Nojo Capsule", "Esper Capsule"}
local t = {"Esper Raid", "Tengoku Raid", "Hirito Raid", "Titan Raid", "Infinity Nojo Raid"}
local u = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local v = u:MakeWindow({Name = "Bird Hub", HidePremium = true})
local w = v:MakeTab({Name = "Main", PremiumOnly = false})
local x = v:MakeTab({Name = "Extra", PremiumOnly = false})
local y = v:MakeTab({Name = "Setting", PremiumOnly = false})
local z = v:MakeTab({Name = "Notifier", PremiumOnly = false})
local A = v:MakeTab({Name = "Inventory", PremiumOnly = false})
local B = v:MakeTab({Name = "Auto Spin", PremiumOnly = false})
local C = v:MakeTab({Name = "Auto Claim", PremiumOnly = false})
local D = v:MakeTab({Name = "TP Method", PremiumOnly = false})
local E = v:MakeTab({Name = "Auto Skill", PremiumOnly = false})
local F = v:MakeTab({Name = "Afk Farm", PremiumOnly = false})
local G = v:MakeTab({Name = "Credits", PremiumOnly = false})
w:AddLabel("Dont forgot to config hub")
w:AddToggle(
    {
        Name = "Auto Lvl",
        Default = _G.Settings.Autolvl,
        Callback = function(H)
            _G.Settings.Autolvl = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(15) do
                        if not _G.Settings.Autolvl then
                            break
                        end
                        wait(10)
                        Lvl = game.Players.LocalPlayer.leaderstats.Level.Value
                        if Lvl > 0 and Lvl < 6 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Titan Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 5 and Lvl < 11 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Titan Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 10 and Lvl < 16 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Titan Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 15 and Lvl < 21 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Demon Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 20 and Lvl < 26 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Demon Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 25 and Lvl < 31 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Demon Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 30 and Lvl < 36 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Curse Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 35 and Lvl < 41 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Curse Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 40 and Lvl < 46 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Curse Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 45 and Lvl < 51 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Villain Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 50 and Lvl < 56 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Villain Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 55 and Lvl < 61 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Villain Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 60 and Lvl < 68 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Sword Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 67 and Lvl < 76 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Sword Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 75 and Lvl < 83 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Ghoul Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 82 and Lvl < 91 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Ghoul Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 90 and Lvl < 98 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Fate Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 97 and Lvl < 106 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Fate Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 105 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Slime Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                    end
                end
            )
        end
    }
)
w:AddToggle(
    {
        Name = "Farm Time Challenge",
        Default = _G.Settings.Autotrial,
        Callback = function(H)
            _G.Settings.Autotrial = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(15) do
                        if not _G.Settings.Autotrial then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportToTimeChallenge"
                        )
                    end
                end
            )
        end
    }
)
w:AddToggle(
    {
        Name = "Farm Specific Map",
        Default = _G.Settings.Autocustom,
        Callback = function(H)
            _G.Settings.Autocustom = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(15) do
                        if not _G.Settings.Autocustom then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CreateRoom",
                            {
                                ["Difficulty"] = _G.Settings.CustomDifficulty,
                                ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                ["MapName"] = _G.Settings.custommapselect,
                                ["Hardcore"] = false
                            }
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportPlayers"
                        )
                    end
                end
            )
        end
    }
)
w:AddToggle(
    {
        Name = "Farm Raid",
        Default = _G.Settings.Autoraid,
        Callback = function(H)
            _G.Settings.Autoraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(12) do
                        if not _G.Settings.Autoraid then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CreateRoom",
                            {
                                ["Difficulty"] = "Easy",
                                ["FriendsOnly"] = true,
                                ["MapName"] = _G.Settings.Raidselectmap,
                                ["Hardcore"] = false
                            }
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportPlayers"
                        )
                    end
                end
            )
        end
    }
)
F:AddToggle(
    {
        Name = "Farm Raid + AFK",
        Default = _G.Settings.afkandraid,
        Callback = function(H)
            _G.Settings.afkandraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(2) do
                        if not _G.Settings.afkandraid then
                            break
                        end
                        spawn(
                            function()
                                if game.PlaceId == 7274690025 or game.PlaceId == 6938803436 then
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "CreateRoom",
                                        {
                                            ["Difficulty"] = "Easy",
                                            ["FriendsOnly"] = true,
                                            ["MapName"] = _G.Settings.Raidselectmap,
                                            ["Hardcore"] = false
                                        }
                                    )
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "TeleportPlayers"
                                    )
                                    wait(5)
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "TeleportToAFK"
                                    )
                                end
                            end
                        )
                        spawn(
                            function()
                                if game.PlaceId == 6990131029 then
                                    wait(300)
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "TeleportToLobbyAFK",
                                        true
                                    )
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
F:AddLabel("Option")
F:AddToggle(
    {
        Name = "Farm Raid Token",
        Default = _G.Settings.farmraidtoken,
        Callback = function(H)
            _G.Settings.farmraidtoken = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(260) do
                        if not _G.Settings.farmraidtoken then
                            break
                        end
                        spawn(
                            function()
                                if game.PlaceId == 6990131029 then
                                    _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                                    valuecurrency = game.ReplicatedStorage[_G.Name].AfkCurrencyChosen.Value
                                    if valuecurrency == "Gem" then
                                        wait(1)
                                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                            "ChangeAFKCurrency"
                                        )
                                        for m, n in pairs(
                                            getconnections(
                                                game.Players.LocalPlayer.PlayerGui.AfkGui.CenterUIFrame.Frame.ChangeCurrency.MouseButton1Click
                                            )
                                        ) do
                                            n:Fire()
                                        end
                                    end
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
F:AddLabel("Farm Token don't change text & icon in gui")
F:AddLabel("If You Want Farm Gem Untoggle Farm Raid Token")
w:AddToggle(
    {
        Name = "Farm Boss Rush",
        Default = _G.Settings.Autoboss,
        Callback = function(H)
            _G.Settings.Autoboss = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(13) do
                        if not _G.Settings.Autoboss then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportToBossRush"
                        )
                    end
                end
            )
        end
    }
)
A:AddToggle(
    {
        Name = "Auto Sell Common",
        Default = _G.Settings.autosellcommon,
        Callback = function(H)
            _G.Settings.autosellcommon = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autosellcommon then
                            break
                        end
                        wait()
                        local I = {"Common"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
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
A:AddToggle(
    {
        Name = "Auto Sell Uncommon",
        Default = _G.Settings.autoselluncommon,
        Callback = function(H)
            _G.Settings.autoselluncommon = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoselluncommon then
                            break
                        end
                        wait()
                        local I = {"Uncommon"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
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
A:AddToggle(
    {
        Name = "Auto Sell Rare",
        Default = _G.Settings.autosellrare,
        Callback = function(H)
            _G.Settings.autosellrare = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autosellrare then
                            break
                        end
                        wait()
                        local I = {"Rare"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
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
A:AddToggle(
    {
        Name = "Auto Sell Epic",
        Default = _G.Settings.autosellepic,
        Callback = function(H)
            _G.Settings.autosellepic = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autosellepic then
                            break
                        end
                        wait()
                        local I = {"Epic"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
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
A:AddToggle(
    {
        Name = "Auto Sell Legendary",
        Default = _G.Settings.autoselllegendary,
        Callback = function(H)
            _G.Settings.autoselllegendary = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoselllegendary then
                            break
                        end
                        wait()
                        local I = {"Legendary"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
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
A:AddToggle(
    {
        Name = "Auto Equip Best (In-Dev)",
        Default = _G.Settings.autoequipbest,
        Callback = function(H)
            _G.Settings.autoequipbest = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autoequipbest then
                            break
                        end
                        wait(2)
                    end
                end
            )
        end
    }
)
A:AddToggle(
    {
        Name = "Auto Upgrade (In-Dev)",
        Default = _G.Settings.autoupgrade,
        Callback = function(H)
            _G.Settings.autoupgrade = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autoupgrade then
                            break
                        end
                        wait(2)
                    end
                end
            )
        end
    }
)
D:AddToggle(
    {
        Name = "TP Over",
        Default = _G.Settings.AutoTP,
        Callback = function(H)
            _G.Settings.AutoTP = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoTP then
                            break
                        end
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(16)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                            end
                        )
                        pcall(
                            function()
                                for m, n in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
                                    repeat
                                        game:GetService("RunService").Heartbeat:wait()
                                        local T =
                                            (n.Head.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if T < 999 then
                                            Speed2 = _G.Settings.Speed
                                        end
                                        local U = game:service "TweenService"
                                        local V = TweenInfo.new(T / Speed2, Enum.EasingStyle.Linear)
                                        local W =
                                            U:Create(
                                            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                            V,
                                            {
                                                CFrame = n.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) +
                                                    Vector3.new(0, _G.Settings.Height, 0)
                                            }
                                        )
                                        W:Play()
                                        wait(T / Speed2)
                                    until not _G.Settings.AutoTP or n.Humanoid.Health <= 0 or not n.Parent or not n
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
D:AddToggle(
    {
        Name = "TP Under",
        Default = _G.Settings.AutoTP1,
        Callback = function(H)
            _G.Settings.AutoTP1 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoTP1 then
                            break
                        end
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(16)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                            end
                        )
                        pcall(
                            function()
                                for m, n in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
                                    repeat
                                        game:GetService("RunService").Heartbeat:wait()
                                        local T =
                                            (n.Head.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if T < 999 then
                                            Speed2 = _G.Settings.Speed
                                        end
                                        local U = game:service "TweenService"
                                        local V = TweenInfo.new(T / Speed2, Enum.EasingStyle.Linear)
                                        local W =
                                            U:Create(
                                            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                            V,
                                            {
                                                CFrame = n.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) +
                                                    Vector3.new(0, _G.Settings.Height1, 0)
                                            }
                                        )
                                        W:Play()
                                        wait(T / Speed2)
                                    until not _G.Settings.AutoTP1 or n.Humanoid.Health <= 0 or not n.Parent or not n
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
D:AddToggle(
    {
        Name = "TP Behind",
        Default = _G.Settings.AutoTP2,
        Callback = function(H)
            _G.Settings.AutoTP2 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoTP2 then
                            break
                        end
                        pcall(
                            function()
                                for m, n in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
                                    repeat
                                        game:GetService("RunService").Heartbeat:wait()
                                        local T =
                                            (n.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if T < 999 then
                                            Speed2 = _G.Settings.Speed
                                        elseif T < 1000 then
                                            Speed2 = _G.Settings.Speed
                                        elseif T >= 1000 then
                                            Speed2 = _G.Settings.Speed
                                        end
                                        local U = game:service "TweenService"
                                        local V = TweenInfo.new(T / Speed2, Enum.EasingStyle.Linear)
                                        local W =
                                            U:Create(
                                            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                            V,
                                            {
                                                CFrame = n.HumanoidRootPart.CFrame *
                                                    CFrame.new(0, 0, _G.Settings.distance)
                                            }
                                        )
                                        W:Play()
                                        wait(T / Speed2)
                                    until not _G.Settings.AutoTP2 or n.Humanoid.Health <= 0 or not n.Parent or not n
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
w:AddToggle(
    {
        Name = "Farm Speed Raid",
        Default = _G.Settings.Autospeedraid,
        Callback = function(H)
            _G.Settings.Autospeedraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(2) do
                        if not _G.Settings.Autospeedraid then
                            break
                        end
                        wait()
                        local X = {
                            "Sung Jin Woo",
                            "MilimCharacter (Valentine)",
                            "Ryuko",
                            "Saber Alter Character",
                            "Alice",
                            "Broly",
                            "Gilgamesh",
                            "Kokushibo",
                            "Ice Queen Esdeath",
                            "Katakuri",
                            "Levi",
                            "Naruto Six Paths",
                            "RimuruDemonLord",
                            "KiritoCharacter",
                            "Megumin (Halloween)",
                            "RengokuCharacter",
                            "KanekiCharacter",
                            "Lancer",
                            "Nezuko (New Year)",
                            "TogaCharacter (Halloween)",
                            "Megumin (Halloween)",
                            "Emiya Archer",
                            "Sukuna",
                            "Infinity Gojo",
                            "AsunaCharacter",
                            "Zoro",
                            "All Might",
                            "Rukia",
                            "Shinra",
                            "Tanjiro",
                            "Gray",
                            "Sasuke",
                            "Akaza",
                            "Asta",
                            "Killua",
                            "Natsu",
                            "Sakura",
                            "Accelerator",
                            "Deku",
                            "Goku",
                            "Ichigo",
                            "Luffy",
                            "Naruto",
                            "Gojo",
                            "Genos",
                            "Attack Titan",
                            "Eugeo"
                        }
                        local Y = math.random(1, #X)
                        local Z = X[Y]
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportToShadowRaid",
                            Z
                        )
                    end
                end
            )
        end
    }
)
y:AddDropdown(
    {Name = "Select Difficulty", Default = _G.Settings.CustomDifficulty, Options = r, Callback = function(H)
            _G.Settings.CustomDifficulty = H
            saveSettings()
        end}
)
B:AddDropdown(
    {Name = "Select Egg", Default = _G.Settings.selectegg, Options = s, Callback = function(H)
            _G.Settings.selectegg = H
            saveSettings()
        end}
)
y:AddDropdown(
    {Name = "Select Map", Default = _G.Settings.custommapselect, Options = q, Callback = function(H)
            _G.Settings.custommapselect = H
            saveSettings()
        end}
)
y:AddDropdown(
    {Name = "Select Raid", Default = _G.Settings.Raidselectmap, Options = t, Callback = function(H)
            _G.Settings.Raidselectmap = H
            saveSettings()
        end}
)
y:AddToggle(
    {
        Name = "Equip Select Main",
        Default = _G.Settings.equipselectmain,
        Callback = function(H)
            _G.Settings.equipselectmain = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(8) do
                        if not _G.Settings.equipselectmain then
                            break
                        end
                        wait(3)
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "EquipCharacter",
                            _G.Settings.selectmain
                        )
                    end
                end
            )
        end
    }
)
y:AddToggle(
    {
        Name = "Equip Select Assist1",
        Default = _G.Settings.equipselectmain1,
        Callback = function(H)
            _G.Settings.equipselectmain1 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(8) do
                        if not _G.Settings.equipselectmain1 then
                            break
                        end
                        wait(3)
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "EquipCharacterAssist",
                            _G.Settings.selectmain1,
                            1
                        )
                    end
                end
            )
        end
    }
)
y:AddToggle(
    {
        Name = "Equip Select Assist2",
        Default = _G.Settings.equipselectmain2,
        Callback = function(H)
            _G.Settings.equipselectmain2 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(8) do
                        if not _G.Settings.equipselectmain2 then
                            break
                        end
                        wait(3)
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "EquipCharacterAssist",
                            _G.Settings.selectmain2,
                            2
                        )
                    end
                end
            )
        end
    }
)
y:AddDropdown(
    {Name = "Main Character", Default = _G.Settings.selectmain, Options = p, Callback = function(H)
            _G.Settings.selectmain = H
            saveSettings()
        end}
)
y:AddDropdown(
    {Name = "Assist 1", Default = _G.Settings.selectmain1, Options = p, Callback = function(H)
            _G.Settings.selectmain1 = H
            saveSettings()
        end}
)
y:AddDropdown(
    {Name = "Assist 2", Default = _G.Settings.selectmain2, Options = p, Callback = function(H)
            _G.Settings.selectmain2 = H
            saveSettings()
        end}
)
B:AddToggle(
    {
        Name = "Auto Spin Egg",
        Default = _G.Settings.autospingem,
        Callback = function(H)
            _G.Settings.autospingem = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.eggspintime) do
                        if not _G.Settings.autospingem then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "BuyEgg",
                            _G.Settings.selectegg
                        )
                    end
                end
            )
        end
    }
)
z:AddTextbox(
    {Name = "Webhook Url", Default = _G.Settings.webhookurl, TextDisappear = false, Callback = function(H)
            _G.Settings.webhookurl = H
            saveSettings()
        end}
)
z:AddToggle(
    {
        Name = "Clear Notifier",
        Default = _G.Settings.webhook,
        Callback = function(H)
            _G.Settings.webhook = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.webhookspeed) do
                        if not _G.Settings.webhook then
                            break
                        end
                        if
                            game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Visible ==
                                true
                         then
                            _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                            function webhook(_, a0)
                                local request = http_request or request or HttpPost or syn.request
                                request(
                                    {
                                        Url = _G.Settings.webhookurl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = game:GetService("HttpService"):JSONEncode({embeds = {_}, content = a0})
                                    }
                                )
                            end
                            local _ = {
                                ["title"] = "GAME CLEAR",
                                ["type"] = "rich",
                                ["thumbnail"] = {
                                    ["url"] = "https://cdn.discordapp.com/attachments/967570966081323049/967625320771485797/hubicon_4.png"
                                },
                                ["description"] = "Character Info / Session Info:",
                                ["fields"] = {
                                    {
                                        ["name"] = "Current Level",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Level.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Damage Dealt",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Damage.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Cards Owned:",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].CardsOwned.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Enemies Kill",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].EnemiesDefeatedRound.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Exploit Detected",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].ExploitsDetected.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Infinite Record",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].InfiniteRecord.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Boss Rush Clear",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].BossRushClears.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Raid Clear",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].RaidClears.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Dimension Clear",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].StageClear.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Boss Rush Ticket",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].BossRushFreeEntry.Value
                                        )
                                    }
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            }
                            webhook(_, "<@" .. _G.Settings.dsuser .. ">" .. _G.Settings.otherds)
                        end
                    end
                end
            )
        end
    }
)
z:AddToggle(
    {
        Name = "Raid Notifier",
        Default = _G.Settings.raidwebhook,
        Callback = function(H)
            _G.Settings.raidwebhook = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.webhookspeed) do
                        if not _G.Settings.raidwebhook then
                            break
                        end
                        if
                            game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI.Visible ==
                                true
                         then
                            _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                            function webhook(_, a0)
                                local request = http_request or request or HttpPost or syn.request
                                request(
                                    {
                                        Url = _G.Settings.webhookurl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = game:GetService("HttpService"):JSONEncode({embeds = {_}, content = a0})
                                    }
                                )
                            end
                            local _ = {
                                ["title"] = "RAID CLEAR",
                                ["type"] = "rich",
                                ["thumbnail"] = {
                                    ["url"] = "https://cdn.discordapp.com/attachments/967570966081323049/967625320771485797/hubicon_4.png"
                                },
                                ["description"] = "Character Info / Session Info:",
                                ["fields"] = {
                                    {
                                        ["name"] = "Curent Level",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Level.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Damage Dealt",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Damage.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Cards Owned:",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].CardsOwned.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Enemies Kill",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].EnemiesDefeatedRound.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Exploit Detected",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].ExploitsDetected.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Raid Clear",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].RaidClears.Value
                                        )
                                    }
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            }
                            webhook(_, "<@" .. _G.Settings.dsuser .. ">" .. _G.Settings.otherds)
                        end
                    end
                end
            )
        end
    }
)
z:AddToggle(
    {
        Name = "Leveled Notifier",
        Default = _G.Settings.levelwebhook,
        Callback = function(H)
            _G.Settings.levelwebhook = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.levelwebhook then
                            break
                        end
                        if
                            game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.LevelUpImage.Visible ==
                                true
                         then
                            _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                            function webhook(_, a0)
                                local request = http_request or request or HttpPost or syn.request
                                request(
                                    {
                                        Url = _G.Settings.webhookurl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = game:GetService("HttpService"):JSONEncode({embeds = {_}, content = a0})
                                    }
                                )
                            end
                            local _ = {
                                ["title"] = "YOU HAVE LEVELED",
                                ["type"] = "rich",
                                ["thumbnail"] = {
                                    ["url"] = "https://cdn.discordapp.com/attachments/967570966081323049/967625320771485797/hubicon_4.png"
                                },
                                ["description"] = "",
                                ["fields"] = {
                                    {
                                        ["name"] = "Your are now:",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Level.Value
                                        )
                                    }
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            }
                            webhook(_, "<@" .. _G.Settings.dsuser .. ">" .. _G.Settings.otherds)
                        end
                    end
                end
            )
        end
    }
)
y:AddToggle(
    {Name = "Friends Only", Default = _G.Settings.FriendsOnly, Callback = function(H)
            _G.Settings.FriendsOnly = H
            saveSettings()
        end}
)
x:AddToggle(
    {
        Name = "Hide Name",
        Default = _G.Settings.Hidename,
        Callback = function(H)
            _G.Settings.Hidename = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.Hidename then
                            break
                        end
                        spawn(
                            function()
                                game.Players.LocalPlayer.Character.Head.PlayerHealthBarGui:Destroy()
                                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
                            end
                        )
                        spawn(
                            function()
                                local j = game:GetService("Players").LocalPlayer
                                local a1
                                j.CharacterAdded:Connect(
                                    function(a2)
                                        a1 = a2:WaitForChild("Humanoid")
                                    end
                                )
                                a1.Died:Connect(
                                    function()
                                        game.Players.LocalPlayer.Character.Head.PlayerHealthBarGui:Destroy()
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
x:AddToggle(
    {
        Name = "Rejoin If Kick",
        Default = _G.Settings.kickrejoin,
        Callback = function(H)
            _G.Settings.kickrejoin = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.kickrejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(a3)
                                if
                                    a3.Name == "ErrorPrompt" and a3:FindFirstChild("MessageArea") and
                                        a3.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(6938803436, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
C:AddToggle(
    {
        Name = "Daily Quest",
        Default = _G.Settings.Autoclaimquest,
        Callback = function(H)
            _G.Settings.Autoclaimquest = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.Autoclaimquest then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_Login"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_DungeonClear"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_Enemies"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_TimeChallenge"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_Raid"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_BossRush"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_AllQuestClear"
                        )
                    end
                end
            )
        end
    }
)
C:AddToggle(
    {
        Name = "Speed Raid Rewards",
        Default = _G.Settings.autoclaimrewardspeed,
        Callback = function(H)
            _G.Settings.autoclaimrewardspeed = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoclaimrewardspeed then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            1
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            2
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            3
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            4
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            5
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            6
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            7
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            8
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            9
                        )
                    end
                end
            )
        end
    }
)
C:AddToggle(
    {
        Name = "Daily +20 Raid Ticket",
        Default = _G.Settings.autoclaimrewardraid,
        Callback = function(H)
            _G.Settings.autoclaimrewardraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoclaimrewardraid then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "GiveFreeDailyGemFromShop"
                        )
                    end
                end
            )
        end
    }
)
E:AddToggle(
    {
        Name = "1",
        Default = _G.Settings.AutoSkill1,
        Callback = function(H)
            _G.Settings.AutoSkill1 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill1 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill1.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
        end
    }
)
E:AddToggle(
    {
        Name = "2",
        Default = _G.Settings.AutoSkill2,
        Callback = function(H)
            _G.Settings.AutoSkill2 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill2 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill2.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
        end
    }
)
E:AddToggle(
    {
        Name = "3",
        Default = _G.Settings.AutoSkill3,
        Callback = function(H)
            _G.Settings.AutoSkill3 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill3 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill3.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
        end
    }
)
E:AddToggle(
    {
        Name = "4",
        Default = _G.Settings.AutoSkill4,
        Callback = function(H)
            _G.Settings.AutoSkill4 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill4 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill4.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
        end
    }
)
E:AddToggle(
    {
        Name = "Assist 1",
        Default = _G.Settings.AutoSkill5,
        Callback = function(H)
            _G.Settings.AutoSkill5 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill5 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist1.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
        end
    }
)
E:AddToggle(
    {
        Name = "Assist 2",
        Default = _G.Settings.AutoSkill6,
        Callback = function(H)
            _G.Settings.AutoSkill6 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill6 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist2.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
        end
    }
)
E:AddSlider(
    {Name = "Skill Delay", Default = _G.Settings.skilldelay, Min = 0, Max = 5, Callback = function(H)
            _G.Settings.skilldelay = H
            saveSettings()
        end}
)
E:AddLabel("If get exploit detected put more delay")
B:AddSlider(
    {Name = "Spin Delay", Default = _G.Settings.eggspintime, Min = 0, Max = 10, Callback = function(H)
            _G.Settings.eggspintime = H
            saveSettings()
        end}
)
D:AddSlider(
    {Name = "Speed", Default = _G.Settings.Speed, Min = 80, Max = 100, Callback = function(H)
            _G.Settings.Speed = H
            saveSettings()
        end}
)
D:AddSlider(
    {Name = "Over Height", Default = _G.Settings.Height, Min = 5, Max = 10, Callback = function(H)
            _G.Settings.Height = H
            saveSettings()
        end}
)
D:AddSlider(
    {Name = "Under Height", Default = _G.Settings.Height1, Min = -15, Max = -10, Callback = function(H)
            _G.Settings.Height1 = H
            saveSettings()
        end}
)
D:AddSlider(
    {Name = "Behind Distance", Default = _G.Settings.distance, Min = 0, Max = 10, Callback = function(H)
            _G.Settings.distance = H
            saveSettings()
        end}
)
z:AddSlider(
    {Name = "Send Delay", Default = _G.Settings.webhookspeed, Min = 1, Max = 10, Callback = function(H)
            _G.Settings.webhookspeed = H
            saveSettings()
        end}
)
z:AddTextbox(
    {Name = "Put Your ID", Default = _G.Settings.dsuser, TextDisappear = false, Callback = function(H)
            _G.Settings.dsuser = H
            saveSettings()
        end}
)
D:AddLabel("If get kick select behind")
z:AddTextbox(
    {
        Name = "Put @here or @everyone if dont want id",
        Default = _G.Settings.otherds,
        TextDisappear = false,
        Callback = function(H)
            _G.Settings.otherds = H
            saveSettings()
        end
    }
)
w:AddLabel("What you can toggle same time ?")
w:AddLabel("Option 1: Auto Lvl + Raid + Boss Rush + Speed Rush")
w:AddLabel("Option 2: Specific + Raid + Boss Rush + Speed Rush")
w:AddLabel("Option 3: Trial + Raid + Boss Rush + Speed Rush")
y:AddLabel("If you get no reward adjust value")
G:AddButton(
    {Name = "Script by Bird Hub", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
G:AddButton(
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/hnz3gbNpD7")
        end}
)
G:AddTextbox(
    {Name = "Toggle Gui Key", Default = _G.Settings.toggleguikey, TextDisappear = false, Callback = function(H)
            _G.Settings.toggleguikey = H
            saveSettings()
        end}
)
u:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Anime Dimension", Time = 15})
u:Init()

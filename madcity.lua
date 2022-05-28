if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.Settings = {autorob = false, killaura = false, antireport = false, autorejoin = false, toggleguikey = "z"}
local a = "Bird Hub"
local b = "Mad City.lua"
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
local s = q:MakeTab({Name = "Utility", PremiumOnly = false})
local t = q:MakeTab({Name = "Player Setting", PremiumOnly = false})
local u = q:MakeTab({Name = "Teleport", PremiumOnly = false})
local v = q:MakeTab({Name = "Extra", PremiumOnly = false})
local w = q:MakeTab({Name = "Credits", PremiumOnly = false})
r:AddToggle(
    {
        Name = "Auto Rob",
        Default = _G.Settings.autorob,
        Callback = function(x)
            _G.Settings.autorob = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait(5) do
                        if not _G.Settings.autorob then
                            break
                        end
                        wait()
                        game.Players.LocalPlayer.PlayerGui.SpawnGUI.Enabled = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
                        for m, n in pairs(getnilinstances()) do
                            if n.Name == "HumanoidRootPart" then
                                n.Parent = game.Players.LocalPlayer.Character
                            end
                        end
                        wait(0.8)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position =
                            Vector3.new(2039.42, 26.42, 425.82)
                        for m, n in pairs(game:GetService("Workspace").ObjectSelection:GetDescendants()) do
                            if
                                n.Name == "Cash" and n:IsA("MeshPart") or n.Name == "Steal" and n:IsA("Part") or
                                    n.Name == "SmashCash" and n:IsA("Part") or
                                    n.Name == "ATM" and n:IsA("Part")
                             then
                                wait(0.01)
                                n:FindFirstChildOfClass("Script").Event:FireServer()
                            end
                        end
                        wait(1)
                        local y = game.PlaceId
                        local z = {}
                        local A = ""
                        local B = os.date("!*t").hour
                        local C = false
                        local D =
                            pcall(
                            function()
                                z = game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"))
                            end
                        )
                        if not D then
                            table.insert(z, B)
                            writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(z))
                        end
                        function TPReturner()
                            local E
                            if A == "" then
                                E =
                                    game.HttpService:JSONDecode(
                                    game:HttpGet(
                                        "https://games.roblox.com/v1/games/" ..
                                            y .. "/servers/Public?sortOrder=Asc&limit=100"
                                    )
                                )
                            else
                                E =
                                    game.HttpService:JSONDecode(
                                    game:HttpGet(
                                        "https://games.roblox.com/v1/games/" ..
                                            y .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. A
                                    )
                                )
                            end
                            local F = ""
                            if E.nextPageCursor and E.nextPageCursor ~= "null" and E.nextPageCursor ~= nil then
                                A = E.nextPageCursor
                            end
                            local G = 0
                            for m, n in pairs(E.data) do
                                local H = true
                                F = tostring(n.id)
                                if tonumber(n.maxPlayers) > tonumber(n.playing) then
                                    for I, J in pairs(z) do
                                        if G ~= 0 then
                                            if F == tostring(J) then
                                                H = false
                                            end
                                        else
                                            if tonumber(B) ~= tonumber(J) then
                                                local K =
                                                    pcall(
                                                    function()
                                                        delfile("NotSameServers.json")
                                                        z = {}
                                                        table.insert(z, B)
                                                    end
                                                )
                                            end
                                        end
                                        G = G + 1
                                    end
                                    if H == true then
                                        table.insert(z, F)
                                        wait()
                                        pcall(
                                            function()
                                                writefile(
                                                    "NotSameServers.json",
                                                    game:GetService("HttpService"):JSONEncode(z)
                                                )
                                                wait()
                                                game:GetService("TeleportService"):TeleportToPlaceInstance(
                                                    y,
                                                    F,
                                                    game.Players.LocalPlayer
                                                )
                                            end
                                        )
                                        wait(4)
                                    end
                                end
                            end
                        end
                        function Teleport()
                            while wait() do
                                pcall(
                                    function()
                                        TPReturner()
                                        if A ~= "" then
                                            TPReturner()
                                        end
                                    end
                                )
                            end
                        end
                        Teleport()
                    end
                end
            )
        end
    }
)
u:AddButton(
    {
        Name = "Prison Cell",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(-675.7265625, 66.81521606445312, -3061.372314453125)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Prison Soccer",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(-564.3721923828125, 75.96875, -3149.888671875)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Prison Front",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(-890.8153686523438, 53.383243560791016, -2625.90478515625)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Police Prison Station",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(-1045.8134765625, 66.92803955078125, -3024.9130859375)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Plane Station",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(-2379.259033203125, 24.999996185302734, -1339.473388671875)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Gun Dealer",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(-1644.8963623046875, 42.79076385498047, 685.2891845703125)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Mecano",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(1402.4630126953125, 25.250568389892578, 523.9547729492188)}
            ):Play()
        end
    }
)
u:AddButton(
    {
        Name = "Criminal Base",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(3, Enum.EasingStyle.Linear)
            tweenService:Create(
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = CFrame.new(2139.311279296875, 26.505287170410156, 434.8152770996094)}
            ):Play()
        end
    }
)
s:AddButton(
    {
        Name = "Esp",
        Callback = function()
            local L = tick()
            _G.TeamLine = true
            local g = game:GetService("Players")
            local M = game:GetService("RunService")
            local N = g.LocalPlayer
            local O = workspace.CurrentCamera
            function esp(P)
                local Q = Drawing.new("Line")
                Q.Color = Color3.new(1, 1, 1)
                Q.Visible = false
                Q.Thickness = 1
                Q.Transparency = 1
                local R = Drawing.new("Text")
                R.Text = P.Name
                R.Color = Color3.new(1, 1, 1)
                R.Outline = true
                R.OutlineColor = Color3.new(0, 0, 0)
                R.Size = 20
                R.Visible = false
                M.RenderStepped:Connect(
                    function()
                        if P ~= N and P.Character ~= nil and P.Character:FindFirstChild("HumanoidRootPart") then
                            local S = P.Character:FindFirstChild("Head").Position
                            local T = P.Character.PrimaryPart.Position
                            local U, V = O:WorldToViewportPoint(S)
                            local W, X = O:WorldToViewportPoint(T)
                            if X then
                                Q.From = Vector2.new(O.ViewportSize.X / 2, O.ViewportSize.Y)
                                Q.To = Vector2.new(W.X, W.Y)
                                R.Position = Vector2.new(U.X - 2, U.Y)
                                Q.Visible = true
                                R.Visible = true
                                if P.TeamColor then
                                    Q.Color = P.TeamColor.Color
                                    R.Color = P.TeamColor.Color
                                else
                                    Q.Color = Color3.new(1, 1, 1)
                                    R.Color = Color3.new(1, 1, 1)
                                end
                                if not _G.TeamLine then
                                    if P.TeamColor == N.TeamColor then
                                        Q.Visible = false
                                        R.Visible = false
                                    else
                                        Q.Visible = true
                                        R.Visible = true
                                    end
                                end
                            else
                                Q.Visible = false
                                R.Visible = false
                            end
                        end
                    end
                )
            end
            for m, n in pairs(g:GetChildren()) do
                esp(n)
            end
            g.PlayerAdded:Connect(
                function(n)
                    n.CharacterAdded:Connect(
                        function()
                            esp(n)
                        end
                    )
                end
            )
        end
    }
)
s:AddButton(
    {
        Name = "Invisible",
        Callback = function()
            local x = string.byte
            local Y = string.char
            local Z = string.sub
            local _ = table.concat
            local a0 = table.insert
            local a1 = math.ldexp
            local a2 = getfenv or function()
                    return _ENV
                end
            local a0 = setmetatable
            local a3 = select
            local m = unpack or table.unpack
            local a4 = tonumber
            local function a5(x)
                local a6, a7, a8 = "", "", {}
                local a9 = 256
                local aa = {}
                for a0 = 0, a9 - 1 do
                    aa[a0] = Y(a0)
                end
                local a0 = 1
                local function m()
                    local a6 = a4(Z(x, a0, a0), 36)
                    a0 = a0 + 1
                    local a7 = a4(Z(x, a0, a0 + a6 - 1), 36)
                    a0 = a0 + a6
                    return a7
                end
                a6 = Y(m())
                a8[1] = a6
                while a0 < #x do
                    local a0 = m()
                    if aa[a0] then
                        a7 = aa[a0]
                    else
                        a7 = a6 .. Z(a6, 1, 1)
                    end
                    aa[a9] = a6 .. Z(a7, 1, 1)
                    a8[#a8 + 1], a6, a9 = a7, a7, a9 + 1
                end
                return table.concat(a8)
            end
            local a4 =
                a5(
                "24B23M27523K23Q27523M26D26B26N26F23K23S27925H26F26U25T26F26O26S26J26927E24327925S26F26Q26M27P26B26U26F26E25T26U26L26O26B26D27E23W27T26F26N26L28025G26V26K26926U26J26L26K23K23Y27925N26K26S26L26H26F27L27N27M23K23P27925C26V26Z25N28026N27F29226B26P27P24I25M26L27D23K23R27925J26S26F26K26U29927525G26J26O28W27M29M26O23K23V27925T26Q26B26T26K29F29H23L27925P25G25G27727926T26B26J26U2792AK23E25929027925U26M26B26Z27M26P23K23T27925Q26L26926B26M2AQ2AS28Z2A027525D26I26B28628J28Z27G2752AZ26T27M25Y28526P26L2AO27525O27C26F25Y28729I27925Y2AI26M27E29127525I26F26P26U26O26L26Z23K23O2A126926O26J26Q29P27827525N26928M2AE27525S26B26K26H2BV2B826M28M27E2CB27525U2BB29N2AJ25I2792402AK23N27924I2AK27623M2D623M23K23M2A92DB2DC2DG2DA2DB2782DM2AK29J2DE2DG2CY2DD2752A92C12DJ2A92D82DE2752D82752DP2792DG2DS2DH2DJ2DK23M2E627523U2ED2DJ2A02E92BF2DV2EA2DY2DE2782AX2EB2782E12AK28P2752DE2D823Z2EB2DF23M2EU2792E42EH2DB2E82DC28A2EB2DG2DL2DJ23X2F72AK2422FH27927S2EY2F32D92E32FO28A2DM2D82D82FG2FT2FO2FJ2FX2EU2G023M2412F72FU23M2462D72F22F42G62E52FQ2D82FS2GE23M2FW2GH2FZ2GH2D62G22472G52FO2G82F52GA2EM2GC2GQ2GF2GX2GI2GZ2GL2FO2G12GH2442GZ2452GZ2GS2FQ2DG2GB2FO2GD2H323M2GG2HG2GJ2HG2H22G62GN2GH2HA2FO2HC2GQ27524A2G92FD2F72DG2752742FJ2FO2742FE2HE2G72HW2I62GT2DJ"
            )
            local a9 = bit and bit.bxor or function(a0, a7)
                    local a6, a9 = 1, 0
                    while a0 > 0 and a7 > 0 do
                        local a8, Z = a0 % 2, a7 % 2
                        if a8 ~= Z then
                            a9 = a9 + a6
                        end
                        a0, a7, a6 = (a0 - a8) / 2, (a7 - Z) / 2, a6 * 2
                    end
                    if a0 < a7 then
                        a0 = a7
                    end
                    while a0 > 0 do
                        local a7 = a0 % 2
                        if a7 > 0 then
                            a9 = a9 + a6
                        end
                        a0, a6 = (a0 - a7) / 2, a6 * 2
                    end
                    return a9
                end
            local function a7(a6, a0, a7)
                if a7 then
                    local a0 = a6 / 2 ^ (a0 - 1) % 2 ^ (a7 - 1 - (a0 - 1) + 1)
                    return a0 - a0 % 1
                else
                    local a0 = 2 ^ (a0 - 1)
                    return a6 % (a0 + a0) >= a0 and 1 or 0
                end
            end
            local a0 = 1
            local function a6()
                local a7, a8, Z, a6 = x(a4, a0, a0 + 3)
                a7 = a9(a7, 130)
                a8 = a9(a8, 130)
                Z = a9(Z, 130)
                a6 = a9(a6, 130)
                a0 = a0 + 4
                return a6 * 16777216 + Z * 65536 + a8 * 256 + a7
            end
            local function aa()
                local a6 = a9(x(a4, a0, a0), 130)
                a0 = a0 + 1
                return a6
            end
            local function a8()
                local a6, a7 = x(a4, a0, a0 + 2)
                a6 = a9(a6, 130)
                a7 = a9(a7, 130)
                a0 = a0 + 2
                return a7 * 256 + a6
            end
            local function ab()
                local a0 = a6()
                local a6 = a6()
                local Z = 1
                local a9 = a7(a6, 1, 20) * 2 ^ 32 + a0
                local a0 = a7(a6, 21, 31)
                local a6 = (-1) ^ a7(a6, 32)
                if a0 == 0 then
                    if a9 == 0 then
                        return a6 * 0
                    else
                        a0 = 1
                        Z = 0
                    end
                elseif a0 == 2047 then
                    return a9 == 0 and a6 * 1 / 0 or a6 * 0 / 0
                end
                return a1(a6, a0 - 1023) * (Z + a9 / 2 ^ 52)
            end
            local a5 = a6
            local function a1(a6)
                local a7
                if not a6 then
                    a6 = a5()
                    if a6 == 0 then
                        return ""
                    end
                end
                a7 = Z(a4, a0, a0 + a6 - 1)
                a0 = a0 + a6
                local a6 = {}
                for a0 = 1, #a7 do
                    a6[a0] = Y(a9(x(Z(a7, a0, a0)), 130))
                end
                return _(a6)
            end
            local a0 = a6
            local function _(...)
                return {...}, a3("#", ...)
            end
            local function a4()
                local Y = {}
                local m = {}
                local a0 = {}
                local x = {Y, m, nil, a0}
                local a0 = a6()
                local a9 = {}
                for a7 = 1, a0 do
                    local a6 = aa()
                    local a0
                    if a6 == 3 then
                        a0 = aa() ~= 0
                    elseif a6 == 0 then
                        a0 = ab()
                    elseif a6 == 2 then
                        a0 = a1()
                    end
                    a9[a7] = a0
                end
                x[3] = aa()
                for x = 1, a6() do
                    local a0 = aa()
                    if a7(a0, 1, 1) == 0 then
                        local Z = a7(a0, 2, 3)
                        local aa = a7(a0, 4, 6)
                        local a0 = {a8(), a8(), nil, nil}
                        if Z == 0 then
                            a0[3] = a8()
                            a0[4] = a8()
                        elseif Z == 1 then
                            a0[3] = a6()
                        elseif Z == 2 then
                            a0[3] = a6() - 2 ^ 16
                        elseif Z == 3 then
                            a0[3] = a6() - 2 ^ 16
                            a0[4] = a8()
                        end
                        if a7(aa, 1, 1) == 1 then
                            a0[2] = a9[a0[2]]
                        end
                        if a7(aa, 2, 2) == 1 then
                            a0[3] = a9[a0[3]]
                        end
                        if a7(aa, 3, 3) == 1 then
                            a0[4] = a9[a0[4]]
                        end
                        Y[x] = a0
                    end
                end
                for a0 = 1, a6() do
                    m[a0 - 1] = a4()
                end
                return x
            end
            local function Y(a0, a6, x)
                local a7 = a0[1]
                local a6 = a0[2]
                local a0 = a0[3]
                return function(...)
                    local Z = a7
                    local a6 = a6
                    local a9 = a0
                    local a0 = _
                    local a6 = 1
                    local a0 = -1
                    local a4 = {}
                    local aa = {...}
                    local a8 = a3("#", ...) - 1
                    local a0 = {}
                    local a7 = {}
                    for a0 = 0, a8 do
                        if a0 >= a9 then
                            a4[a0 - a9] = aa[a0 + 1]
                        else
                            a7[a0] = aa[a0 + 1]
                        end
                    end
                    local a0 = a8 - a9 + 1
                    local a0
                    local aa
                    while true do
                        a0 = Z[a6]
                        aa = a0[1]
                        if aa <= 9 then
                            if aa <= 4 then
                                if aa <= 1 then
                                    if aa == 0 then
                                        local a8
                                        local a9
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9] = a7[a9](m(a7, a9 + 1, a0[3]))
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](m(a7, a9 + 1, a0[3]))
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9] = a7[a9](m(a7, a9 + 1, a0[3]))
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](m(a7, a9 + 1, a0[3]))
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a0[3]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9] = a7[a9](m(a7, a9 + 1, a0[3]))
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = x[a0[3]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9] = a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a7[a0[2]][a0[3]] = a7[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a8 = a7[a0[3]]
                                        a7[a9 + 1] = a8
                                        a7[a9] = a8[a0[4]]
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        a9 = a0[2]
                                        a7[a9](a7[a9 + 1])
                                        a6 = a6 + 1
                                        a0 = Z[a6]
                                        do
                                            return
                                        end
                                    else
                                        local a6 = a0[2]
                                        a7[a6](m(a7, a6 + 1, a0[3]))
                                    end
                                elseif aa <= 2 then
                                    do
                                        return
                                    end
                                elseif aa > 3 then
                                    local a6 = a0[2]
                                    a7[a6] = a7[a6](m(a7, a6 + 1, a0[3]))
                                else
                                    a7[a0[2]][a0[3]] = a7[a0[4]]
                                end
                            elseif aa <= 6 then
                                if aa == 5 then
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                else
                                    local a0 = a0[2]
                                    a7[a0](a7[a0 + 1])
                                end
                            elseif aa <= 7 then
                                local a9 = a0[2]
                                local a6 = a7[a0[3]]
                                a7[a9 + 1] = a6
                                a7[a9] = a6[a0[4]]
                            elseif aa > 8 then
                                local a0 = a0[2]
                                a7[a0] = a7[a0](a7[a0 + 1])
                            else
                                local a6 = a0[2]
                                a7[a6] = a7[a6](m(a7, a6 + 1, a0[3]))
                            end
                        elseif aa <= 14 then
                            if aa <= 11 then
                                if aa > 10 then
                                    a7[a0[2]][a0[3]] = a7[a0[4]]
                                else
                                    local a0 = a0[2]
                                    a7[a0] = a7[a0](a7[a0 + 1])
                                end
                            elseif aa <= 12 then
                                a7[a0[2]] = x[a0[3]]
                            elseif aa == 13 then
                                a7[a0[2]] = x[a0[3]]
                            else
                                local a0 = a0[2]
                                a7[a0](a7[a0 + 1])
                            end
                        elseif aa <= 17 then
                            if aa <= 15 then
                                a7[a0[2]] = a0[3]
                            elseif aa == 16 then
                                a7[a0[2]] = a0[3]
                            else
                                local a6 = a0[2]
                                local a9 = a7[a0[3]]
                                a7[a6 + 1] = a9
                                a7[a6] = a9[a0[4]]
                            end
                        elseif aa <= 18 then
                            local a6 = a0[2]
                            a7[a6](m(a7, a6 + 1, a0[3]))
                        elseif aa == 19 then
                            a7[a0[2]] = a7[a0[3]][a0[4]]
                        else
                            do
                                return
                            end
                        end
                        a6 = a6 + 1
                    end
                end
            end
            return Y(a4(), {}, a2())()
        end
    }
)
s:AddButton(
    {
        Name = "Max Exp",
        Callback = function()
            local x = string.byte
            local Y = string.char
            local Z = string.sub
            local _ = table.concat
            local a0 = table.insert
            local a1 = math.ldexp
            local a2 = getfenv or function()
                    return _ENV
                end
            local a0 = setmetatable
            local a3 = select
            local m = unpack or table.unpack
            local a4 = tonumber
            local function a5(m)
                local a6, a7, a8 = "", "", {}
                local a9 = 256
                local x = {}
                for a0 = 0, a9 - 1 do
                    x[a0] = Y(a0)
                end
                local a0 = 1
                local function aa()
                    local a6 = a4(Z(m, a0, a0), 36)
                    a0 = a0 + 1
                    local a7 = a4(Z(m, a0, a0 + a6 - 1), 36)
                    a0 = a0 + a6
                    return a7
                end
                a6 = Y(aa())
                a8[1] = a6
                while a0 < #m do
                    local a0 = aa()
                    if x[a0] then
                        a7 = x[a0]
                    else
                        a7 = a6 .. Z(a6, 1, 1)
                    end
                    x[a9] = a6 .. Z(a7, 1, 1)
                    a8[#a8 + 1], a6, a9 = a7, a7, a9 + 1
                end
                return table.concat(a8)
            end
            local aa =
                a5(
                "171R2751R1V27623G23E23A23I1R1H27622K23I23322023I22X23123623C27D1A27622123I22Z23B27O23E23323I23J22023323822X23E23G27D1L27S23I23A23827Z22L23223923C2332362382391R1N27622A23923123823423I27K27M27L1R1S27627K23322723I27B1R1T27622323827W27P27727623023E2362331P27629L22J28Z27622H23222Q22A27Z23A27E29P23E22W27O21N22B23827C1R1U27622M23123I23923329W27522L23622X28V27L2A922X1R1I29122Z23E2302392A22A41O27622C22L22L29O27522323B23E22Q27L22W1R1G27622F23823C23E23B2B22B428Y2AN2B12B32B522X22K2322362B01R22E29H23922K22622A1R1J29123327Y22W22B22622N2BZ2BA23I2A923B2C52C72AV27522H23E2AL29027522N23I22W23322X23822Q29729123828G23J22W29K29L1R26R2102AD1R22128G28W27N29D1M28A23923J27L28227U22Z2802BR22G28L23923I28I2282761928O2751Q27621N2D01R29K1927529K2CF2DY29K29K2DX2D02782E829L2A62E12DZ2CT2752EE2AV2CK2DY2AV2DV2EE2752C02EH2DU2AM2DY2E21R2EN29L2DV2752EB2762E02EV2E42D02E61R2F12752EA2DY2ED2EV27F2ER1R2AV2B92EU2EM1R2EO2EW2DW2E52FM2F42EU2EF2E72DY28O2F91R2DB2EE29K2892FG2FI2DR2FA1R1K2FT2782EX2762EZ2F82FQ2G11R1B2FT2F72FY27R2FY2E12FY182GF2D01F2GS29L1E2GV2761D2GY2751C2FQ2GC2ES2F02GG2EV2GJ2EU2GL2DY2GN2DY2GP2DY132H11R2H32F62FO2FN2GE2FY2F32EF2HA2FQ2FV2D02HE2D02HG2D02GR2FY2GU2FY2GX2FY2HL29L29K2H52C82FG2DV122GK2HN2EY2FP2HM2GH112IF2HV29L102HJ2741P2902CZ2IF2EZ152GD2IY27527R2762A62752AP2AG2B727827527A2A42FF1R27H27J2AJ27O27D2EK2BG2BM2B72FJ1R2BB2BD2BF2BL28Y2EQ1R2CH23C2342AP2JX2B827G27I22G23723623B23J2AH28M2J81R22D27B27D2BJ1R22B23E2DD23C23223H23H2B72982B12CI2AA2AC2KG2K42CI23E28I27L2IU27626J2102L11R22Z23W29N2J12D527U29C27Y28028228428627D2J31R2A82KT2D42AF2AH2D828Y2LK22M2352DO23321C2DR21Q2IZ2FR2FO2IU2E82DV2DV2AV2EI29E2D02M72EF2M52FO2A62ME2DV2982MH2BR2M32FT2EV2KB1R2H02DV21N29K2A62782C021P2IP2A62G92DV2AN1V2JU2N12772JU2MR2FM2A62A62M4162A52NF2M82752902MP2752A62IT2GS2NB2NF2E82NP2B92HA27827F2A61T2KB2B92DV29K2N42762O02FM2EB2DT2O62FO2DB2EH2DX29K2O81V2HT21D2HN2MV2EF2F02982782782NH2CT2G329L2782982HV2OO2G82GS2OX2GJ2EE2982LA2EE2NN2H729O2902OQ2N32DY2902AN2HV2902902LK29E2902DV1V2HI2752742IW2M12DY"
            )
            local a9 = bit and bit.bxor or function(a0, a6)
                    local a7, a9 = 1, 0
                    while a0 > 0 and a6 > 0 do
                        local Z, a8 = a0 % 2, a6 % 2
                        if Z ~= a8 then
                            a9 = a9 + a7
                        end
                        a0, a6, a7 = (a0 - Z) / 2, (a6 - a8) / 2, a7 * 2
                    end
                    if a0 < a6 then
                        a0 = a6
                    end
                    while a0 > 0 do
                        local a6 = a0 % 2
                        if a6 > 0 then
                            a9 = a9 + a7
                        end
                        a0, a7 = (a0 - a6) / 2, a7 * 2
                    end
                    return a9
                end
            local function a7(a7, a0, a6)
                if a6 then
                    local a0 = a7 / 2 ^ (a0 - 1) % 2 ^ (a6 - 1 - (a0 - 1) + 1)
                    return a0 - a0 % 1
                else
                    local a0 = 2 ^ (a0 - 1)
                    return a7 % (a0 + a0) >= a0 and 1 or 0
                end
            end
            local a0 = 1
            local function a6()
                local a6, a8, Z, a7 = x(aa, a0, a0 + 3)
                a6 = a9(a6, 27)
                a8 = a9(a8, 27)
                Z = a9(Z, 27)
                a7 = a9(a7, 27)
                a0 = a0 + 4
                return a7 * 16777216 + Z * 65536 + a8 * 256 + a6
            end
            local function a4()
                local a6 = a9(x(aa, a0, a0), 27)
                a0 = a0 + 1
                return a6
            end
            local function a8()
                local a6, a7 = x(aa, a0, a0 + 2)
                a6 = a9(a6, 27)
                a7 = a9(a7, 27)
                a0 = a0 + 2
                return a7 * 256 + a6
            end
            local function ab()
                local a0 = a6()
                local a6 = a6()
                local Z = 1
                local a9 = a7(a6, 1, 20) * 2 ^ 32 + a0
                local a0 = a7(a6, 21, 31)
                local a6 = (-1) ^ a7(a6, 32)
                if a0 == 0 then
                    if a9 == 0 then
                        return a6 * 0
                    else
                        a0 = 1
                        Z = 0
                    end
                elseif a0 == 2047 then
                    return a9 == 0 and a6 * 1 / 0 or a6 * 0 / 0
                end
                return a1(a6, a0 - 1023) * (Z + a9 / 2 ^ 52)
            end
            local a5 = a6
            local function ac(a6)
                local a7
                if not a6 then
                    a6 = a5()
                    if a6 == 0 then
                        return ""
                    end
                end
                a7 = Z(aa, a0, a0 + a6 - 1)
                a0 = a0 + a6
                local a6 = {}
                for a0 = 1, #a7 do
                    a6[a0] = Y(a9(x(Z(a7, a0, a0)), 27))
                end
                return _(a6)
            end
            local a0 = a6
            local function a5(...)
                return {...}, a3("#", ...)
            end
            local function a1()
                local m = {}
                local aa = {}
                local a0 = {}
                local Y = {m, aa, nil, a0}
                local a0 = a6()
                local a9 = {}
                for a7 = 1, a0 do
                    local a6 = a4()
                    local a0
                    if a6 == 3 then
                        a0 = a4() ~= 0
                    elseif a6 == 2 then
                        a0 = ab()
                    elseif a6 == 0 then
                        a0 = ac()
                    end
                    a9[a7] = a0
                end
                for aa = 1, a6() do
                    local a0 = a4()
                    if a7(a0, 1, 1) == 0 then
                        local Z = a7(a0, 2, 3)
                        local x = a7(a0, 4, 6)
                        local a0 = {a8(), a8(), nil, nil}
                        if Z == 0 then
                            a0[3] = a8()
                            a0[4] = a8()
                        elseif Z == 1 then
                            a0[3] = a6()
                        elseif Z == 2 then
                            a0[3] = a6() - 2 ^ 16
                        elseif Z == 3 then
                            a0[3] = a6() - 2 ^ 16
                            a0[4] = a8()
                        end
                        if a7(x, 1, 1) == 1 then
                            a0[2] = a9[a0[2]]
                        end
                        if a7(x, 2, 2) == 1 then
                            a0[3] = a9[a0[3]]
                        end
                        if a7(x, 3, 3) == 1 then
                            a0[4] = a9[a0[4]]
                        end
                        m[aa] = a0
                    end
                end
                for a0 = 1, a6() do
                    aa[a0 - 1] = a1()
                end
                Y[3] = a4()
                return Y
            end
            local function _(a0, a6, a4)
                local a6 = a0[1]
                local a7 = a0[2]
                local a0 = a0[3]
                return function(...)
                    local a9 = a6
                    local Y = a7
                    local Z = a0
                    local a5 = a5
                    local a6 = 1
                    local aa = -1
                    local a1 = {}
                    local a8 = {...}
                    local x = a3("#", ...) - 1
                    local a0 = {}
                    local a7 = {}
                    for a0 = 0, x do
                        if a0 >= Z then
                            a1[a0 - Z] = a8[a0 + 1]
                        else
                            a7[a0] = a8[a0 + 1]
                        end
                    end
                    local a0 = x - Z + 1
                    local a0
                    local x
                    while true do
                        a0 = a9[a6]
                        x = a0[1]
                        if x <= 18 then
                            if x <= 8 then
                                if x <= 3 then
                                    if x <= 1 then
                                        if x == 0 then
                                            local a6 = a0[2]
                                            a7[a6](m(a7, a6 + 1, a0[3]))
                                        else
                                            local a6 = a0[2]
                                            a7[a6](m(a7, a6 + 1, a0[3]))
                                        end
                                    elseif x > 2 then
                                        local a6 = a0[2]
                                        a7[a6] = a7[a6](m(a7, a6 + 1, a0[3]))
                                    else
                                        a7[a0[2]] = a7[a0[3]][a0[4]]
                                    end
                                elseif x <= 5 then
                                    if x == 4 then
                                        local a9 = a0[2]
                                        local a8 = a0[4]
                                        local Z = a9 + 2
                                        local a9 = {a7[a9](a7[a9 + 1], a7[Z])}
                                        for a0 = 1, a8 do
                                            a7[Z + a0] = a9[a0]
                                        end
                                        local a9 = a9[1]
                                        if a9 then
                                            a7[Z] = a9
                                            a6 = a0[3]
                                        else
                                            a6 = a6 + 1
                                        end
                                    else
                                        a7[a0[2]] = a4[a0[3]]
                                    end
                                elseif x <= 6 then
                                    local a8
                                    local Z
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](m(a7, Z + 1, a0[3]))
                                elseif x > 7 then
                                    a6 = a0[3]
                                else
                                    a7[a0[2]] = _(Y[a0[3]], nil, a4)
                                end
                            elseif x <= 13 then
                                if x <= 10 then
                                    if x == 9 then
                                        local a0 = a0[2]
                                        a7[a0](a7[a0 + 1])
                                    else
                                        a7[a0[2]][a0[3]] = a7[a0[4]]
                                    end
                                elseif x <= 11 then
                                    local a0 = a0[2]
                                    local a9, a6 = a5(a7[a0](a7[a0 + 1]))
                                    aa = a6 + a0 - 1
                                    local a6 = 0
                                    for a0 = a0, aa do
                                        a6 = a6 + 1
                                        a7[a0] = a9[a6]
                                    end
                                elseif x == 12 then
                                    local a8
                                    local Z
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](a7[Z + 1])
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](a7[Z + 1])
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](a7[Z + 1])
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](a7[Z + 1])
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z](a7[Z + 1])
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a4[a0[3]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                else
                                    a7[a0[2]] = _(Y[a0[3]], nil, a4)
                                end
                            elseif x <= 15 then
                                if x == 14 then
                                    a6 = a0[3]
                                else
                                    local a9 = a0[2]
                                    local Z = {a7[a9](m(a7, a9 + 1, aa))}
                                    local a6 = 0
                                    for a0 = a9, a0[4] do
                                        a6 = a6 + 1
                                        a7[a0] = Z[a6]
                                    end
                                end
                            elseif x <= 16 then
                                local a9 = a0[2]
                                local Z = a7[a9]
                                local a8 = a7[a9 + 2]
                                if a8 > 0 then
                                    if Z > a7[a9 + 1] then
                                        a6 = a0[3]
                                    else
                                        a7[a9 + 3] = Z
                                    end
                                elseif Z < a7[a9 + 1] then
                                    a6 = a0[3]
                                else
                                    a7[a9 + 3] = Z
                                end
                            elseif x == 17 then
                                local a9 = a0[2]
                                local Z = a7[a9]
                                local a8 = a7[a9 + 2]
                                if a8 > 0 then
                                    if Z > a7[a9 + 1] then
                                        a6 = a0[3]
                                    else
                                        a7[a9 + 3] = Z
                                    end
                                elseif Z < a7[a9 + 1] then
                                    a6 = a0[3]
                                else
                                    a7[a9 + 3] = Z
                                end
                            else
                                local a6 = a0[2]
                                local a9 = a7[a0[3]]
                                a7[a6 + 1] = a9
                                a7[a6] = a9[a0[4]]
                            end
                        elseif x <= 27 then
                            if x <= 22 then
                                if x <= 20 then
                                    if x > 19 then
                                        local a9 = a0[2]
                                        local a8 = a0[4]
                                        local Z = a9 + 2
                                        local a9 = {a7[a9](a7[a9 + 1], a7[Z])}
                                        for a0 = 1, a8 do
                                            a7[Z + a0] = a9[a0]
                                        end
                                        local a9 = a9[1]
                                        if a9 then
                                            a7[Z] = a9
                                            a6 = a0[3]
                                        else
                                            a6 = a6 + 1
                                        end
                                    else
                                        local a6 = a0[2]
                                        a7[a6] = a7[a6](m(a7, a6 + 1, a0[3]))
                                    end
                                elseif x == 21 then
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                else
                                    local a9 = a0[2]
                                    local Z = {a7[a9](m(a7, a9 + 1, aa))}
                                    local a6 = 0
                                    for a0 = a9, a0[4] do
                                        a6 = a6 + 1
                                        a7[a0] = Z[a6]
                                    end
                                end
                            elseif x <= 24 then
                                if x > 23 then
                                    local a9 = a0[2]
                                    local a8 = a7[a9 + 2]
                                    local Z = a7[a9] + a8
                                    a7[a9] = Z
                                    if a8 > 0 then
                                        if Z <= a7[a9 + 1] then
                                            a6 = a0[3]
                                            a7[a9 + 3] = Z
                                        end
                                    elseif Z >= a7[a9 + 1] then
                                        a6 = a0[3]
                                        a7[a9 + 3] = Z
                                    end
                                else
                                    do
                                        return
                                    end
                                end
                            elseif x <= 25 then
                                if a7[a0[2]] ~= a0[4] then
                                    a6 = a6 + 1
                                else
                                    a6 = a0[3]
                                end
                            elseif x == 26 then
                                local a9 = a0[2]
                                local a8 = a7[a9 + 2]
                                local Z = a7[a9] + a8
                                a7[a9] = Z
                                if a8 > 0 then
                                    if Z <= a7[a9 + 1] then
                                        a6 = a0[3]
                                        a7[a9 + 3] = Z
                                    end
                                elseif Z >= a7[a9 + 1] then
                                    a6 = a0[3]
                                    a7[a9 + 3] = Z
                                end
                            else
                                if a7[a0[2]] ~= a0[4] then
                                    a6 = a6 + 1
                                else
                                    a6 = a0[3]
                                end
                            end
                        elseif x <= 32 then
                            if x <= 29 then
                                if x == 28 then
                                    local a0 = a0[2]
                                    a7[a0](a7[a0 + 1])
                                else
                                    local a8
                                    local Z
                                    Z = a0[2]
                                    a8 = a7[a0[3]]
                                    a7[Z + 1] = a8
                                    a7[Z] = a8[a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a0[3]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    Z = a0[2]
                                    a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]] = a7[a0[3]][a0[4]]
                                    a6 = a6 + 1
                                    a0 = a9[a6]
                                    a7[a0[2]][a0[3]] = a7[a0[4]]
                                end
                            elseif x <= 30 then
                                do
                                    return
                                end
                            elseif x > 31 then
                                a7[a0[2]] = a0[3]
                            else
                                a7[a0[2]] = a0[3]
                            end
                        elseif x <= 34 then
                            if x > 33 then
                                a7[a0[2]] = a4[a0[3]]
                            else
                                local a9 = a0[2]
                                local a6 = a7[a0[3]]
                                a7[a9 + 1] = a6
                                a7[a9] = a6[a0[4]]
                            end
                        elseif x <= 35 then
                            local a0 = a0[2]
                            local a9, a6 = a5(a7[a0](a7[a0 + 1]))
                            aa = a6 + a0 - 1
                            local a6 = 0
                            for a0 = a0, aa do
                                a6 = a6 + 1
                                a7[a0] = a9[a6]
                            end
                        elseif x == 36 then
                            a7[a0[2]][a0[3]] = a7[a0[4]]
                        else
                            local Z
                            local a8
                            local Y, _
                            local x
                            local Z
                            a7[a0[2]] = a4[a0[3]]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            a7[a0[2]] = a4[a0[3]]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            Z = a0[2]
                            x = a7[a0[3]]
                            a7[Z + 1] = x
                            a7[Z] = x[a0[4]]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            a7[a0[2]] = a0[3]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            Z = a0[2]
                            a7[Z] = a7[Z](m(a7, Z + 1, a0[3]))
                            a6 = a6 + 1
                            a0 = a9[a6]
                            a7[a0[2]] = a7[a0[3]][a0[4]]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            a7[a0[2]] = a7[a0[3]][a0[4]]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            Z = a0[2]
                            x = a7[a0[3]]
                            a7[Z + 1] = x
                            a7[Z] = x[a0[4]]
                            a6 = a6 + 1
                            a0 = a9[a6]
                            Z = a0[2]
                            Y, _ = a5(a7[Z](a7[Z + 1]))
                            aa = _ + Z - 1
                            a8 = 0
                            for a0 = Z, aa do
                                a8 = a8 + 1
                                a7[a0] = Y[a8]
                            end
                            a6 = a6 + 1
                            a0 = a9[a6]
                            Z = a0[2]
                            Y = {a7[Z](m(a7, Z + 1, aa))}
                            a8 = 0
                            for a0 = Z, a0[4] do
                                a8 = a8 + 1
                                a7[a0] = Y[a8]
                            end
                            a6 = a6 + 1
                            a0 = a9[a6]
                            a6 = a0[3]
                        end
                        a6 = a6 + 1
                    end
                end
            end
            return _(a1(), {}, a2())()
        end
    }
)
t:AddButton(
    {
        Name = "Silent Aim",
        Callback = function()
            local ad = game:GetService("UserInputService")
            ad.InputBegan:Connect(
                function(ae)
                    if ae.UserInputType == Enum.UserInputType.MouseButton1 then
                        for m, n in pairs(game.Workspace:GetChildren()) do
                            if n:FindFirstChild("Head") then
                                for m = 1, 5 do
                                    local af = {[1] = "VR", [2] = n.Head}
                                    game:GetService("ReplicatedStorage").Event:FireServer(unpack(af))
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
t:AddToggle(
    {
        Name = "Kill Aura",
        Default = _G.Settings.killaura,
        Callback = function(x)
            _G.Settings.killaura = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.killaura then
                            break
                        end
                        for m, n in pairs(game.Workspace:GetChildren()) do
                            if n:FindFirstChild("Head") then
                                for m = 1, 5 do
                                    local af = {[1] = "VR", [2] = n.Head}
                                    game:GetService("ReplicatedStorage").Event:FireServer(unpack(af))
                                    wait()
                                end
                            end
                        end
                    end
                end
            )
        end
    }
)
v:AddToggle(
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
                            function(ag)
                                if
                                    ag.Name == "ErrorPrompt" and ag:FindFirstChild("MessageArea") and
                                        ag.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(1224212277, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
        end
    }
)
t:AddToggle(
    {
        Name = "Anti Report (Only For Farm)",
        Default = _G.Settings.antireport,
        Callback = function(x)
            _G.Settings.antireport = x
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.antireport then
                            break
                        end
                        for m, n in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if
                                n:IsA("Accessory") or n:IsA("BillboardGui") or n:IsA("Decal") or n:IsA("Shirt") or
                                    n:IsA("Pants")
                             then
                                n:Destroy()
                            end
                        end
                    end
                end
            )
        end
    }
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
p:MakeNotification({Name = "🐦 Bird Hub 🐦", Content = "Game: Mad City", Time = 15})
p:Init()

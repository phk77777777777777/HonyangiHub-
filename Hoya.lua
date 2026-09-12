local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "LuminousPureHub" or v.Name == "HoNyang💩FOV" or v.Name == "VoidSpamGui" or v.Name == "HoNyangMeleeHub" or v.Name == "HoNyangRageUI" then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LuminousPureHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        player:SetAttribute("SpawnTime", tick())
    end)
end)

for _, player in ipairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function(char)
        player:SetAttribute("SpawnTime", tick())
    end)
    if player.Character then
        player:SetAttribute("SpawnTime", tick())
    end
end

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 340)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.Visible = true
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 8)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner", TopBar)
TopBarCorner.CornerRadius = UDim.new(0, 8)

local TopBarCover = Instance.new("Frame", TopBar)
TopBarCover.Size = UDim2.new(1, 0, 0, 8)
TopBarCover.Position = UDim2.new(0, 0, 1, -8)
TopBarCover.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
TopBarCover.BorderSizePixel = 0

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.Size = UDim2.new(1, -110, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.Text = "호냥이 허브 | 사일런트+레이지 에디션"
TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local LockBtn = Instance.new("TextButton", TopBar)
LockBtn.Size = UDim2.new(0, 45, 0, 20)
LockBtn.Position = UDim2.new(1, -100, 0.5, -10)
LockBtn.Text = "Lock"
LockBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
LockBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
LockBtn.Font = Enum.Font.GothamBold
LockBtn.TextSize = 10
LockBtn.BorderSizePixel = 0
Instance.new("UICorner", LockBtn).CornerRadius = UDim.new(0, 4)

local ToggleBtn = Instance.new("TextButton", TopBar)
ToggleBtn.Size = UDim2.new(0, 45, 0, 20)
ToggleBtn.Position = UDim2.new(1, -50, 0.5, -10)
ToggleBtn.Text = "Hide"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
ToggleBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 10
ToggleBtn.BorderSizePixel = 0
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 4)

local SmallFrame = Instance.new("Frame", ScreenGui)
SmallFrame.Size = UDim2.new(0, 80, 0, 28)
SmallFrame.Position = UDim2.new(0.02, 0, 0.05, 0)
SmallFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
SmallFrame.BorderSizePixel = 0
Instance.new("UICorner", SmallFrame).CornerRadius = UDim.new(0, 6)

local MiniToggleBtn = Instance.new("TextButton", SmallFrame)
MiniToggleBtn.Size = UDim2.new(1, 0, 1, 0)
MiniToggleBtn.Text = "UI 열기/닫기"
MiniToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MiniToggleBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
MiniToggleBtn.Font = Enum.Font.GothamBold
MiniToggleBtn.TextSize = 9
MiniToggleBtn.BorderSizePixel = 0
Instance.new("UICorner", MiniToggleBtn).CornerRadius = UDim.new(0, 6)

MiniToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

local TabHeaderFrame = Instance.new("Frame", MainFrame)
TabHeaderFrame.Size = UDim2.new(1, -20, 0, 28)
TabHeaderFrame.Position = UDim2.new(0, 10, 0, 40)
TabHeaderFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
TabHeaderFrame.BorderSizePixel = 0
Instance.new("UICorner", TabHeaderFrame).CornerRadius = UDim.new(0, 6)

local TabListLayout = Instance.new("UIListLayout", TabHeaderFrame)
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 2)

local tabContentPages = {}
local currentActiveTab = nil
local tabButtons = {}

local function createTab(name)
    local tabBtn = Instance.new("TextButton", TabHeaderFrame)
    tabBtn.Size = UDim2.new(0.166, -2, 1, 0)
    tabBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    tabBtn.TextColor3 = Color3.fromRGB(140, 140, 155)
    tabBtn.Text = name
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 9
    tabBtn.BorderSizePixel = 0
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 6)

    local page = Instance.new("ScrollingFrame", MainFrame)
    page.Size = UDim2.new(1, -20, 1, -80)
    page.Position = UDim2.new(0, 10, 0, 74)
    page.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    page.Visible = false
    page.CanvasSize = UDim2.new(0, 0, 0, 400)
    page.ScrollBarThickness = 3
    page.BorderSizePixel = 0
    Instance.new("UICorner", page).CornerRadius = UDim.new(0, 6)

    local pageLayout = Instance.new("UIListLayout", page)
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding = UDim.new(0, 6)
    pageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    table.insert(tabButtons, {Button = tabBtn, Page = page})

    tabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabButtons) do
            t.Page.Visible = false
            t.Button.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            t.Button.TextColor3 = Color3.fromRGB(140, 140, 155)
        end
        page.Visible = true
        tabBtn.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    if not currentActiveTab then
        page.Visible = true
        tabBtn.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        currentActiveTab = page
    end

    table.insert(tabContentPages, page)
    return page
end

local LegitTab = createTab("Legit")
local VisualsTab = createTab("Visuals")
local MoveTab = createTab("Move")
local TeleportTab = createTab("Teleport")
local EmotesTab = createTab("Emotes")
local SkyboxTab = createTab("Skybox")

local function createButton(parent, name, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.95, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.Text = name .. " : OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. " : " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 100, 220) or Color3.fromRGB(24, 24, 32)
        btn.TextColor3 = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
        callback(state)
    end)
    return btn
end

local function createSlider(parent, name, min, max, current, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0.95, 0, 0, 42)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -12, 0, 16)
    label.Position = UDim2.new(0, 8, 0, 4)
    label.Text = name .. " : " .. tostring(current)
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left

    local sliderBg = Instance.new("Frame", frame)
    sliderBg.Size = UDim2.new(1, -16, 0, 6)
    sliderBg.Position = UDim2.new(0, 8, 0, 24)
    sliderBg.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
    sliderBg.BorderSizePixel = 0
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(0, 3)

    local sliderFill = Instance.new("Frame", sliderBg)
    sliderFill.Size = UDim2.new((current - min)/(max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
    sliderFill.BorderSizePixel = 0
    Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(0, 3)

    local dragging = false
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
            sliderFill.Size = UDim2.new(pos, 0, 1, 0)
            local val = math.floor(min + (max - min) * pos)
            label.Text = name .. " : " .. tostring(val)
            callback(val)
        end
    end)
end

local isLocked = false
local draggingFrame = nil
local dragStart = nil
local startPos = nil

LockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    LockBtn.Text = isLocked and "Unlock" or "Lock"
    LockBtn.BackgroundColor3 = isLocked and Color3.fromRGB(0, 100, 220) or Color3.fromRGB(35, 35, 45)
    LockBtn.TextColor3 = isLocked and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
end)

TopBar.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not isLocked then
        draggingFrame = MainFrame
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

SmallFrame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not isLocked then
        draggingFrame = SmallFrame
        dragStart = input.Position
        startPos = SmallFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingFrame and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        draggingFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingFrame = nil
    end
end)

local FOV = 150
local FOVGui = Instance.new("ScreenGui", PlayerGui)
FOVGui.Name = "HoNyang💩FOV"
FOVGui.ResetOnSpawn = false

local FOVFrame = Instance.new("Frame", FOVGui)
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, -25)
FOVFrame.Size = UDim2.new(0, FOV * 2, 0, FOV * 2)
FOVFrame.BackgroundTransparency = 1
FOVFrame.Visible = false

local UICorner = Instance.new("UICorner", FOVFrame)
UICorner.CornerRadius = UDim.new(1, 0)

local FOVStroke = Instance.new("UIStroke", FOVFrame)
FOVStroke.Thickness = 1
FOVStroke.Color = Color3.fromRGB(255, 255, 255)

local RageUIGui = Instance.new("ScreenGui", PlayerGui)
RageUIGui.Name = "HoNyangRageUI"
RageUIGui.ResetOnSpawn = false

local CrosshairContainer = Instance.new("Frame", RageUIGui)
CrosshairContainer.AnchorPoint = Vector2.new(0.5, 0.5)
CrosshairContainer.Position = UDim2.new(0.5, 0, 0.5, -35)
CrosshairContainer.Size = UDim2.new(0, 40, 0, 40)
CrosshairContainer.BackgroundTransparency = 1
CrosshairContainer.Visible = false

local lines = {
    {Size = UDim2.new(0, 8, 0, 2), DefaultPos = UDim2.new(0, 0, 0.5, -1)},
    {Size = UDim2.new(0, 8, 0, 2), DefaultPos = UDim2.new(1, -8, 0.5, -1)},
    {Size = UDim2.new(0, 2, 0, 8), DefaultPos = UDim2.new(0.5, -1, 0, 0)},
    {Size = UDim2.new(0, 2, 0, 8), DefaultPos = UDim2.new(0.5, -1, 1, -8)}
}

local crosshairLines = {}
for _, info in ipairs(lines) do
    local line = Instance.new("Frame", CrosshairContainer)
    line.Size = info.Size
    line.Position = info.DefaultPos
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    line.BorderSizePixel = 0
    table.insert(crosshairLines, {Line = line, DefaultPos = info.DefaultPos})
end

local RageTextLabel = Instance.new("TextLabel", RageUIGui)
RageTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
RageTextLabel.Position = UDim2.new(0.5, 0, 0.5, 25)
RageTextLabel.Size = UDim2.new(0, 200, 0, 25)
RageTextLabel.BackgroundTransparency = 1
RageTextLabel.Text = "regebot.hoyang😊"
RageTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
RageTextLabel.TextStrokeTransparency = 0
RageTextLabel.Font = Enum.Font.GothamBold
RageTextLabel.TextSize = 13
RageTextLabel.TextXAlignment = Enum.TextXAlignment.Center
RageTextLabel.Visible = false

local rageHue = 0
local rotAngle = 0
RunService.RenderStepped:Connect(function()
    RageTextLabel.Visible = CrosshairContainer.Visible
    if CrosshairContainer.Visible then
        rageHue = (rageHue + 2) % 360
        local rainbowColor = Color3.fromHSV(rageHue / 360, 1, 1)
        for _, item in ipairs(crosshairLines) do
            item.Line.BackgroundColor3 = rainbowColor
        end
        RageTextLabel.TextColor3 = rainbowColor

        rotAngle = (rotAngle + 4) % 360
        CrosshairContainer.Rotation = rotAngle

        local timeVal = tick() * 5
        local pulse = (math.sin(timeVal) + 1) * 0.5 
        
        crosshairLines[1].Line.Position = UDim2.new(0, math.floor(3 + pulse * 6), 0.5, -1)
        crosshairLines[2].Line.Position = UDim2.new(1, math.floor(-11 - pulse * 6), 0.5, -1)
        crosshairLines[3].Line.Position = UDim2.new(0.5, -1, 0, math.floor(3 + pulse * 6))
        crosshairLines[4].Line.Position = UDim2.new(0.5, -1, 1, math.floor(-11 - pulse * 6))
    end
end)

createButton(LegitTab, "Aimbot (Players & NPCs)", function(Value)
    getgenv().AimbotEnabled = Value
    FOVFrame.Visible = Value
end)

createButton(LegitTab, "Wall Check (Aimbot)", function(Value)
    getgenv().WallCheckEnabled = Value
end)

createSlider(LegitTab, "FOV Size", 1, 300, 150, function(Value)
    FOV = Value
    FOVFrame.Size = UDim2.new(0, FOV * 2, 0, FOV * 2)
end)

local originalWeaponValues = {}

createButton(LegitTab, "총알속도제한0", function(Value)
    getgenv().RivalsNoCD = Value
    if Value then
        task.spawn(function()
            while getgenv().RivalsNoCD do
                task.wait(2)
                pcall(function()
                    for _, v in pairs(getgc(true)) do
                        if type(v) == "table" then
                            if rawget(v, "ShootCooldown") and not originalWeaponValues[v] then
                                originalWeaponValues[v] = {Key = "ShootCooldown", Val = v.ShootCooldown}
                            end
                            if rawget(v, "FireRate") and not originalWeaponValues[v] then
                                originalWeaponValues[v] = {Key = "FireRate", Val = v.FireRate}
                            end
                            if rawget(v, "Cooldown") and not originalWeaponValues[v] then
                                originalWeaponValues[v] = {Key = "Cooldown", Val = v.Cooldown}
                            end

                            if rawget(v, "ShootCooldown") then v.ShootCooldown = 0 end
                            if rawget(v, "FireRate") then v.FireRate = 0 end
                            if rawget(v, "Cooldown") then v.Cooldown = 0 end
                        end
                    end
                end)
            end
        end)
    else
        pcall(function()
            for tbl, info in pairs(originalWeaponValues) do
                if type(tbl) == "table" and info and info.Key then
                    tbl[info.Key] = info.Val
                end
            end
            table.clear(originalWeaponValues)
        end)
    end
end)

createButton(LegitTab, "Fast Melee", function(Value)
    getgenv().FastMeleeEnabled = Value
end)

task.spawn(function()
    while true do
        task.wait(1.5)
        if getgenv().FastMeleeEnabled then
            pcall(function()
                for _, v in pairs(getgc(true)) do
                    if type(v) == "table" then
                        if rawget(v, "Cooldown") then v.Cooldown = 0 end
                        if rawget(v, "AttackCooldown") then v.AttackCooldown = 0 end
                        if rawget(v, "SwingCooldown") then v.SwingCooldown = 0 end
                        if rawget(v, "HitCooldown") then v.HitCooldown = 0 end
                        if rawget(v, "Delay") then v.Delay = 0 end
                    end
                end
                
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                            local animName = string.lower(track.Animation.AnimationId)
                            if animName:find("sword") or animName:find("melee") or animName:find("knife") or animName:find("slash") or animName:find("punch") or animName:find("attack") then
                                track:AdjustSpeed(8.0)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

local __repS = cloneref(game:GetService("ReplicatedStorage"))
local __plrs = cloneref(game:GetService("Players"))
local __runS = cloneref(game:GetService("RunService"))
local __ws = cloneref(game:GetService("Workspace"))
local __lplr = __plrs.LocalPlayer
local __util = require(__repS.Modules.Utility)
local __enum = require(__repS.Modules.EnumLibrary)
local __FighterController = require(__lplr.PlayerScripts.Controllers.FighterController)
local __SpectateController = require(__lplr.PlayerScripts.Controllers:WaitForChild("SpectateController"))

getgenv().Config = {
    Enabled = false,
    FireRate = 0.0005,
    WeaponSlot = "Melee"
}

local __slots = {
    Primary = 1,
    Secondary = 2,
    Melee = 3
}

local function __getSlotNumber()
    return __slots[getgenv().Config.WeaponSlot] or 3
end

task.spawn(function()
    local localFighter = __FighterController.LocalFighter
    while not localFighter do
        task.wait(0.1)
        localFighter = __FighterController.LocalFighter
    end
    pcall(function()
        localFighter:EquipItem(__getSlotNumber())
    end)
end)

task.spawn(function()
    while true do
        task.wait(1)
        if not getgenv().Config.Enabled then continue end
        local localFighter = __FighterController.LocalFighter
        if localFighter then
            pcall(function()
                localFighter:EquipItem(__getSlotNumber())
            end)
        end
    end
end)

local __lastFire = 0
local __deflecting = {}
__plrs.PlayerRemoving:Connect(function(player)
    __deflecting[player] = nil
end)

local function __updateDeflection()
    if not __FighterController or not __FighterController.Objects then return end
    for _, fighterObj in __FighterController.Objects do
        local player = fighterObj.Player
        if not player then continue end
        if not fighterObj.Entity or not fighterObj.Entity:IsAlive() or fighterObj:Get("IsSpectating") then
            __deflecting[player] = false
            continue
        end
        local equipped = fighterObj.EquippedItem
        local isKatana = equipped and equipped.ViewModel and equipped.ViewModel.Name == "Katana"
        local isDeflecting = false
        if isKatana then
            isDeflecting = (equipped._attack_cooldown and equipped._attack_cooldown > tick()) or false
        end
        __deflecting[player] = isDeflecting
    end
end

local function __isEnemy(player)
    if player == __lplr then return false end
    local duel = __SpectateController.CurrentDuelSubject
    local localDueler = duel and duel:GetDueler(__lplr)
    local localTeam = localDueler and localDueler:Get("TeamID") or nil
    if localTeam and duel and duel.Duelers then
        for _, dueler in duel.Duelers do
            if dueler.Player == player then
                local team = dueler:Get("TeamID")
                return team ~= localTeam
            end
        end
    end
    local pTeam = player:GetAttribute("TeamID")
    local lTeam = __lplr:GetAttribute("TeamID")
    if pTeam and lTeam then
        return pTeam ~= lTeam
    end
    return true
end

local function __getClosestTarget()
    local char = __lplr.Character
    if not char then return nil, nil, nil end
    local myRoot = char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil, nil, nil end
    local closestPlayer = nil
    local closestRoot = nil
    local closestHead = nil
    local closestDist = 500
    for _, player in __plrs:GetPlayers() do
        if not __isEnemy(player) then continue end
        local pChar = player.Character
        if not pChar then continue end
        local pRoot = pChar:FindFirstChild("HumanoidRootPart")
        local pHead = pChar:FindFirstChild("Head")
        local pHum = pChar:FindFirstChildWhichIsA("Humanoid")
        if not (pRoot and pHead and pHum and pHum.Health > 0) then continue end
        local dist = (myRoot.Position - pRoot.Position).Magnitude
        if dist < closestDist then
            closestDist = dist
            closestPlayer = player
            closestRoot = pRoot
            closestHead = pHead
        end
    end
    return closestPlayer, closestRoot, closestHead
end

__runS.Heartbeat:Connect(function()
    if not getgenv().MeleeRageBotEnabled then return end
    __updateDeflection()
    local targetPlayer, targetRoot, targetHead = __getClosestTarget()
    local desyncCF = nil
    
    if targetRoot and targetHead then
        local t = tick() * 12
        local offsetX = math.sin(t) * 3
        local offsetZ = -4 + (math.cos(t) * 1)
        local desyncPos = (targetRoot.CFrame * CFrame.new(offsetX, 0.5, offsetZ)).Position
        desyncCF = CFrame.lookAt(desyncPos, targetHead.Position)
    end

    if desyncCF and __lplr.Character then
        local myRoot = __lplr.Character:FindFirstChild("HumanoidRootPart")
        if myRoot then
            local oldCF = myRoot.CFrame
            local oldVel = myRoot.Velocity
            local oldRotVel = myRoot.RotVelocity
            myRoot.CFrame = desyncCF
            __runS:BindToRenderStep("__restore", 101, function()
                if myRoot then
                    myRoot.CFrame = oldCF
                    myRoot.Velocity = oldVel
                    myRoot.RotVelocity = oldRotVel
                end
                __runS:UnbindFromRenderStep("__restore")
            end)
        end
    end

    if not targetPlayer or not targetHead or not targetRoot then return end
    if __deflecting[targetPlayer] then return end
    if not __lplr.Character or not __lplr.Character:FindFirstChild("HumanoidRootPart") then return end
    if not __FighterController or not __FighterController.LocalFighter then return end
    local item = __FighterController.LocalFighter.EquippedItem
    if not item then return end
    if tick() - __lastFire < getgenv().Config.FireRate then return end
    __lastFire = tick()
    local originPos = desyncCF and desyncCF.Position or targetRoot.Position
    local targetPos = targetHead.Position
    local aimCF = CFrame.lookAt(originPos, targetPos)
    local targetCF = targetHead.CFrame
    local randomOffset = Vector3.new(
        (math.random() - 0.5) * 0.1,
        (math.random() - 0.5) * 0.1,
        (math.random() - 0.5) * 0.1
    )
    local aimedPos = targetPos + randomOffset
    local objSpaceHeadOffset = targetHead.CFrame:ToObjectSpace(CFrame.new(aimedPos))
    local cameradata = {}
    cameradata[utf8.char(1)] = {
        [utf8.char(0)] = __util:EncodeCFrame(aimCF),
        [utf8.char(1)] = __util:EncodeCFrame(targetCF),
        [utf8.char(2)] = targetHead,
        [utf8.char(3)] = __util:EncodeCFrame(objSpaceHeadOffset)
    }
    __repS.Remotes.Replication.Fighter.UseItem:FireServer(
        item:Get("ObjectID"),
        __enum:ToEnum("StartShooting"),
        cameradata,
        nil
    )
end)

createButton(LegitTab, "레이지봇 (일반/근접 통합)", function(Value)
    getgenv().MeleeRageBotEnabled = Value
    getgenv().Config.Enabled = Value
    CrosshairContainer.Visible = Value
end)

local weaponSelectFrame = Instance.new("Frame", LegitTab)
weaponSelectFrame.Size = UDim2.new(0.95, 0, 0, 32)
weaponSelectFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
weaponSelectFrame.BorderSizePixel = 0
Instance.new("UICorner", weaponSelectFrame).CornerRadius = UDim.new(0, 6)

local weaponListLayout = Instance.new("UIListLayout", weaponSelectFrame)
weaponListLayout.FillDirection = Enum.FillDirection.Horizontal
weaponListLayout.SortOrder = Enum.SortOrder.LayoutOrder
weaponListLayout.Padding = UDim.new(0, 2)

local function createWeaponSelectBtn(name, slotKey)
    local btn = Instance.new("TextButton", weaponSelectFrame)
    btn.Size = UDim2.new(0.33, -2, 1, 0)
    btn.BackgroundColor3 = (getgenv().Config.WeaponSlot == slotKey) and Color3.fromRGB(0, 100, 220) or Color3.fromRGB(28, 28, 38)
    btn.TextColor3 = (getgenv().Config.WeaponSlot == slotKey) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 175)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 9
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        getgenv().Config.WeaponSlot = slotKey
        for _, child in ipairs(weaponSelectFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
                child.TextColor3 = Color3.fromRGB(160, 160, 175)
            end
        end
        btn.BackgroundColor3 = Color3.fromRGB(0, 100, 220)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    return btn
end

createWeaponSelectBtn("기본무기", "Primary")
createWeaponSelectBtn("보조무기", "Secondary")
createWeaponSelectBtn("근접무기", "Melee")

RunService:BindToRenderStep("HoNyangAimbot", Enum.RenderPriority.Camera.Value + 1, function()
    if not getgenv().AimbotEnabled then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local nearestTarget = nil
    local shortestDistance = math.huge
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.IgnoreWater = true
    
    local function isVisible(targetPart)
        if not getgenv().WallCheckEnabled then return true end
        local origin = Camera.CFrame.Position
        local direction = targetPart.Position - origin
        raycastParams.FilterDescendantsInstances = {char, targetPart.Parent}
        local result = workspace:Raycast(origin, direction, raycastParams)
        return result == nil
    end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Humanoid") and obj.Health > 0 then
            local model = obj.Parent
            if model and model ~= char and not Players:GetPlayerFromCharacter(model) then
                local head = model:FindFirstChild("Head")
                if head then
                    local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if onScreen and distance <= FOV and distance < shortestDistance and isVisible(head) then
                        shortestDistance = distance
                        nearestTarget = head
                    end
                end
            end
        end
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local enemyChar = player.Character
            if enemyChar:FindFirstChildOfClass("ForceField") or (tick() - (player:GetAttribute("SpawnTime") or 0) < 1.5) then continue end

            local humanoid = enemyChar:FindFirstChildOfClass("Humanoid")
            local linkHead = enemyChar:FindFirstChild("Head")
            if humanoid and humanoid.Health > 0 and linkHead then
                local pos, onScreen = Camera:WorldToViewportPoint(linkHead.Position)
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if onScreen and distance <= FOV and distance < shortestDistance and isVisible(linkHead) then
                    shortestDistance = distance
                    nearestTarget = linkHead
                end
            end
        end
    end
    
    if nearestTarget then
        Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, nearestTarget.Position)
    end
end)

createButton(VisualsTab, "Name ESP", function(Value)
    getgenv().NameEnabled = Value
end)

createButton(VisualsTab, "Health Bar ESP", function(Value)
    getgenv().HealthEnabled = Value
end)

createButton(VisualsTab, "맵 투명화", function(Value)
    getgenv().MapTransparency = Value
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local isPlayerPart = false
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character and obj:IsDescendantOf(p.Character) then
                    isPlayerPart = true
                    break
                end
            end
            if not isPlayerPart then
                if Value then
                    if not obj:GetAttribute("OriginalTransparency") then
                        obj:SetAttribute("OriginalTransparency", obj.Transparency)
                    end
                    obj.Transparency = 0.6
                else
                    local orig = obj:GetAttribute("OriginalTransparency")
                    if orig then
                        obj.Transparency = orig
                    else
                        obj.Transparency = 0
                    end
                end
            end
        end
    end
end)

local espCounter = 0
RunService.RenderStepped:Connect(function()
    espCounter = (espCounter + 1) % 4
    if espCounter ~= 0 then return end

    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            table.insert(targets, {Model = p.Character, Name = p.Name})
        end
    end
    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Humanoid") and obj.Health > 0 then
            local model = obj.Parent
            if model and model ~= LocalPlayer.Character and not Players:GetPlayerFromCharacter(model) then
                table.insert(targets, {Model = model, Name = model.Name})
            end
        end
    end

    for _, targetData in ipairs(targets) do
        local char = targetData.Model
        local head = char:FindFirstChild("Head")
        local hum = char:FindFirstChildOfClass("Humanoid")
        local isAlive = hum and hum.Health > 0

        local highlight = char:FindFirstChild("HoNyangHighlight")
        if (getgenv().NameEnabled or getgenv().HealthEnabled) and isAlive then
            if not highlight then
                highlight = Instance.new("Highlight", char)
                highlight.Name = "HoNyangHighlight"
                highlight.Adornee = char
            end
            highlight.Enabled = true
            highlight.FillTransparency = 0.8
            highlight.OutlineColor = Color3.fromRGB(255, 50, 50)
        else
            if highlight then highlight.Enabled = false end
        end

        local uiContainer = char:FindFirstChild("HoNyangESPUI")
        if (getgenv().NameEnabled or getgenv().HealthEnabled) and isAlive and head then
            if not uiContainer then
                uiContainer = Instance.new("BillboardGui", char)
                uiContainer.Name = "HoNyangESPUI"
                uiContainer.Size = UDim2.new(0, 100, 0, 50)
                uiContainer.StudsOffset = Vector3.new(0, 2.5, 0)
                uiContainer.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel", uiContainer)
                nameLabel.Name = "NameLabel"
                nameLabel.Size = UDim2.new(1, 0, 0, 20)
                nameLabel.BackgroundTransparency = 1
                nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                nameLabel.TextStrokeTransparency = 0
                nameLabel.TextSize = 12
                nameLabel.Font = Enum.Font.GothamBold

                local healthBg = Instance.new("Frame", uiContainer)
                healthBg.Name = "HealthBg"
                healthBg.Size = UDim2.new(0.8, 0, 0, 5)
                healthBg.Position = UDim2.new(0.1, 0, 0, 22)
                healthBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

                local healthBar = Instance.new("Frame", healthBg)
                healthBar.Name = "HealthBar"
                healthBar.Size = UDim2.new(1, 0, 1, 0)
                healthBar.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
            end

            local nameLbl = uiContainer:FindFirstChild("NameLabel")
            local healthBg = uiContainer:FindFirstChild("HealthBg")
            local healthBar = healthBg and healthBg:FindFirstChild("HealthBar")

            if nameLbl then
                nameLbl.Visible = getgenv().NameEnabled
                nameLbl.Text = targetData.Name
            end
            if healthBg and healthBar then
                healthBg.Visible = getgenv().HealthEnabled
                healthBar.Size = UDim2.new(math.clamp(hum.Health / hum.MaxHealth, 0, 1), 0, 1, 0)
            end
            uiContainer.Enabled = true
        else
            if uiContainer then uiContainer.Enabled = false end
        end
    end
end)

local bv, bg, flyConn
createButton(MoveTab, "Fly", function(Value)
    getgenv().FlyEnabled = Value
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local hum = char:FindFirstChildOfClass("Humanoid")
    
    if Value then
         if not hrp:FindFirstChild("HoNyangFlyBV") then
            bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "HoNyangFlyBV"
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Velocity = Vector3.new(0, 0, 0)
         end
         if not hrp:FindFirstChild("HoNyangFlyBG") then
            bg = Instance.new("BodyGyro", hrp)
            bg.Name = "HoNyangFlyBG"
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.P = 20000
            bg.CFrame = hrp.CFrame
         end
         if hum then hum.PlatformStand = true end
         
         flyConn = RunService.RenderStepped:Connect(function()
            if not getgenv().FlyEnabled then return end
            local currentTargetChar = LocalPlayer.Character
            if not currentTargetChar or not currentTargetChar:FindFirstChild("HumanoidRootPart") then return end
            
            local currentHrp = currentTargetChar.HumanoidRootPart
            local currentHum = currentTargetChar:FindFirstChildOfClass("Humanoid")
            local currentBv = currentHrp:FindFirstChild("HoNyangFlyBV")
            local currentBg = currentHrp:FindFirstChild("HoNyangFlyBG")
            
            if currentBv and currentBg and currentHum then
               local speed = 50
               local camCF = Camera.CFrame
               local moveDir = currentHum.MoveDirection
               local velocity = Vector3.new(0, 0, 0)
               if moveDir.Magnitude > 0 then
                  velocity = (camCF.LookVector * (moveDir:Dot(Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z).Unit)) + camCF.RightVector * (moveDir:Dot(Vector3.new(camCF.RightVector.X, 0, camCF.RightVector.Z).Unit))) * speed
               end
               currentBv.Velocity = velocity
               currentBg.CFrame = camCF
            end
         end)
    else
         if flyConn then flyConn:Disconnect() end
         if hrp:FindFirstChild("HoNyangFlyBV") then hrp.HoNyangFlyBV:Destroy() end
         if hrp:FindFirstChild("HoNyangFlyBG") then hrp.HoNyangFlyBG:Destroy() end
         if hum then hum.PlatformStand = false end
    end
end)

createButton(MoveTab, "Noclip", function(Value)
    getgenv().NoclipEnabled = Value
    task.spawn(function()
         while getgenv().NoclipEnabled do
            RunService.Stepped:Wait()
            local char = LocalPlayer.Character
            if char then
               for _, v in pairs(char:GetDescendants()) do
                  if v:IsA("BasePart") then v.CanCollide = false end
               end
            end
            task.wait(0.5)
         end
    end)
end)

local function getNearestAlivePlayer()
   local targetChar = nil
   local minD = math.huge
   if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      local myPos = LocalPlayer.Character.HumanoidRootPart.Position
      for _, p in pairs(Players:GetPlayers()) do
         if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if p.Character:FindFirstChildOfClass("ForceField") or (tick() - (p:GetAttribute("SpawnTime") or 0) < 1.5) then continue end

            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
               local d = (myPos - p.Character.HumanoidRootPart.Position).Magnitude
               if d < minD then
                  minD = d
                  targetChar = p.Character
               end
            end
         end
      end
   end
   return targetChar
end

local HeadTPToggle, BackTPToggle
HeadTPToggle = createButton(TeleportTab, "Head TP (15 Studs Above)", function(Value)
    getgenv().HeadTPEnabled = Value
    if Value then
         task.spawn(function()
            while getgenv().HeadTPEnabled do
               RunService.RenderStepped:Wait()
               local char = LocalPlayer.Character
               local hum = char and char:FindFirstChildOfClass("Humanoid")
               if not char or not hum or hum.Health <= 0 then break end
               local targetPlayer = getNearestAlivePlayer()
               if targetPlayer and targetPlayer:FindFirstChild("HumanoidRootPart") then
                  char.HumanoidRootPart.CFrame = targetPlayer.HumanoidRootPart.CFrame + Vector3.new(0, 15, 0)
               else
                  task.wait(0.2)
               end
            end
            getgenv().HeadTPEnabled = false
            HeadTPToggle.Text = "Head TP (15 Studs Above) : OFF"
         end)
    end
end)

BackTPToggle = createButton(TeleportTab, "Back TP (Behind Target)", function(Value)
    getgenv().BackTPEnabled = Value
    if Value then
         task.spawn(function()
            while getgenv().BackTPEnabled do
               RunService.RenderStepped:Wait()
               local char = LocalPlayer.Character
               local hum = char and char:FindFirstChildOfClass("Humanoid")
               if not char or not hum or hum.Health <= 0 then break end
               local targetPlayer = getNearestAlivePlayer()
               if targetPlayer and targetPlayer:FindFirstChild("HumanoidRootPart") then
                  char.HumanoidRootPart.CFrame = targetPlayer.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
               else
                  task.wait(0.2)
               end
            end
            getgenv().BackTPEnabled = false
            BackTPToggle.Text = "Back TP (Behind Target) : OFF"
         end)
    end
end)

local activeAnimTrack = nil
local emoteConn = nil

local function anim2track(asset_id)
    local objs = game:GetObjects(asset_id)
    for i = 1, #objs do
        if objs[i]:IsA("Animation") then
            return objs[i].AnimationId
        end
    end
    return asset_id
end

local animid = "92281817840531"
local speed = 99999
if not animid:find("rbxassetid://") then
    animid = "rbxassetid://" .. animid
end
pcall(function()
    animid = anim2track(animid)
end)

local animation = Instance.new("Animation")
animation.AnimationId = animid

local function playAnim(character)
    if not getgenv().CustomEmoteEnabled then return end
    local Hum = character:FindFirstChildWhichIsA("Humanoid")
    if not Hum then return end
    
    pcall(function()
        for _, track in next, Hum:GetPlayingAnimationTracks() do
            if track.Animation.AnimationId == animation.AnimationId then
                track:Stop()
            end
        end
        local anim = Hum:LoadAnimation(animation)
        anim.Priority = Enum.AnimationPriority.Action4
        anim:Play()
        anim:AdjustSpeed(speed)
        activeAnimTag = anim
        
        anim.Stopped:Connect(function()
            if getgenv().CustomEmoteEnabled then
                playAnim(character)
            end
        end)
    end)
end

local function stopAnim(character)
    if activeAnimTrack then
        pcall(function() activeAnimTrack:Stop() end)
        activeAnimTrack = nil
    end
    local Hum = character and character:FindFirstChildWhichIsA("Humanoid")
    if Hum then
        pcall(function()
            for _, track in next, Hum:GetPlayingAnimationTracks() do
                if track.Animation.AnimationId == animation.AnimationId then
                    track:Stop()
                end
            end
        end)
    end
end

createButton(EmotesTab, "Custom Emote", function(Value)
    getgenv().CustomEmoteEnabled = Value
    val = Value
    local char = LocalPlayer.Character
    if Value then
        if char then playAnim(char) end
        if not emoteConn then
            emoteConn = LocalPlayer.CharacterAdded:Connect(function(newChar)
                newChar:WaitForChild("Humanoid")
                if getgenv().CustomEmoteEnabled then
                    task.wait(0.5)
                    playAnim(newChar)
                end
            end)
        end
    else
        if char then stopAnim(char) end
        if emoteConn then
            emoteConn:Disconnect()
            emoteConn = nil
        end
    end
end)

local function setSkybox(skyId)
    local existingSky = Lighting:FindFirstChild("HoNyangSky")
    if existingSky then existingSky:Destroy() end

    local sky = Instance.new("Sky")
    sky.Name = "HoNyangSky"
    sky.SkyboxBk = skyId
    sky.SkyboxDn = skyId
    sky.SkyboxFt = skyId
    sky.SkyboxLf = skyId
    sky.SkyboxRt = skyId
    sky.SkyboxUp = skyId
    sky.Parent = Lighting
end

local function removeSkybox()
    local existingSky = Lighting:FindFirstChild("HoNyearSky") or Lighting:FindFirstChild("HoNyangSky")
    if existingSky then existingSky:Destroy() end
end

createButton(SkyboxTab, "스파이더맨스카이박스", function(Value)
    if Value then
        setSkybox("rbxassetid://159454278")
    else
        removeSkybox()
    end
end)

createButton(SkyboxTab, "우주스카이박스", function(Value)
    if Value then
        setSkybox("rbxassetid://159454299")
    else
        removeSkybox()
    end
end)

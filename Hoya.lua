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
MainFrame.Size = UDim2.new(0, 380, 0, 260)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -130)
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
    page.CanvasSize = UDim2.new(0, 0, 0, 240)
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

local __a1b2c3 = setmetatable({}, {
    __index = function(__d4e5f6, __g7h8i9)
        local __j0k1l2, __m3n4o5 = pcall(function()
            return game:GetService(__g7h8i9)
        end)
        if __m3n4o5 then
            return cloneref(__m3n4o5)
        end
        return nil
    end
})

local __p6q7r8 = getgenv()
local __v2w3x4 = __a1b2c3.Players
local __y5z6a7 = __a1b2c3.RunService
local __b8c9d0 = __a1b2c3.ReplicatedStorage
local __k7l8m9 = __v2w3x4.LocalPlayer
local __q3r4s5 = __k7l8m9.PlayerScripts
local __t6u7v8 = require(__q3r4s5.Modules.ItemTypes.Gun)
local __w9x0y1 = require(__b8c9d0.Modules.Utility)

local __z2a3b4 = setmetatable({}, {
    __index = function(_, __c5d6e7)
        local __f8g9h0 = __k7l8m9.Character
        if not __f8g9h0 then return nil end
        if __c5d6e7 == "__root" then
            return __f8g9h0:FindFirstChild("HumanoidRootPart")
        elseif __c5d6e7 == "__head" then
            return __f8g9h0:FindFirstChild("Head")
        end
        return nil
    end
})

__p6q7r8.__s9t0u1 = {}

do
    local __i1j2k3 = __p6q7r8.__s9t0u1

    local function isImmune(char, player)
        if not char then return true end
        if char:FindFirstChildOfClass("ForceField") then return true end
        if player then
            local spawnTime = player:GetAttribute("SpawnTime") or 0
            if tick() - spawnTime < 1.5 then return true end
        end
        return false
    end

    function __i1j2k3:__init()
        self.__active = false
        self.__target = nil
        self.__desync = false
        self.__conn1 = nil
        self.__conn2 = nil
        self.__task1 = nil
        self.__oldfunc = nil
        self.__activateTime = 0
        self:__setup()
    end

    function __i1j2k3:__setup()
        self.__conn1 = __y5z6a7.Heartbeat:Connect(function()
            if not self.__active then return end
            self.__target = self:__find()
        end)

        local __l4m5n6 = __t6u7v8.StartShooting
        self.__oldfunc = __l4m5n6
        __t6u7v8.StartShooting = function(__o7p8q9, ...)
            local __r0s1t2 = {__l4m5n6(__o7p8q9, ...)}
            if not self.__active then return unpack(__r0s1t2) end

            if tick() - self.__activateTime < 1.4 then
                return unpack(__r0s1t2)
            end

            if not __o7p8q9.ClientFighter or not __o7p8q9.ClientFighter.IsLocalPlayer then
                return unpack(__r0s1t2)
            end

            local __u3v4w5 = __r0s1t2[3]
            if not __u3v4w5 or typeof(__u3v4w5) ~= "table" then
                return unpack(__r0s1t2)
            end

            local __x6y7z8 = self.__target

            if not __x6y7z8 or not __x6y7z8.Character or isImmune(__x6y7z8.Character, __x6y7z8) then
                return unpack(__r0s1t2)
            end

            __r0s1t2[4] = true

            if not __desync or self.__curr ~= __x6y7z8 then
                self:__desync_start(__x6y7z8)
            end

            if self.__task1 then
                task.cancel(self.__task1)
                self.__task1 = nil
            end

            local __a9b0c1 = __x6y7z8.Character:FindFirstChild("Head")
            if not __a9b0c1 then return unpack(__r0s1t2) end

            local __d2e3f4 = __a9b0c1.Position
            local __g5h6i7 = __a9b0c1.CFrame
            local __p4q5r6 = __g5h6i7:ToObjectSpace(CFrame.new(__d2e3f4))

            __u3v4w5[utf8.char(0)] = __w9x0y1:EncodeCFrame(__g5h6i7)
            __u3v4w5[utf8.char(1)] = __w9x0y1:EncodeCFrame(__g5h6i7)
            __u3v4w5[utf8.char(2)] = __a9b0c1
            __u3v4w5[utf8.char(3)] = __w9x0y1:EncodeCFrame(__p4q5r6)

            self.__task1 = task.delay(0.04, function()
                self:__desync_stop()
            end)

            return unpack(__r0s1t2)
        end

        local old_ray = __w9x0y1.Raycast
        if old_ray then
            __w9x0y1.Raycast = function(s, o, d, len, f, ft, viz)
                if self.__active then
                    if len and len > 50 and f then
                        local tgt = self.__target
                        if tgt and tgt.Character and tgt.Character:FindFirstChild("Head") then
                            local head = tgt.Character.Head
                            local hitpos = head.Position
                            return {
                                Position = hitpos,
                                Distance = (hitpos - o).Magnitude,
                                Instance = head,
                                Material = head.Material,
                                Normal = Vector3.yAxis
                            }
                        end
                    end
                end
                return old_ray(s, o, d, len, f, ft, viz)
            end
        end
    end

    function __i1j2k3:__find()
        local myChar = __k7l8m9.Character
        if not myChar then return nil end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return nil end
       
        local closest = nil
        local closestDist = math.huge
        local MAX_DISTANCE = math.huge

        for _, player in next, __v2w3x4:GetPlayers() do
            if player == __k7l8m9 then continue end
            if player:GetAttribute("TeamID") == __k7l8m9:GetAttribute("TeamID") then continue end
           
            local char = player.Character
            if not char then continue end

            if isImmune(char, player) then continue end

            local root = char:FindFirstChild("HumanoidRootPart")
            local head = char:FindFirstChild("Head")
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            
            if not (root and head and hum and hum.Health > 0) then continue end
           
            local dist = (myRoot.Position - root.Position).Magnitude
            if dist > MAX_DISTANCE then continue end
            
            if dist < closestDist then
                closestDist = dist
                closest = player
            end
        end
        
        return closest
    end

    function __i1j2k3:__desync_start(__c3d4e5)
        if self.__conn2 then self.__conn2:Disconnect() end
        self.__desync = true
        self.__curr = __c3d4e5

        local tickCounter = 0

        self.__conn2 = __y5z6a7.Heartbeat:Connect(function()
            if not self.__desync then return end
            local __f6g7h8 = __z2a3b4.__root
            if not __f6g7h8 then return end

            if not __c3d4e5.Character or isImmune(__c3d4e5.Character, __c3d4e5) then
                self:__desync_stop()
                return
            end

            local enemyHead = __c3d4e5.Character:FindFirstChild("Head")
            local enemyRoot = __c3d4e5.Character:FindFirstChild("HumanoidRootPart")
            if not enemyHead or not enemyRoot then
                self:__desync_stop()
                return
            end

            local __l2m3n4 = __f6g7h8.CFrame
            local __o5p6q7 = __f6g7h8.Velocity
            local __r8s9t0 = __f6g7h8.RotVelocity

            tickCounter = tickCounter + 1
            local cycle = (tickCounter % 7)

            local offset
            if cycle < 4 then
                offset = CFrame.new(math.random(-3, 3), 4, math.random(-3, 3))
            else
                local sideToggle = (tickCounter % 2 == 0)
                local sideOffset = sideToggle and 3 or -3
                offset = CFrame.new(sideOffset, 0, 0)
            end

            __f6g7h8.CFrame = enemyRoot.CFrame * offset

            __y5z6a7:BindToRenderStep("__restore", 1, function()
                __f6g7h8.CFrame = __l2m3n4
                __f6g7h8.Velocity = __o5p6q7
                __f6g7h8.RotVelocity = __r8s9t0
                __y5z6a7:UnbindFromRenderStep("__restore")
            end)
        end)
    end

    function __i1j2k3:__desync_stop()
        self.__desync = false
        self.__curr = nil
        if self.__conn2 then
            self.__conn2:Disconnect()
            self.__conn2 = nil
        end
    end

    function __i1j2k3:SetState(state)
        self.__active = state
        CrosshairContainer.Visible = state
        if state then
            self.__activateTime = tick() 
        else
            self:__desync_stop()
        end
    end

    __i1j2k3:__init()
end

createButton(LegitTab, "레이지봇 (사일런트 + 크로스헤어)", function(Value)
    if __p6q7r8.__s9t0u1 then
        __p6q7r8.__s9t0u1:SetState(Value)
    end
end)

RunService.Heartbeat:Connect(function()
    if not __p6q7r8.__s9t0u1 or not __p6q7r8.__s9t0u1.__active then return end
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if tool then
            local toolName = string.lower(tool.Name)
            if toolName:find("sword") or toolName:find("melee") or toolName:find("knife") or toolName:find("slash") or toolName:find("punch") or toolName:find("bat") or toolName:find("hammer") or toolName:find("dagger") or toolName:find("fist") then
                local tgt = __p6q7r8.__s9t0u1.__target
                if tgt and tgt.Character and not isImmune(tgt.Character, tgt) then
                    if not __p6q7r8.__s9t0u1.__desync or __p6q7r8.__s9t0u1.__curr ~= tgt then
                        __p6q7r8.__s9t0u1:__desync_start(tgt)
                    end
                end
            end
        end
    end)
end)

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
            uiContainer.Enabled = t_rue or true
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

-- [[ 
--    Project: RM8 - Clean Edition
--    Developer: The Qathardi Developer
-- ]]

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "RM8_Final_Script"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 320, 0, 420)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -40, 0, 40)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "RM8 Script v8.5"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 200, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(0.88, 0, 0.02, 0)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local CurrentLevel = 3
local Toggles = { ["Left"] = false, ["Right"] = false, ["Back"] = false }

local function GetStableCarVelocity(level)
    local maxAngles = {1.5, 2.5, 3.8, 4.5, 5.5}
    return maxAngles[level] or 3
end

local function GetStableBikeVelocity(level)
    local maxAngles = {2.0, 3.5, 5.0, 6.5, 8.0}
    return maxAngles[level] or 5
end

local function CreateBtn(text, color, pos, size)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = size
    btn.Position = pos
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = color
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)
    return btn
end

local ActiveTabBtn = CreateBtn("Tarfe3", Color3.fromRGB(255, 180, 0), UDim2.new(0.05, 0, 0.13, 0), UDim2.new(0.28, 0, 0.09, 0))
ActiveTabBtn.TextColor3 = Color3.new(0, 0, 0)

local AFKBtn = CreateBtn("AFK Cash", Color3.fromRGB(45, 45, 45), UDim2.new(0.36, 0, 0.13, 0), UDim2.new(0.3, 0, 0.09, 0))
local WzniaBtn = CreateBtn("Wznia", Color3.fromRGB(45, 45, 45), UDim2.new(0.69, 0, 0.13, 0), UDim2.new(0.26, 0, 0.09, 0))

local LeftBtn = CreateBtn("Left Side", Color3.fromRGB(180, 40, 40), UDim2.new(0.05, 0, 0.25, 0), UDim2.new(0.42, 0, 0.11, 0))
local RightBtn = CreateBtn("Right Side", Color3.fromRGB(180, 40, 40), UDim2.new(0.53, 0, 0.25, 0), UDim2.new(0.42, 0, 0.11, 0))
local BackBtn = CreateBtn("Bike Wheelie", Color3.fromRGB(40, 150, 70), UDim2.new(0.05, 0, 0.40, 0), UDim2.new(0.9, 0, 0.11, 0))

local LevelBtn = CreateBtn("Tarfe3 Level: [ 3 ]", Color3.fromRGB(50, 50, 50), UDim2.new(0.05, 0, 0.55, 0), UDim2.new(0.9, 0, 0.11, 0))
LevelBtn.MouseButton1Click:Connect(function()
    CurrentLevel = CurrentLevel + 1
    if CurrentLevel > 5 then CurrentLevel = 1 end
    LevelBtn.Text = "Tarfe3 Level: [ " .. tostring(CurrentLevel) .. " ]"
end)

local Footer = Instance.new("TextLabel", MainFrame)
Footer.Size = UDim2.new(1, 0, 0, 40)
Footer.Position = UDim2.new(0, 0, 0.88, 0)
Footer.Text = "RM8 - Qathardi Dev v8.5"
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 12
Footer.TextColor3 = Color3.fromRGB(120, 150, 200)
Footer.BackgroundTransparency = 1

RunService.RenderStepped:Connect(function()
    local char = player.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local seat = humanoid and humanoid.SeatPart
    if not seat then return end

    local currentRot = seat.AssemblyAngularVelocity

    if Toggles["Left"] then
        seat.AssemblyAngularVelocity = Vector3.new(currentRot.X, currentRot.Y, GetStableCarVelocity(CurrentLevel))
    elseif Toggles["Right"] then
        seat.AssemblyAngularVelocity = Vector3.new(currentRot.X, currentRot.Y, -GetStableCarVelocity(CurrentLevel))
    elseif Toggles["Back"] then
        seat.AssemblyAngularVelocity = Vector3.new(GetStableBikeVelocity(CurrentLevel), currentRot.Y, currentRot.Z)
    end
end)

local function ResetVehicle()
    local char = player.Character
    local seat = char and char:FindFirstChildOfClass("Humanoid") and char:FindFirstChildOfClass("Humanoid").SeatPart
    if seat then seat.AssemblyAngularVelocity = Vector3.new(0, 0, 0) end
end

LeftBtn.MouseButton1Click:Connect(function()
    Toggles["Left"] = not Toggles["Left"]
    Toggles["Right"] = false; Toggles["Back"] = false
    LeftBtn.BackgroundColor3 = Toggles["Left"] and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(180, 40, 40)
    RightBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    BackBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 70)
    if not Toggles["Left"] then ResetVehicle() end
end)

-- Right Button Click
RightBtn.MouseButton1Click:Connect(function()
    Toggles["Right"] = not Toggles["Right"]
    Toggles["Left"] = false; Toggles["Back"] = false
    RightBtn.BackgroundColor3 = Toggles["Right"] and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(180, 40, 40)
    LeftBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    BackBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 70)
    if not Toggles["Right"] then ResetVehicle() end
end)

-- Back Button Click
BackBtn.MouseButton1Click:Connect(function()
    Toggles["Back"] = not Toggles["Back"]
    Toggles["Left"] = false; Toggles["Right"] = false
    BackBtn.BackgroundColor3 = Toggles["Back"] and Color3.fromRGB(50, 220, 90) or Color3.fromRGB(40, 150, 70)
    LeftBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    RightBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    if not Toggles["Back"] then ResetVehicle() end
end)

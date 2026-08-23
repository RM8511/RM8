--[========================================================--
    Kansas Auto-Farm Script | Made by RM8511
--========================================================-]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

if _G.KansasRunning then 
    _G.KansasRunning = false
    task.wait(0.2)
end
_G.KansasRunning = true

local playerGui = player:WaitForChild("PlayerGui")

pcall(function()
    if playerGui:FindFirstChild("KansasMobileUI") then
        playerGui.KansasMobileUI:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KansasMobileUI"
ScreenGui.Parent = playerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 130, 0, 42)
ToggleButton.Position = UDim2.new(0.05, 0, 0.3, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Text = "START FARM"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 13
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = ToggleButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Thickness = 1.5
UIStroke.Parent = ToggleButton

local Credit = Instance.new("TextLabel")
Credit.Parent = ToggleButton
Credit.Size = UDim2.new(1, 0, 0, 14)
Credit.Position = UDim2.new(0, 0, 1, 2)
Credit.BackgroundTransparency = 1
Credit.Text = "By RM8511"
Credit.TextColor3 = Color3.fromRGB(160, 160, 160)
Credit.TextSize = 10
Credit.Font = Enum.Font.GothamMedium

local function smoothTeleport(targetCFrame)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local distance = (hrp.Position - targetCFrame.Position).Magnitude
        local speed = 400
        local timeTaken = math.clamp(distance / speed, 0.05, 0.5)
        
        local tweenInfo = TweenInfo.new(timeTaken, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
        task.wait(timeTaken)
    end
end

local function executeFarmStep()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart

    local closestPrompt = nil
    local shortestDistance = math.huge

    for _, prompt in ipairs(workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") and prompt.Enabled then
            local parent = prompt.Parent
            if parent and parent:IsA("BasePart") then
                local dist = (hrp.Position - parent.Position).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPrompt = prompt
                end
            end
        end
    end

    if closestPrompt and closestPrompt.Parent then
        local targetPart = closestPrompt.Parent
        smoothTeleport(targetPart.CFrame + Vector3.new(0, 2.5, 0))
        task.wait(0.15)
        pcall(function()
            fireproximityprompt(closestPrompt)
        end)
        task.wait(0.2)
    end
end

local isRunning = false
ToggleButton.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    
    if isRunning then
        ToggleButton.Text = "STOP FARM"
        UIStroke.Color = Color3.fromRGB(0, 230, 118)
        
        task.spawn(function()
            while isRunning and _G.KansasRunning do
                executeFarmStep()
                task.wait(0.5)
            end
        end)
    else
        ToggleButton.Text = "START FARM"
        UIStroke.Color = Color3.fromRGB(80, 80, 80)
    end
end)

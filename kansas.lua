--[========================================================--
    Kansas Auto-Farm McDonald's | Made by RM8511
--========================================================-]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

if _G.KansasRunning then 
    _G.KansasRunning = false
    task.wait(0.3)
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
ToggleButton.Size = UDim2.new(0, 140, 0, 45)
ToggleButton.Position = UDim2.new(0.05, 0, 0.3, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
ToggleButton.Text = "START FARM"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ToggleButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(90, 90, 90)
UIStroke.Thickness = 2
UIStroke.Parent = ToggleButton

local Credit = Instance.new("TextLabel")
Credit.Parent = ToggleButton
Credit.Size = UDim2.new(1, 0, 0, 15)
Credit.Position = UDim2.new(0, 0, 1, 2)
Credit.BackgroundTransparency = 1
Credit.Text = "By RM8511"
Credit.TextColor3 = Color3.fromRGB(160, 160, 160)
Credit.TextSize = 10
Credit.Font = Enum.Font.GothamMedium

local function preciseTeleport(targetCFrame)
    pcall(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local distance = (hrp.Position - targetCFrame.Position).Magnitude
            local speed = 450
            local timeTaken = math.clamp(distance / speed, 0.05, 0.35)
            
            local tweenInfo = TweenInfo.new(timeTaken, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
            tween:Play()
            task.wait(timeTaken)
        end
    end)
end

local function triggerPromptByKeyword(keyword)
    pcall(function()
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart

        local targetPrompt = nil
        local shortestDist = math.huge

        for _, prompt in ipairs(workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") and prompt.Enabled and prompt.Parent and prompt.Parent:IsA("BasePart") then
                local pName = prompt.Parent.Name:lower()
                local aText = prompt.ActionText:lower()
                
                if pName:find(keyword) or aText:find(keyword) then
                    local dist = (hrp.Position - prompt.Parent.Position).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        targetPrompt = prompt
                    end
                end
            end
        end

        if targetPrompt and targetPrompt.Parent then
            preciseTeleport(targetPrompt.Parent.CFrame + Vector3.new(0, 2, 0))
            task.wait(0.1)
            fireproximityprompt(targetPrompt)
        end
    end)
end

local isRunning = false
ToggleButton.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    
    if isRunning then
        ToggleButton.Text = "STOP FARM"
        UIStroke.Color = Color3.fromRGB(0, 255, 128)
        
        task.spawn(function()
            while isRunning and _G.KansasRunning do
                triggerPromptByKeyword("order")
                task.wait(0.8)
                
                if not isRunning or not _G.KansasRunning then break end
                
                triggerPromptByKeyword("deliver")
                task.wait(1.5)
            end
        end)
    else
        ToggleButton.Text = "START FARM"
        UIStroke.Color = Color3.fromRGB(90, 90, 90)
    end
end)

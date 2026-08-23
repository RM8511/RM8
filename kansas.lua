--[========================================================--
    Kansas Auto-Farm Script | Made by RM8511
--========================================================-]

if _G.KansasRunning then 
    _G.KansasRunning = false
    task.wait(0.2)
end
_G.KansasRunning = true

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- تنظيف الواجهة القديمة
pcall(function()
    if CoreGui:FindFirstChild("KansasMobileUI") then
        CoreGui.KansasMobileUI:Destroy()
    end
end)

-- إنشاء الواجهة الخفيفة للجوال
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KansasMobileUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- الزر الأساسي
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 140, 0, 45)
ToggleButton.Position = UDim2.new(0.05, 0, 0.3, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ToggleButton.Text = "تشغيل السكربت"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ToggleButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 100, 100)
UIStroke.Thickness = 1.5
UIStroke.Parent = ToggleButton

-- حقوقك RM8511
local Credit = Instance.new("TextLabel")
Credit.Parent = ToggleButton
Credit.Size = UDim2.new(1, 0, 0, 15)
Credit.Position = UDim2.new(0, 0, 1, 2)
Credit.BackgroundTransparency = 1
Credit.Text = "By RM8511"
Credit.TextColor3 = Color3.fromRGB(180, 180, 180)
Credit.TextSize = 10
Credit.Font = Enum.Font.GothamMedium

-- انتقال سلس وبدون لاق
local function smoothTeleport(targetCFrame)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local distance = (hrp.Position - targetCFrame.Position).Magnitude
        local speed = 350
        local timeTaken = math.clamp(distance / speed, 0.1, 0.7)
        
        local tweenInfo = TweenInfo.new(timeTaken, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
        task.wait(timeTaken)
    end
end

-- البحث والتفاعل مع أقرب زر وظيفة أو طلب
local function findAndInteract()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    for _, prompt in ipairs(workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") and prompt.Enabled then
            local parent = prompt.Parent
            if parent and parent:IsA("BasePart") then
                -- الانتقال للزر والتفاعل فوراً
                smoothTeleport(parent.CFrame + Vector3.new(0, 3, 0))
                task.wait(0.2)
                pcall(function() fireproximityprompt(prompt) end)
                task.wait(0.3)
                break
            end
        end
    end
end

-- التشغيل والإيقاف
local isRunning = false
ToggleButton.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    
    if isRunning then
        ToggleButton.Text = "إيقاف السكربت"
        UIStroke.Color = Color3.fromRGB(50, 205, 50)
        
        task.spawn(function()
            while isRunning and _G.KansasRunning do
                findAndInteract()
                task.wait(1)
            end
        end)
    else
        ToggleButton.Text = "تشغيل السكربت"
        UIStroke.Color = Color3.fromRGB(100, 100, 100)
    end
end)

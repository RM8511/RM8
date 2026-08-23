--[========================================================--
    Central Kansas Roleplay: WConalds Auto-Farm | RM8511
--========================================================-]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- إلغاء أي نسخة سابقة منعاً للتداخل
if _G.KansasFarmRunning then
    _G.KansasFarmRunning = false
    task.wait(0.3)
end
_G.KansasFarmRunning = true

-- إنشاء واجهة تحكم بسيطة وواضحة على شاشة الجوال
local playerGui = player:WaitForChild("PlayerGui")
pcall(function()
    if playerGui:FindFirstChild("CK_AutoFarmUI") then
        playerGui.CK_AutoFarmUI:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CK_AutoFarmUI"
ScreenGui.Parent = playerGui
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.Size = UDim2.new(0, 150, 0, 50)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBtn.Text = "START WCONALDS"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 13
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Active = true
ToggleBtn.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = ToggleBtn

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 100)
UIStroke.Thickness = 2
UIStroke.Parent = ToggleBtn

-- وظيفة البحث عن أزرار الوظيفة أو التوصيل والتفاعل معها بدقة
local function triggerJobPrompts()
    pcall(function()
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart

        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and obj.Enabled then
                local parentPart = obj.Parent
                if parentPart and parentPart:IsA("BasePart") then
                    -- التحقق من المسافة لضمان عدم التعليق
                    if (hrp.Position - parentPart.Position).Magnitude < 25 then
                        fireproximityprompt(obj)
                    end
                end
            end
        end
    end)
end

-- تشغيل وإيقاف الفارم
local active = false
ToggleBtn.MouseButton1Click:Connect(function()
    active = not active
    
    if active then
        ToggleBtn.Text = "STOP FARM"
        UIStroke.Color = Color3.fromRGB(255, 50, 50)
        
        task.spawn(function()
            while active and _G.KansasFarmRunning do
                -- محاولة تفعل الأوامر القريبة الخاصة بالطلبات أو التوظف بشكل متكرر وآمن
                triggerJobPrompts()
                task.wait(1.5)
            end
        end)
    else
        ToggleBtn.Text = "START WCONALDS"
        UIStroke.Color = Color3.fromRGB(0, 255, 100)
    end
end)

-- إنشاء واجهة التحكم (زر التشغيل والإيقاف)
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 160, 0, 50)
ToggleButton.Position = UDim2.new(0.05, 0, 0.4, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ToggleButton.Text = "تشغيل السكربت"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 18
ToggleButton.Font = Enum.Font.SourceSansBold

-- المتغيرات الأساسية
local isRunning = false
local player = game.Players.LocalPlayer

-- وظيفة الانتقال السريع (Teleport)
local function teleportTo(position)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = position
    end
end

-- زر التبديل (تشغيل / إيقاف)
ToggleButton.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    
    if isRunning then
        ToggleButton.Text = "إيقاف السكربت"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        
        -- حلقة الجمع التلقائي
        task.spawn(function()
            while isRunning do
                -- 1. التوظف أو الذهاب لمنطقة أخذ الطلب
                -- قم بتغيير Vector3.new بالمواقع الدقيقة داخل الماب
                teleportTo(CFrame.new(Vector3.new(0, 10, 0))) 
                task.wait(1)
                
                -- التفاعل مع أخذ الطلب (إن كان يعتمد على ProximityPrompt)
                -- fireproximityprompt(workspace.McDonalds.TakeOrder.ProximityPrompt)
                
                if not isRunning then break end
                
                -- 2. الانتقال السريع لموقع تسليم الطلب
                teleportTo(CFrame.new(Vector3.new(100, 10, 100))) 
                task.wait(1)
                
                -- التفاعل مع التسليم
                -- fireproximityprompt(workspace.McDonalds.DeliverOrder.ProximityPrompt)
                
                task.wait(2) -- انتظار قبل تكرار العملية
            end
        end)
    else
        ToggleButton.Text = "تشغيل السكربت"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

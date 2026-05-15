-- RM8 Ultra System (Rename + Toggle + Save Settings)
local function startRM8()
    local UIS = game:GetService("UserInputService")
    local CoreGui = game:GetService("CoreGui")
    local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    -- 1. دالة تغيير الاسم بقوة
    local function applyRename(root)
        for _, v in pairs(root:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8 HUB")
                end
            end
        end
    end

    -- 2. إنشاء زر الإخفاء والإظهار (Toggle Button)
    local screenGui = Instance.new("ScreenGui")
    local toggleBtn = Instance.new("TextButton")

    screenGui.Name = "RM8_Toggle"
    screenGui.Parent = CoreGui
    screenGui.IgnoreGuiInset = true

    toggleBtn.Name = "ToggleButton"
    toggleBtn.Parent = screenGui
    toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleBtn.Position = UDim2.new(0.02, 0, 0.4, 0) -- مكان الزر في يسار الشاشة
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Text = "RM8"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 14
    toggleBtn.Draggable = true -- تقدر تحرك الزر بيدك

    -- دالة البحث عن القائمة الأصلية لإخفائها
    local function getTargetUI()
        return CoreGui:FindFirstChild("ScreenGui") or PlayerGui:FindFirstChild("ScreenGui") 
        -- السكريبت الأصلي غالباً ينشئ ScreenGui بدون اسم محدد، الكود بيبحث عنه
    end

    toggleBtn.MouseButton1Click:Connect(function()
        for _, g in pairs(CoreGui:GetChildren()) do
            if g:IsA("ScreenGui") and g.Name ~= "RM8_Toggle" then
                g.Enabled = not g.Enabled
            end
        end
        for _, g in pairs(PlayerGui:GetChildren()) do
            if g:IsA("ScreenGui") then
                g.Enabled = not g.Enabled
            end
        end
    end)

    -- تشغيل التحديث المستمر للاسم
    spawn(function()
        while task.wait(0.5) do
            applyRename(CoreGui)
            applyRename(PlayerGui)
        end
    end)
end

-- تشغيل النظام
startRM8()

-- تشغيل السكريبت الأصلي (عالم المملكة)
loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh"))()

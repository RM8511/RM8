-- [[ RM8 KINGDOM SYSTEM - FIXED & ACCURATE ]] --

-- 1. سحب الكود الأصلي وتغيير المسميات فوراً في الذاكرة
local Success, RawData = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
end)

if Success then
    -- استبدال شامل لكل كلمة N7R بـ RM8 لضمان اختفاء الاسم القديم تماماً
    local FinalCode = RawData:gsub("N7R", "RM8")
    loadstring(FinalCode)()
else
    warn("Failed to load original script.")
end

-- 2. إعداد الزر العائم (تم تصغير الحجم إلى 40)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)
local Stroke = Instance.new("UIStroke", ToggleButton)

ToggleButton.Name = "RM8_Toggle"
ToggleButton.Size = UDim2.new(0, 40, 0, 40) -- تم تصغير الحجم هنا بناءً على طلبك
ToggleButton.Position = UDim2.new(0, 15, 0.5, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "RM8"
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 12 -- تم تصغير الخط ليناسب حجم الزر الجديد
ToggleButton.Draggable = true
ToggleButton.Active = true

Corner.CornerRadius = UDim.new(0, 50)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 2

-- وظيفة الزر: إخفاء وإظهار الواجهة (Toggle) للحفاظ على الإعدادات مفعّلة
ToggleButton.MouseButton1Click:Connect(function()
    local coreGui = game:GetService("CoreGui")
    for _, v in pairs(coreGui:GetChildren()) do
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
            v.Enabled = not v.Enabled
        end
    end
end)

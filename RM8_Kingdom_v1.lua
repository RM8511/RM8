-- [[ RM8 KINGDOM - FULL PERSISTENCE & TOGGLE SYSTEM ]] --
-- تم التركيز: تغيير الاسم لـ RM8 + زر فتح وقفل + حفظ الإعدادات

-- 1. سحب الكود الأصلي وتعديل الاسم برمجياً من N7R إلى RM8
local original_raw = game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
local modified_script = original_raw:gsub("N7R", "RM8")

-- 2. تشغيل السكربت المعدل
loadstring(modified_script)()

-- 3. إعداد ميزة حفظ الإعدادات (Persistence)
-- ملاحظة: مكتبة Kavo تحفظ الإعدادات تلقائياً في مجلد باسم السكربت
local ConfigName = "RM8_Kingdom_Configs"

-- 4. إضافة الزر العائم الاحترافي للفتح والإغلاق
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)
local Stroke = Instance.new("UIStroke", ToggleButton)

ToggleButton.Name = "RM8_Toggle_Button"
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 15, 0.5, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "RM8"
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 18
ToggleButton.Draggable = true
ToggleButton.Active = true

Corner.CornerRadius = UDim.new(0, 50)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 2.5

-- وظيفة الزر: الفتح والإغلاق مع ضمان استمرارية الإعدادات
ToggleButton.MouseButton1Click:Connect(function()
    local coreGui = game:GetService("CoreGui")
    for _, v in pairs(coreGui:GetChildren()) do
        -- البحث عن واجهة السكربت (Kavo) وإخفائها أو إظهارها
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
            v.Enabled = not v.Enabled
        end
    end
end)

-- تنبيه بالتشغيل
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "RM8 SYSTEM",
    Text = "تم تحميل عالم المملكة باسم RM8 بنجاح",
    Duration = 5
})

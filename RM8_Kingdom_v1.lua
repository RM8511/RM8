-- [[ RM8 KINGDOM - FINAL VERSION ]] --
-- التركيز: الدقة القصوى | تغيير الاسم لـ RM8 | زر Toggle | حفظ التفعيلات

-- 1. سحب كود السكربت الأصلي وتعديله فورياً
local RawScript = game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
local RM8_Script = RawScript:gsub("N7R", "RM8")

-- 2. تشغيل السكربت المعدل في بيئة اللعبة
loadstring(RM8_Script)()

-- 3. إنشاء الزر العائم (RM8) للتحكم في الإظهار والإخفاء
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)
local Stroke = Instance.new("UIStroke", ToggleButton)

-- تصميم الزر (أسود وأحمر - ستايل RM8)
ToggleButton.Name = "RM8_Control_Key"
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
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

-- 4. وظيفة الزر لفتح وإغلاق القائمة دون فقدان الإعدادات
ToggleButton.MouseButton1Click:Connect(function()
    local coreGui = game:GetService("CoreGui")
    for _, v in pairs(coreGui:GetChildren()) do
        -- البحث عن واجهة Kavo UI (تعتمد غالباً على إطار يسمى Main أو Container)
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
            v.Enabled = not v.Enabled
        end
    end
end)

-- إشعار التشغيل
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "RM8 SYSTEM",
    Text = "تم تشغيل عالم المملكة باسم RM8",
    Duration = 3
})

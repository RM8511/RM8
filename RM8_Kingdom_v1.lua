-- [[ RM8 KINGDOM - ORIGINAL LOAD ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- الألوان: أسود وأحمر (ستايل RM8)
local Window = Library.CreateLib("RM8 - عالم المملكة", {
    SchemeColor = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(10, 10, 10),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(15, 15, 15)
})

-- [[ الزر العائم يفتح ويقفل ]] --
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)
local Stroke = Instance.new("UIStroke", ToggleButton)

ToggleButton.Size = UDim2.new(0, 65, 0, 65)
ToggleButton.Position = UDim2.new(0, 15, 0.5, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "RM8" -- تم تغيير الاسم هنا
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.Draggable = true
ToggleButton.Active = true

Corner.CornerRadius = UDim.new(0, 50)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 2.5

-- وظيفة الفتح والإغلاق (إظهار وإخفاء القائمة)
ToggleButton.MouseButton1Click:Connect(function()
    Library:ToggleUI()
end)

-- [[ تحميل محتوى السكربت الأصلي مع تغيير المسميات ]] --
-- ملاحظة: السكربت الأصلي سيتم تحميله وتغيير واجهته لتعرض RM8
local MainTab = Window:NewTab("الرئيسية")
local MainSec = MainTab:NewSection("قائمة RM8 الجديدة")

MainSec:NewButton("تشغيل السكربت الأساسي", "تحميل المحتوى", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh"))()
end)

MainSec:NewButton("نسخ رابط GitHub", "RM8 Support", function()
    setclipboard("https://github.com/RM8511")
end)

-- يمكنك إضافة أي أزرار أخرى هنا من السكربت الأصلي

-- [[ RM8 KINGDOM - HAND-CRAFTED VERSION ]] --
-- كلمة السر: مدينة

-- استدعاء المكتبة
local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- إنشاء النافذة باسمك (RM8)
local Window = Kavo.CreateLib("عالم المملكة - RM8", "BloodTheme")

-- القسم الأساسي
local Tab = Window:NewTab("RM8 Main")
local Section = Tab:NewSection("التحكم العام")

Section:NewButton("تفعيل المميزات", "تشغيل سكربت عالم المملكة باسم RM8", function()
    -- هنا سحبت لك الكود الأصلي لكن مع إجبار تغيير الهوية
    local raw = game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
    local fixed = raw:gsub("N7R", "RM8"):gsub("n7r", "RM8")
    loadstring(fixed)()
end)

-- إنشاء الزر العائم (مقاس 40)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)

ToggleButton.Name = "RM8_Toggle"
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Position = UDim2.new(0, 15, 0.5, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "RM8"
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 12
ToggleButton.Draggable = true
ToggleButton.Active = true
Corner.CornerRadius = UDim.new(0, 50)

ToggleButton.MouseButton1Click:Connect(function()
    Kavo:ToggleUI()
end)

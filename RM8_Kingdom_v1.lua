-- [[ RM8 KINGDOM - THE MAIN BASE ]] --
-- الملكية: RM8 | هذا هو السكربت الأساسي المعتمد

-- 1. سحب وتعديل السكربت الأساسي (عالم المملكة)
local Success, RawData = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
end)

if Success then
    -- استبدال شامل لضمان ظهور اسمك في كل مكان بالسكربت
    local FinalCode = RawData:gsub("N7R", "RM8"):gsub("n7r", "RM8")
    loadstring(FinalCode)()
else
    warn("RM8 Error: Could not load base script.")
end

-- 2. الزر العائم (المقاس المطلوب: 40)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)
local Stroke = Instance.new("UIStroke", ToggleButton)

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
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 1.5

-- 3. وظيفة الفتح والإغلاق (Toggle) مع حفظ الإعدادات
ToggleButton.MouseButton1Click:Connect(function()
    local coreGui = game:GetService("CoreGui")
    for _, v in pairs(coreGui:GetChildren()) do
        -- إظهار وإخفاء واجهة السكربت دون إطفاء المميزات
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
            v.Enabled = not v.Enabled
        end
    end
end)

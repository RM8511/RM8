-- [[ RM8 KINGDOM - THE FINAL SOLUTION ]] --
-- كلمة السر: مدينة

-- 1. سحب وتطهير الكود من أي أثر لاسم N7R
local Success, RawData = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
end)

if Success then
    -- استبدال شامل لكل الاحتمالات (كبير، صغير، بمسافات)
    local CleanCode = RawData:gsub("N7R", "RM8")
                             :gsub("n7r", "RM8")
                             :gsub("N 7 R", "RM8")
                             :gsub('Title = "N7R"', 'Title = "RM8"')
                             :gsub('Name = "N7R"', 'Name = "RM8"')
    
    -- تشغيل النسخة النظيفة باسمك
    loadstring(CleanCode)()
else
    warn("RM8 Error: Connection Failed.")
end

-- 2. الزر العائم الصغير (مقاس 40)
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

-- وظيفة الفتح والإغلاق دون تصفير الإعدادات
ToggleButton.MouseButton1Click:Connect(function()
    local cg = game:GetService("CoreGui")
    for _, v in pairs(cg:GetChildren()) do
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
            v.Enabled = not v.Enabled
        end
    end
end)

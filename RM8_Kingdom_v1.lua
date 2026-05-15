-- [[ RM8 KINGDOM - FORCE UPDATE ]] --
-- كلمة السر: مدينة (لتفعيل التعديل الجذري)

local Success, RawData = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
end)

if Success then
    -- استبدال شامل بكل الأشكال الممكنة
    local FinalCode = RawData
    FinalCode = FinalCode:gsub("N7R", "RM8")
    FinalCode = FinalCode:gsub("n7r", "RM8")
    FinalCode = FinalCode:gsub("N 7 R", "RM8")
    
    -- تشغيل السكربت بعد التطهير الكامل من الاسم القديم
    loadstring(FinalCode)()
else
    warn("RM8 Error: Could not load script.")
end

-- إعداد الزر الصغير (40)
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

ToggleButton.MouseButton1Click:Connect(function()
    local coreGui = game:GetService("CoreGui")
    for _, v in pairs(coreGui:GetChildren()) do
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
            v.Enabled = not v.Enabled
        end
    end
end)

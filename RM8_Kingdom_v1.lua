-- [[ RM8 KINGDOM - ULTIMATE FORCE ]] --
-- كلمة السر: مدينة

local function StartRM8()
    -- 1. سحب الكود وتطهيره
    local Success, RawData = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh")
    end)

    if Success then
        -- استبدال شامل وعميق لكل النصوص
        local FinalCode = RawData:gsub("N7R", "RM8"):gsub("n7r", "RM8")
        
        -- تشغيل الكود المعدل
        local Exec, Error = loadstring(FinalCode)
        if Exec then
            Exec()
        else
            warn("RM8 Error in script execution: " .. Error)
        end
    end
end

-- 2. تشغيل النظام
StartRM8()

-- 3. الزر العائم (40) للفتح والإغلاق
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
local Corner = Instance.new("UICorner", ToggleButton)
local Stroke = Instance.new("UIStroke", ToggleButton)

ToggleButton.Name = "RM8_Mini_Toggle"
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
Stroke.Thickness = 2

ToggleButton.MouseButton1Click:Connect(function()
    local cg = game:GetService("CoreGui")
    for _, v in pairs(cg:GetChildren()) do
        -- هذا الكود يبحث عن أي واجهة (UI) مفتوحة ويقفلها/يفتحها
        if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container") or v.Name:find("Kavo")) then
            v.Enabled = not v.Enabled
        end
    end
end)

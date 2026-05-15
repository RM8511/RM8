-- RM8 FINAL VERSION (TOGGLE + RENAME)
local CoreGui = game:GetService("CoreGui")

-- دالة الإخفاء والإظهار
local function createToggle()
    local sg = Instance.new("ScreenGui", CoreGui)
    sg.Name = "RM8_Control"
    sg.DisplayOrder = 999999 -- عشان يظهر فوق السكريبت الأصلي

    local btn = Instance.new("TextButton", sg)
    btn.Size = UDim2.new(0, 60, 0, 30)
    btn.Position = UDim2.new(0, 10, 0.5, 0)
    btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0) -- لون برتقالي واضح
    btn.Text = "RM8: ON"
    btn.Draggable = true

    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v.Name ~= "RM8_Control" then
                v.Enabled = not v.Enabled
                btn.Text = v.Enabled and "RM8: ON" or "RM8: OFF"
            end
        end
    end)
end

-- دالة تغيير الاسم
spawn(function()
    while task.wait(1) do
        for _, v in pairs(CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8")
                end
            end
        end
    end
end)

createToggle()

-- تشغيل السكريبت الأصلي
loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh"))()

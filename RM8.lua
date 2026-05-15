-- RM8 ELITE PATCH (Final Solution)
local CoreGui = game:GetService("CoreGui")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- دالة التحكم الذكي (تصغير بدل إخفاء)
local function createToggle()
    local sg = Instance.new("ScreenGui", CoreGui)
    sg.Name = "RM8_Control"
    sg.DisplayOrder = 999999

    local btn = Instance.new("TextButton", sg)
    btn.Size = UDim2.new(0, 80, 0, 40)
    btn.Position = UDim2.new(0, 10, 0.5, 0)
    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- لون أزرق مميز
    btn.Text = "RM8: SHOW"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Draggable = true

    local hidden = false

    btn.MouseButton1Click:Connect(function()
        hidden = not hidden
        btn.Text = hidden and "RM8: HIDE" or "RM8: SHOW"
        
        -- نبحث عن الواجهات وننقل مكانها بدل ما نطفيها عشان ما يكرش
        for _, v in pairs(CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v.Name ~= "RM8_Control" and v.Name ~= "RobloxGui" then
                for _, child in pairs(v:GetChildren()) do
                    if child:IsA("Frame") or child:IsA("ImageLabel") then
                        child.Visible = not hidden -- نجرب الإخفاء الداخلي للقطع بدل الـ ScreenGui كامل
                    end
                end
            end
        end
    end)
end

-- دالة تغيير الاسم المستمرة
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

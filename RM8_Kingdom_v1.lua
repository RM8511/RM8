-- [[ RM8 KINGDOM v1 - ENCRYPTED & PROTECTED ]] --
-- WARNING: This script is protected and owned by RM8. Unauthorized editing is impossible.

local _0xRM8 = "RM8_v1" -- الرمز السري لو احتجته مستقبلاً
local L_1_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

-- تشغيل الكود المشفر (المحمي)
local RM8_PROTECT = function(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d%d%d%d%d%d', function(x)
        local r=0
        for i=1,8 do r=r+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(r)
    end))
end

-- الكود الأساسي تم تشفيره لضمان عدم التعديل من المتطفلين
loadstring(RM8_PROTECT("bG9hZHN0cmluZyhnYW1lOkh0dHBHZXQoImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS94SGVwdGMvS2F2by1VSS1MaWJyYXJ5L21haW4vc291cmNlLmx1YSIpKSgpCmxvY2FsIFdpbmRvdyA9IExpYnJhcnkuQ3JlYXRlTGliKCLYudin2YTZhSDYp9mE2YXZhNmD2KkgfCBSTTgiLCB7U2NoZW1lQ29sb3IgPSBDb2xvcjMuZnJvbVJHQigyNTUsIDAsIDApfSk="))()

-- إضافة الزر العائم (RM8)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 15, 0.5, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "RM8"
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Draggable = true
ToggleButton.Active = true
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 50)
ToggleButton.MouseButton1Click:Connect(function() 
    for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v:IsA("ScreenGui") and v:FindFirstChild("Main") then v.Enabled = not v.Enabled end
    end
end)

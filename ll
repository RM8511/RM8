-- ==========================================
-- Anti-Ban Protection System with GUI Counter
-- Repository: RM8 / File: ll
-- ==========================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- 1. إنشاء واجهة العداد (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RM8_ProtectionGui"
ScreenGui.ResetOnSpawn = false

local success = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 70)
MainFrame.Position = UDim2.new(0.02, 0, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 5)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🛡️ نظام حماية RM8"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = MainFrame

local CounterLabel = Instance.new("TextLabel")
CounterLabel.Size = UDim2.new(1, 0, 0, 30)
CounterLabel.Position = UDim2.new(0, 0, 0, 32)
CounterLabel.BackgroundTransparency = 1
CounterLabel.Text = "الباندات المحجوبة: 0"
CounterLabel.TextColor3 = Color3.fromRGB(85, 255, 127)
CounterLabel.TextSize = 16
CounterLabel.Font = Enum.Font.SourceSansBold
CounterLabel.Parent = MainFrame

-- 2. عداد التقارير الممنوعة
local blockedCount = 0

local function incrementBlocked()
    blockedCount = blockedCount + 1
    CounterLabel.Text = "الباندات المحجوبة: " .. tostring(blockedCount)
end

-- 3. اعتراض وحجب التقارير الموجهة للسيرفر (Hooking)
local gmt = getrawmetatable(game)
local oldNamecall = gmt.__namecall
setreadonly(gmt, false)

gmt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if method == "FireServer" or method == "InvokeServer" then
        local remoteName = tostring(self):lower()
        
        if remoteName:find("ban") or remoteName:find("detect") or remoteName:find("cheat") or remoteName:find("log") or remoteName:find("flag") then
            incrementBlocked()
            return nil
        end
    end

    return oldNamecall(self, ...)
end)

setreadonly(gmt, true)

print("[RM8 Protection] تم تفعيل نظام الحماية والعداد المباشر بنجاح.")

-- [[ RM8 KINGDOM v1 - SECURE KEY SYSTEM ]] --

local CorrectKey = "RM8_v1" -- هذا هو الرمز السري الجديد

-- [[ واجهة التحقق من المفتاح ]] --
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", MainFrame)
local KeyInput = Instance.new("TextBox", MainFrame)
local SubmitBtn = Instance.new("TextButton", MainFrame)
local Corner = Instance.new("UICorner", MainFrame)
local Stroke = Instance.new("UIStroke", MainFrame)

MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Corner.CornerRadius = UDim.new(0, 12)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 2

Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "RM8 SYSTEM | أدخل الرمز"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

KeyInput.Size = UDim2.new(0, 260, 0, 40)
KeyInput.Position = UDim2.new(0.5, -130, 0.4, 0)
KeyInput.PlaceholderText = "الرمز هنا..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

SubmitBtn.Size = UDim2.new(0, 120, 0, 35)
SubmitBtn.Position = UDim2.new(0.5, -60, 0.75, 0)
SubmitBtn.Text = "دخول"
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

-- [[ وظيفة التحقق وتشغيل السكربت ]] --
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        Title.Text = "تم التحقق.. جاري التشغيل"
        Title.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1)
        ScreenGui:Destroy()
        
        -- تشغيل السكربت الأساسي
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("RM8 KINGDOM - عالم المملكة", {
            SchemeColor = Color3.fromRGB(255, 0, 0),
            Background = Color3.fromRGB(0, 0, 0),
            Header = Color3.fromRGB(10, 10, 10),
            TextColor = Color3.fromRGB(255, 255, 255),
            ElementColor = Color3.fromRGB(15, 15, 15)
        })

        -- تابات السكربت
        local MainTab = Window:NewTab("الرئيسية")
        local LibTab = Window:NewTab("مكتبة السكربتات")

        local MainSec

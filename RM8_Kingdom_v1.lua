-- [[ RM8 SYSTEM - FINAL FIXED VERSION ]] --
local CorrectKey = "RM8_v1"

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", MainFrame)
local KeyInput = Instance.new("TextBox", MainFrame)
local SubmitBtn = Instance.new("TextButton", MainFrame)

-- تصميم بسيط وسريع عشان نضمن التشغيل
MainFrame.Size = UDim2.new(0, 300, 0, 160)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "RM8 SYSTEM | ENTER KEY"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

KeyInput.Size = UDim2.new(0, 220, 0, 35)
KeyInput.Position = UDim2.new(0.5, -110, 0.4, 0)
KeyInput.PlaceholderText = "الرمز هنا..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

SubmitBtn.Size = UDim2.new(0, 100, 0, 35)
SubmitBtn.Position = UDim2.new(0.5, -50, 0.75, 0)
SubmitBtn.Text = "دخول"
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

SubmitBtn.MouseButton1Click:Connect(function()
    -- استخدام string.match عشان نتفادى أي مسافات زائدة
    if KeyInput.Text == CorrectKey or KeyInput.Text:match(CorrectKey) then
        Title.Text = "تم الدخول!"
        Title.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(0.5)
        ScreenGui:Destroy()
        
        -- تشغيل المكتبة (Kavo)
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("RM8 KINGDOM", {
            SchemeColor = Color3.fromRGB(255, 0, 0),
            Background = Color3.fromRGB(0, 0, 0),
            Header = Color3.fromRGB(10, 10, 10),
            TextColor = Color3.fromRGB(255, 255, 255),
            ElementColor = Color3.fromRGB(15, 15, 15)
        })
        local Tab = Window:NewTab("الرئيسية")
        local Sec = Tab:NewSection("تم التشغيل بنجاح")
        Sec:NewButton("RM8 GitHub", "Copy", function() setclipboard("https://github.com/RM8511") end)
    else
        Title.Text = "رمز غلط يا بطل!"
        wait(1)
        Title.Text = "RM8 SYSTEM | ENTER KEY"
    end
end)

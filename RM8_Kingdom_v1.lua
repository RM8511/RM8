-- [[ RM8 KINGDOM v1 - FIXED & SECURE ]] --

local CorrectKey = "RM8_v1"

-- [[ واجهة نظام المفتاح ]] --
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", MainFrame)
local KeyInput = Instance.new("TextBox", MainFrame)
local SubmitBtn = Instance.new("TextButton", MainFrame)

MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true -- تقدر تحرك النافذة لو ضايقتك

Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "RM8 SYSTEM | ENTER KEY"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

KeyInput.Size = UDim2.new(0, 240, 0, 40)
KeyInput.Position = UDim2.new(0.5, -120, 0.45, 0)
KeyInput.PlaceholderText = "RM8_v1"
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

SubmitBtn.Size = UDim2.new(0, 150, 0, 40)
SubmitBtn.Position = UDim2.new(0.5, -75, 0.75, 0)
SubmitBtn.Text = "LOGIN"
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold

-- [[ وظيفة التحقق ]] --
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        Title.Text = "SUCCESS!"
        Title.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(0.5)
        ScreenGui:Destroy()
        
        -- [[ تشغيل السكربت بمكتبة بديلة وشغالة ]] --
        local success, err = pcall(function()
            local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
            
            local Window = Library:CreateWindow({
                Name = "RM8 KINGDOM v1",
                LoadingTitle = "RM8 SYSTEM LOADING...",
                LoadingSubtitle = "by RM8",
                ConfigurationSaving = { Enabled = false }
            })

            local Tab = Window:CreateTab("Main", 4483362458)
            Tab:CreateButton({
                Name = "Copy Discord/GitHub",
                Callback = function() setclipboard("https://github.com/RM8511") end,
            })
            
            local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
            ScriptsTab:CreateButton({
                Name = "Run Westbound v1.5",
                Callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RM8511/RM8/main/RM8_westbound_v1.5.lua"))()
                end,
            })
        end)
        
        if not success then
            warn("خطأ في تحميل المكتبة: " .. err)
        end
    else
        Title.Text = "WRONG KEY!"
        wait(1)
        Title.Text = "RM8 SYSTEM | ENTER KEY"
    end
end)

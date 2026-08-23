--[========================================================--
    Central Kansas Roleplay: Auto Drive Loop | RM8511
--========================================================-]

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if _G.KansasCarRunning then
    _G.KansasCarRunning = false
    task.wait(0.3)
end
_G.KansasCarRunning = true

local playerGui = player:WaitForChild("PlayerGui")
pcall(function()
    if playerGui:FindFirstChild("CK_CarUI") then
        playerGui.CK_CarUI:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CK_CarUI"
ScreenGui.Parent = playerGui
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.Size = UDim2.new(0, 160, 0, 50)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleBtn.Text = "START AUTO DRIVE"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize, ToggleBtn.Font = 13, Enum.Font.GothamBold
ToggleBtn.Active, ToggleBtn.Draggable = true, true

local UICorner = Instance.new("UICorner", ToggleBtn)
UICorner.CornerRadius = UDim.new(0, 8)
local UIStroke = Instance.new("UIStroke", ToggleBtn)
UIStroke.Color = Color3.fromRGB(0, 255, 120)
UIStroke.Thickness = 2

local driving = false
ToggleBtn.MouseButton1Click:Connect(function()
    driving = not driving
    
    if driving then
        ToggleBtn.Text = "STOP AUTO DRIVE"
        UIStroke.Color = Color3.fromRGB(255, 50, 50)
        
        task.spawn(function()
            while driving and _G.KansasCarRunning do
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local seat = player.Character.Humanoid.SeatPart
                    
                    if seat and seat:IsA("VehicleSeat") then
                        -- 1. المشي لقدام بأقصى سرعة على خط مستقيم لمدة 3 ثواني
                        seat.Throttle = 1
                        task.wait(3)
                        
                        if not driving then break end
                        
                        -- 2. إرجاع السيارة للوراء شوي
                        seat.Throttle = -1
                        task.wait(1.5)
                        
                        seat.Throttle = 0
                        task.wait(0.5)
                    else
                        -- تنبيه لو اللاعب مو راكب السيارة
                        ToggleBtn.Text = "GET IN CAR!"
                        task.wait(1)
                        ToggleBtn.Text = "STOP AUTO DRIVE"
                    end
                end
                task.wait(0.2)
            end
            -- إيقاف المحرك عند الخروج
            pcall(function()
                local seat = player.Character.Humanoid.SeatPart
                if seat and seat:IsA("VehicleSeat") then
                    seat.Throttle = 0
                end
            end)
        end)
    else
        ToggleBtn.Text = "START AUTO DRIVE"
        UIStroke.Color = Color3.fromRGB(0, 255, 120)
        pcall(function()
            local seat = player.Character.Humanoid.SeatPart
            if seat and seat:IsA("VehicleSeat") then
                seat.Throttle = 0
            end
        end)
    end
end)

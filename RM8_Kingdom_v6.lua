print("--------------------------------------------------")
print("المطور القثردي🇸🇦 /المبرمج ابو حديده🗞")
print("--------------------------------------------------")

local success, err = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/Z3m/refs/heads/main/Soon"))()
end)

if success then
    task.spawn(function()
        task.wait(1)
        local coreGui = game:GetService("CoreGui")
        
        -- فحص سريع ومباشر على القوائم الرئيسية فقط لمنع اللاق نهائياً
        for _, gui in pairs(coreGui:GetChildren()) do
            if gui:IsA("ScreenGui") and not gui.Name:find("Roblox") then
                for _, obj in pairs(gui:GetDescendants()) do
                    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                        if obj.Text:find("N7R") or obj.Text:find("n7r") then
                            obj.Text = obj.Text:gsub("N7R", "RM8")
                            obj.Text = obj.Text:gsub("n7r", "RM8")
                        end
                    end
                end
            end
        end
    end)
else
    warn("[RM8 Core Error]: " .. tostring(err))
end

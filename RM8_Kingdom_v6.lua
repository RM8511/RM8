print("--------------------------------------------------")
print("المطور القثردي🇸🇦 /المبرمج ابو حديده🗞")
print("--------------------------------------------------")

local function CleanAndRename()
    local coreGui = game:GetService("CoreGui")
    for _, obj in pairs(coreGui:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            if obj.Text:find("N7R") or obj.Text:find("n7r") then
                obj.Text = obj.Text:gsub("N7R", "RM8")
                obj.Text = obj.Text:gsub("n7r", "RM8")
            end
        end
    end
end

local success, err = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/Z3m/refs/heads/main/Soon"))()
end)

if success then
    task.spawn(function()
        for i = 1, 5 do
            task.wait(1)
            CleanAndRename()
        end
    end)
else
    warn("[RM8 Core Error]: " .. tostring(err))
end

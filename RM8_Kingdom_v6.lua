print("--------------------------------------------------")
print("المطور القثردي🇸🇦 /المبرمج ابو حديده🗞")
print("--------------------------------------------------")

local function CleanAndRename()
    for _, obj in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            if obj.Text:find("N7R") or obj.Text:find("n7r") then
                obj.Text = obj.Text:gsub("N7R", "RM8")
                obj.Text = obj.Text:gsub("n7r", "RM8")
            end
        end
    end
end

game:GetService("CoreGui").DescendantAdded:Connect(function(descendant)
    if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
        task.wait(0.1)
        if descendant.Text:find("N7R") or descendant.Text:find("n7r") then
            descendant.Text = descendant.Text:gsub("N7R", "RM8")
            descendant.Text = descendant.Text:gsub("n7r", "RM8")
        end
    end
end)

local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/Z3m/refs/heads/main/Soon"))()
end)

if success then
    task.spawn(function()
        for i = 1, 10 do
            CleanAndRename()
            task.wait(0.5)
        end
    end)
else
    warn("[RM8 Core Error]: " .. tostring(err))
end

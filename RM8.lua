-- RM8 Final Force Patch
local function forceRename()
    local pGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    local cGui = game:GetService("CoreGui")

    local function scan(root)
        for _, v in pairs(root:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                -- إذا وجدنا الاسم القديم، نقوم بمسحه وتغييره
                if v.Text:find("N7R") or v.Text:find("عالم المملكة") then
                    v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8 HUB")
                    
                    -- تأكيد التغيير بقوة
                    v:GetPropertyChangedSignal("Text"):Connect(function()
                        v.Text = v.Text:gsub("N7R", "RM8"):gsub("عالم المملكة", "RM8 HUB")
                    end)
                end
            end
        end
    end

    spawn(function()
        while task.wait(0.5) do
            scan(cGui)
            scan(pGui)
        end
    end)
end

-- تشغيل دالة التغيير القسري
forceRename()

-- تشغيل السكريبت الأصلي
loadstring(game:HttpGet("https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh"))()

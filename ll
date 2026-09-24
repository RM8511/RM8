-- ==========================================
-- Obfuscated Luau Protection Framework
-- Encrypted & Protected Source
-- ==========================================

local _L = {
    [1] = string.char(84, 119, 101, 101, 110, 83, 101, 114, 118, 105, 99, 101),
    [2] = string.char(80, 108, 97, 121, 101, 114, 115),
    [3] = string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116),
    [4] = string.char(67, 70, 114, 97, 109, 101)
}

local _S = function(i) return game:GetService(_L[i]) end
local _TS = _S(1)
local _PL = _S(2)
local _LP = _PL.LocalPlayer

local Protection = {}

Protection.SafeTween = unpack({function(targetCFrame, speed)
    local char = _LP.Character or _LP.CharacterAdded:Wait()
    local hrp = char and char:FindFirstChild(_L[3])
    if not hrp then return end
    
    local dist = (hrp.Position - targetCFrame.Position).Magnitude
    local tTime = dist / (speed or 50)
    
    local tInfo = TweenInfo.new(tTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local tw = _TS:Create(hrp, tInfo, {[_L[4]] = targetCFrame})
    tw:Play()
    tw.Completed:Wait()
end})

Protection.StartSafeLoop = unpack({function(actionCallback, minDelay, maxDelay)
    task.spawn(function()
        while task.wait() do
            local ok, err = pcall(actionCallback)
            if not ok then end
            
            local rnd = math.random((minDelay or 0.2) * 1000, (maxDelay or 0.6) * 1000) / 1000
            task.wait(rnd)
        end
    end)
end})

-- Execution Loop Example
Protection.StartSafeLoop(function()
    -- الأوامر المراد تكرارها توضع هنا
end, 0.3, 0.7)

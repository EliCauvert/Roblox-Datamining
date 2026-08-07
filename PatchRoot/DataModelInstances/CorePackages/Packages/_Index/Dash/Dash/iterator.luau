-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)

return function(p0) --[[ line: 13 | named "iterator" ]]
	return if typeof(p0) == "function" then p0 elseif typeof(p0) == "table" then if #p0 > 0 then ipairs(p0) else pairs(p0) else nil
end
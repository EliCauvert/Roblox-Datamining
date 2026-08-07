-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local string = require(script.Parent.Parent.Parent.LuauPolyfill).String

return function(p0) --[[ line: 6 ]]
	-- upvalues: string (ref)
	return "\"\\u" .. string.slice("0000" .. string.format("%x", p0), -4):upper() .. "\""
end
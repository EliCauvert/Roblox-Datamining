-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

local getTextSizeModule = require(script.Parent.GetTextSize)

return function(p0, p1, p2, p3, p4) --[[ line: 6 | named "getTextHeight" ]]
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p0, p2, p1, Vector2.new(p3, math.min(10000, p4 or 10000))).Y
end
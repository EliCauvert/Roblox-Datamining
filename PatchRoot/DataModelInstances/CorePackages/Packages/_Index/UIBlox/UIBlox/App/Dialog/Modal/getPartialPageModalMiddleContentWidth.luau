-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:53 2026 Pacific Standard Time.

local getModalWindowWidthModule = require(script.Parent.getModalWindowWidth)

return function(p0, p1) --[[ line: 9 | named "getPartialPageModalMiddleContentWidth" ]]
	-- upvalues: getModalWindowWidthModule (ref)
	return getModalWindowWidthModule(p0) - 2 * (p1 or 24)
end
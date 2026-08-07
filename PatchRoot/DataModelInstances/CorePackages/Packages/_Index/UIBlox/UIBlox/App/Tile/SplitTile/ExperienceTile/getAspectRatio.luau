-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

local aspectRatioModeModule = require(script.Parent.Enum.AspectRatioMode)
local t = {
	[aspectRatioModeModule.Wide] = 0.5625,
	[aspectRatioModeModule.Square] = 1
}

return function(p0) --[[ line: 14 | named "getAspectRatio" ]]
	-- upvalues: t (ref)
	local var2 = t[p0]
	
	if not var2 then
		error("Unkown aspect ratio " .. tostring(p0))
	end
	return var2
end
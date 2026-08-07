-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p0, p1, p2) --[[ line: 29 | named "alignedVertically" ]]
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var2 = toRectModule(p0)
	local var3 = toRectModule(p1)
	
	return if p2 == Enum.VerticalAlignment.Top then returnValueModule(var2.Min.Y == var3.Min.Y, "", "") elseif p2 == Enum.VerticalAlignment.Center then returnValueModule(((var2.Min + var2.Max) / 2).Y == ((var3.Min + var3.Max) / 2).Y, "", "") elseif p2 == Enum.VerticalAlignment.Bottom then returnValueModule(var2.Max.Y == var3.Max.Y, "", "") else returnValueModule(false, "Invalid VerticalAlignment!")
end
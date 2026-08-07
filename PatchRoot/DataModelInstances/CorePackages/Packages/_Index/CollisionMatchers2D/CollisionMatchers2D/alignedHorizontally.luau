-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p0, p1, p2) --[[ line: 28 | named "alignedHorizontally" ]]
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var2 = toRectModule(p0)
	local var3 = toRectModule(p1)
	
	return if p2 == Enum.HorizontalAlignment.Left then returnValueModule(var2.Min.X == var3.Min.X, "", "") elseif p2 == Enum.HorizontalAlignment.Center then returnValueModule(((var2.Min + var2.Max) / 2).X == ((var3.Min + var3.Max) / 2).X, "", "") elseif p2 == Enum.HorizontalAlignment.Right then returnValueModule(var2.Max.X == var3.Max.X, "", "") else returnValueModule(false, "Invalid horizontal alignment!")
end
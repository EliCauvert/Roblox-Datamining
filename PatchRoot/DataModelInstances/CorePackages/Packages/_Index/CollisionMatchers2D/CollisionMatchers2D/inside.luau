-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

local function _(p0, p1) --[[ line: 4 | named "isPointInside" ]]
	return p1.Min.X <= p0.X and (p0.X <= p1.Max.X and (p1.Min.Y <= p0.Y and p0.Y <= p1.Max.Y))
end

return function(p2, p3) --[[ line: 26 | named "inside" ]]
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var2 = toRectModule(p2)
	local var3 = toRectModule(p3)
	local min = var2.Min
	local var4 = var3.Min.X <= min.X and (min.X <= var3.Max.X and (var3.Min.Y <= min.Y and min.Y <= var3.Max.Y))
	
	if var4 then
		local max = var2.Max
		var4 = var3.Min.X <= max.X and (max.X <= var3.Max.X and (var3.Min.Y <= max.Y and max.Y <= var3.Max.Y))
	end
	return returnValueModule(var4, "Is inside the element", "Is not inside the element")
end
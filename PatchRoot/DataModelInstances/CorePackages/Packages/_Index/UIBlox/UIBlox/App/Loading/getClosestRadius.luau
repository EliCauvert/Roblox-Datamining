-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:55 2026 Pacific Standard Time.

local radius = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.Radius

return function(p0, p1) --[[ line: 9 | named "getClosestRadius" ]]
	-- upvalues: radius (ref)
	if not p1 or p1 == UDim.new(0, 0) then
		return radius.None
	elseif p1.Scale >= 0.5 then
		return radius.Circle
	end
	local var0 = nil
	local var1 = 1e999
	
	for i, v in {
		[radius.None] = 0,
		[radius.XSmall] = 2,
		[radius.Small] = p0.Small,
		[radius.Medium] = p0.Medium,
		[radius.Large] = p0.XLarge,
		[radius.Circle] = p0.Circle
	} do
		local absValue = math.abs(p1.Offset - v)
		
		if absValue < var1 then
			var1 = absValue
			var0 = i
		end
	end
	return var0
end
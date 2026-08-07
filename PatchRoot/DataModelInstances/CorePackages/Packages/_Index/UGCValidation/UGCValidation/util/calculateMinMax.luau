-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:37 2026 Pacific Standard Time.

local function _(p0, p1, p2) --[[ line: 5 | named "compare" ]]
	return if p0 and p1 then Vector3.new(p2(p0.X, p1.X), p2(p0.Y, p1.Y), p2(p0.Z, p1.Z)) else p0 or p1
end

return function(a, b, p3, p4) --[[ line: 14 | named "calculateMinMax" ]]
	local min = math.min
	local var0 = if a and p3 then Vector3.new(min(a.X, p3.X), min(a.Y, p3.Y), min(a.Z, p3.Z)) else a or p3
	local max = math.max
	
	if b and p4 then
		return var0, Vector3.new(max(b.X, p4.X), max(b.Y, p4.Y), max(b.Z, p4.Z))
	end
	return var0, b or p4
end
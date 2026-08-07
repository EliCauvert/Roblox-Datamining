-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 2 | named "slice" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local p0Count = #p0
	p1 = p1 or 1
	p2 = p2 or p0Count
	assert(p1 <= p2, "start index must be less than or equal to end index")
	local t = {}
	local var3 = 1
	
	for i = math.max(1, p1), math.min(p2, p0Count) do
		t[var3] = p0[i]
		var3 += 1
	end
	return t
end
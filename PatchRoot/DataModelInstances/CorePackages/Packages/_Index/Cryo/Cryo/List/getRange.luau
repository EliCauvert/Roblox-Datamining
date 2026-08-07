-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 5 | named "getRange" ]]
	assert(p1 <= p2, "startIndex must be less than or equal to endIndex")
	local t = {}
	local var1 = 1
	
	for i = math.max(1, p1), math.min(#p0, p2) do
		t[var1] = p0[i]
		var1 += 1
	end
	return t
end
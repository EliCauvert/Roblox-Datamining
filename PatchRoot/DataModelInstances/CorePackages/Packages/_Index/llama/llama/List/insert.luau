-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

return function(p0, p1, ...) --[[ line: 2 | named "insert" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local p0Count = #p0
	assert(p1 >= 1 and p1 <= p0Count + 1, "index must be in bounds of list")
	local t = {}
	local var3 = 1
	
	for i_1 = 1, p0Count do
		if i_1 ~= p1 then
			t[var3] = p0[i_1]
			var3 += 1
			continue
		end
		for i = 1, select("#", ...) do
			t[var3] = select(i, ...)
			var3 += 1
		end
	end
	return t
end
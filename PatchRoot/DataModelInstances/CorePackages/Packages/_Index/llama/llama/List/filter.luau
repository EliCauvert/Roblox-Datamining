-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 2 | named "filter" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	local t = {}
	local var3 = 1
	
	for i = 1, #p0 do
		if p1(p0[i], i) then
			t[var3] = p0[i]
			var3 += 1
		end
	end
	return t
end
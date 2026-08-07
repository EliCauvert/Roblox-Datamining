-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

return function(p0) --[[ line: 2 | named "values" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local var2 = 1
	
	for i, v in pairs(p0) do
		t[var2] = v
		var2 += 1
	end
	return t
end
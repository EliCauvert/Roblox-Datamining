-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

return function(value) --[[ line: 2 | named "toSet" ]]
	local var0 = type(value)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	
	for i = 1, #value do
		t[value[i]] = true
	end
	return t
end
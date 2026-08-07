-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 2 | named "find" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	
	for i = p2 or #p0, 1, -1 do
		if not p1(p0[i], i) then
			continue
		end
		return i
	end
	return nil
end
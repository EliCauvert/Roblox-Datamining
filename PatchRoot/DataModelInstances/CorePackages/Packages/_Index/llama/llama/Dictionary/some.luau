-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 2 | named "some" ]]
	local var0 = type(p1)
	assert(var0 == "function", "expected a function for second argument, got " .. var0)
	
	for i, v in pairs(p0) do
		if p1(v, i) then
			return true
		end
	end
	return false
end
-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

return function(p0) --[[ line: 4 ]]
	assert(type(p0) == "string", "Symbols must be created using a string name!")
	local var0 = newproxy(true)
	
	getmetatable(var0).__tostring = function() --[[ line: 10 ]]
		-- upvalues: p0 (ref)
		return p0
	end
	
	return var0
end
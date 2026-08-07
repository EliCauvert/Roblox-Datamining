-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

return function() --[[ line: 2 | named "createNextOrder" ]]
	local var0 = 0
	
	return function() --[[ line: 5 ]]
		-- upvalues: var0 (write)
		var0 += 1
		
		return var0
	end
end
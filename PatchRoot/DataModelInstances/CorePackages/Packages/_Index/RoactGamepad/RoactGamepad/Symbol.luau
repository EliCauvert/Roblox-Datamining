-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

return {
	named = function(p0) --[[ line: 16 ]]
		assert(type(p0) == "string", "Symbols must be created using a string name!")
		local var0 = newproxy(true)
		local var1 = ("Symbol(%s)"):format(p0)
		
		getmetatable(var0).__tostring = function() --[[ line: 23 ]]
			-- upvalues: var1 (ref)
			return var1
		end
		
		return var0
	end
}
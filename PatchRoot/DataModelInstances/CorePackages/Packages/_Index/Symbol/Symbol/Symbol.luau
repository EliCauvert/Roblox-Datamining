-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

return {
	new = function(p0) --[[ line: 29 ]]
		local var0 = newproxy(true)
		local var1 = if p0 then ("Symbol(%s)"):format(p0) else "Symbol()"
		
		getmetatable(var0).__tostring = function() --[[ line: 37 ]]
			-- upvalues: var1 (write)
			return var1
		end
		
		return var0
	end
}
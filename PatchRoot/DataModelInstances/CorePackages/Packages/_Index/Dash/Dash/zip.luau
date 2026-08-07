-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 10 | named "zip" ]]
	local var0 = nil
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	return function() --[[ line: 12 ]]
		-- upvalues: var0 (write), var2 (write), p0 (ref), var1 (write), var3 (write), p1 (ref)
		local var4, var5 = next(p0, var0)
		var0 = var4
		var2 = var5
		local var6, var7 = next(p1, var1)
		var1 = var6
		var3 = var7
		
		if var2 and var3 then
			return var2, var3
		end
		return nil
	end
end
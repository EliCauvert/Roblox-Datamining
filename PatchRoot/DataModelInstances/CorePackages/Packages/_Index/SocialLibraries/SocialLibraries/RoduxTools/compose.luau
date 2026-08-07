-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

return function(...) --[[ line: 4 ]]
	local list = { ... }
	local listCount = #list
	
	if listCount == 0 then
		return function(p0) --[[ line: 9 ]]
			return p0
		end
	end
	local var2 = list[1]
	
	for i = 2, listCount do
		local var3 = list[i]
		local var4 = var2
		
		var2 = function(...) --[[ line: 18 ]]
			-- upvalues: var4 (ref), var3 (ref)
			return var4(var3(...))
		end
	end
	return var2
end
-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(...) --[[ line: 14 | named "chain" ]]
	local list = { ... }
	local listCount = #list
	local var2 = 1
	
	return function() --[[ line: 18 ]]
		-- upvalues: var2 (write), listCount (ref), list (ref)
		while var2 <= listCount do
			local list_1 = { list[var2]() }
			
			if list_1[1] == nil then
				var2 += 1
				continue
			end
			return table.unpack(list_1)
		end
		return nil
	end
end
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
return function(...)
	local list = { ... }
	local listCount = #list
	local var1 = 1
	
	return function()
		-- upvalues: var1 (write), listCount (ref), list (ref)
		while var1 <= listCount do
			local list_1 = { list[var1]() }
			
			if list_1[1] == nil then
				var1 += 1
				continue
			end
			return table.unpack(list_1)
		end
		return nil
	end
end
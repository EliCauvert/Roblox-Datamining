return function(...)
	local list = { ... }
	local CountList = #list
	local Count = 1
	
	return function()
		-- upvalues: Count (ref), CountList (copy), list (copy)
		local list1 = nil
		while Count <= CountList do
			list1 = { list[Count]() }
			
			if list1[1] ~= nil then
				return table.unpack(list1)
			end
			Count += 1
		end
		return nil
	end
end
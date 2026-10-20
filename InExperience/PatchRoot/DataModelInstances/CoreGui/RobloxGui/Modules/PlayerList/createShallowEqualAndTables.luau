return function(List)
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	return function(List, List1): boolean
		-- upvalues: t (copy)
		for i, value in List do
			local Entry = List1[i]
			
			if not t[i] then
				if value ~= Entry then
					return false
				end
				continue
			end
			if typeof(value) ~= "table" or typeof(Entry) ~= "table" then
				return false
			end
			for i1, value1 in value do
				if value1 ~= Entry[i1] then
					return false
				end
			end
			for i2, _ in Entry do
				if value[i2] == nil then
					return false
				end
			end
		end
		for i3, _ in List1 do
			if List[i3] == nil then
				return false
			end
		end
		return true
	end
end
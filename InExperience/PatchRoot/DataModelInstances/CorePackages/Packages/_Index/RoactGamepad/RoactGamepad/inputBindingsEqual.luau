return function(List, List1): boolean --[[ Line: 1 | Named "inputBindingsEqual" ]]
	if List == List1 then
		return true
	end
	for i, value in pairs(List) do
		local Entry = List1[i]
		
		if Entry == nil then
			return false
		end
		if value.kind ~= Entry.kind or value.keyCode ~= Entry.keyCode or value.action ~= Entry.action then
			return false
		end
		local Meta = value.meta
		local Meta1 = Entry.meta
		
		if Meta ~= Meta1 then
			if typeof(Meta) ~= "table" or typeof(Meta1) ~= "table" then
				return false
			end
			for i1, value1 in pairs(Meta) do
				if value1 ~= Meta1[i1] then
					return false
				end
			end
			for i2 in pairs(Meta1) do
				if Meta[i2] == nil then
					return false
				end
			end
		end
	end
	for i3 in pairs(List1) do
		if List[i3] == nil then
			return false
		end
	end
	return true
end
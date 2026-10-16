return function(List, List1): boolean --[[ Line: 8 | Named "shallowEqual" ]]
	if List == List1 then
		return true
	end
	if typeof(List) ~= "table" or typeof(List1) ~= "table" or #List ~= #List1 then
		return false
	end
	if List == nil or List1 == nil then
		return false
	end
	for i, value in List do
		if List1[i] ~= value then
			return false
		end
	end
	for i1, value1 in List1 do
		if List[i1] ~= value1 then
			return false
		end
	end
	return true
end
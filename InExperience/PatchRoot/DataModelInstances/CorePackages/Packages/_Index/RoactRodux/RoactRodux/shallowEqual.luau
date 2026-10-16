return function(List, List1): boolean --[[ Line: 1 | Named "shallowEqual" ]]
	if List == nil then
		return List1 == nil
	end
	if List1 == nil then
		return List == nil
	end
	for i, value in pairs(List) do
		if value ~= List1[i] then
			return false
		end
	end
	for i1, value1 in pairs(List1) do
		if value1 ~= List[i1] then
			return false
		end
	end
	return true
end
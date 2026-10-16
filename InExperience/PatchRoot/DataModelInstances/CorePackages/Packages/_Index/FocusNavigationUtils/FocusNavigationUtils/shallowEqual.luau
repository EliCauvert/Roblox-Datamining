return function(List, List1): boolean --[[ Line: 4 | Named "shallowEqual" ]]
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
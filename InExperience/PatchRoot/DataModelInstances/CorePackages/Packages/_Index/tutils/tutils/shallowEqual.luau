return function(List, List1, p1): boolean --[[ Line: 5 ]]
	if not List or not List1 then
		return false
	end
	if List == List1 then
		return true
	end
	if not p1 then
		p1 = {}
	end
	for i, value in pairs(List) do
		if List1[i] ~= value and not p1[i] then
			return false
		end
	end
	for i1, value1 in pairs(List1) do
		if List[i1] ~= value1 and not p1[i1] then
			return false
		end
	end
	return true
end
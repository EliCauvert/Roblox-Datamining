return function(List, List1): boolean
	if List == nil or typeof(List) ~= "table" then
		return false
	end
	local t = {}
	
	for _, value in List1 do
		t[value] = true
	end
	for _, value1 in List1 do
		if List[value1] == nil or typeof(List[value1]) ~= "number" then
			return false
		end
	end
	for i, _ in List do
		if not t[i] then
			return false
		end
	end
	return true
end
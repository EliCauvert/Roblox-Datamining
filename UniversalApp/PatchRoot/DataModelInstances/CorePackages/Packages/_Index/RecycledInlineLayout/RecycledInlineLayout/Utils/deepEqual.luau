local function deepEqual(List, List1): boolean
	-- upvalues: deepEqual (copy)
	if List == List1 then
		return true
	end
	if type(List) ~= "table" or type(List1) ~= "table" then
		return false
	end
	for i, value in List do
		if not deepEqual(value, List1[i]) then
			return false
		end
	end
	for i1 in List1 do
		if List[i1] == nil then
			return false
		end
	end
	return true
end

return deepEqual
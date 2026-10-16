local function deepEqual(List, List1, p1): boolean --[[ Line: 7 ]]
	-- upvalues: deepEqual (copy)
	if List == List1 then
		return true
	end
	local ValueType = type(List)
	
	if ValueType ~= type(List1) then
		return false
	end
	if ValueType ~= "table" then
		return false
	end
	if not p1 then
		local Meta = getmetatable(List)
		
		if Meta and Meta.__eq then
			return List == List1
		end
	end
	local t = {}
	
	for i, value in pairs(List) do
		local Entry = List1[i]
		
		if Entry == nil or not deepEqual(value, Entry, p1) then
			return false
		end
		t[i] = true
	end
	for i1, _ in pairs(List1) do
		if not t[i1] then
			return false
		end
	end
	return true
end

return deepEqual
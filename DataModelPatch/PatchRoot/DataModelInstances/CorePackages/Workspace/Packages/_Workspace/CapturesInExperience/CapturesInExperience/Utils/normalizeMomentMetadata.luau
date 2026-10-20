local function normalizeValue(List)
	-- upvalues: normalizeValue (copy)
	if typeof(List) == "EnumItem" then
		return List.Name
	end
	if typeof(List) ~= "table" then
		return List
	end
	local t = {}
	
	for i, value in List do
		t[i] = normalizeValue(value)
	end
	return t
end

return normalizeValue
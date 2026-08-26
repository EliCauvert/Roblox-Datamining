local function normalizeValue(p1)
	-- upvalues: normalizeValue (ref)
	if typeof(p1) == "EnumItem" then
		return p1.Name
	elseif typeof(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in p1 do
		t[i] = normalizeValue(v)
	end
	return t
end

return normalizeValue
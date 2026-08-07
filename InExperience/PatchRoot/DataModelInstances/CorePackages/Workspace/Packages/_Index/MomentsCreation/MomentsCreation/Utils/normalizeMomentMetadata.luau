local function normalizeValue(p0) --[[ line: 10 ]]
	-- upvalues: normalizeValue (ref)
	if typeof(p0) == "EnumItem" then
		return p0.Name
	elseif typeof(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in p0 do
		t[i] = normalizeValue(v)
	end
	return t
end

return normalizeValue
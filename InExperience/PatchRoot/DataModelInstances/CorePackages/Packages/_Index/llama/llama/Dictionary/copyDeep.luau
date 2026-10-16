local function copyDeep(List) --[[ Line: 2 ]]
	-- upvalues: copyDeep (copy)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i, value in pairs(List) do
		if type(value) == "table" then
			t[i] = copyDeep(value)
		else
			t[i] = value
		end
	end
	return t
end

return copyDeep
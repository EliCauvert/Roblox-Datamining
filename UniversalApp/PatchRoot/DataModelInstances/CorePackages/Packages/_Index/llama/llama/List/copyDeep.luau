local function copyDeep(p1) --[[ Line: 2 ]]
	-- upvalues: copyDeep (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i = 1, #p1 do
		if type(p1[i]) == "table" then
			t[i] = copyDeep(p1[i])
		else
			t[i] = p1[i]
		end
	end
	return t
end

return copyDeep
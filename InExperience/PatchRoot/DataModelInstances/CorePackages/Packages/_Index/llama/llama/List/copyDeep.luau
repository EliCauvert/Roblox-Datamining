local function copyDeep(p0) --[[ line: 2 ]]
	-- upvalues: copyDeep (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	
	for i = 1, #p0 do
		if type(p0[i]) == "table" then
			t[i] = copyDeep(p0[i])
		else
			t[i] = p0[i]
		end
	end
	return t
end

return copyDeep
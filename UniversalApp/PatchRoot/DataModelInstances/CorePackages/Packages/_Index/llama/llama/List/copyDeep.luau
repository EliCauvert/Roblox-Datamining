local function copyDeep(p1)
	-- upvalues: copyDeep (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
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
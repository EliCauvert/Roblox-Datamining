local function copyDeep(p1)
	-- upvalues: copyDeep (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	
	for i, v in pairs(p1) do
		if type(v) == "table" then
			t[i] = copyDeep(v)
		else
			t[i] = v
		end
	end
	return t
end

return copyDeep
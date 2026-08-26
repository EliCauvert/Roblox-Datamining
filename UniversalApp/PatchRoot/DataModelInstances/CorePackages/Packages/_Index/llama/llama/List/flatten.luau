local function flatten(p1)
	-- upvalues: flatten (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	local var2 = 1
	
	for i_1 = 1, #p1 do
		if type(p1[i_1]) ~= "table" then
			t[var2] = p1[i_1]
			var2 += 1
			continue
		end
		local var3 = flatten(p1[i_1])
		
		for i = 1, #var3 do
			t[var2] = var3[i]
			var2 += 1
		end
	end
	return t
end

return flatten
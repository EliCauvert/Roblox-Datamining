local function flatten(p0)
	-- upvalues: flatten (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	local var3 = 1
	
	for i_1 = 1, #p0 do
		if type(p0[i_1]) ~= "table" then
			t[var3] = p0[i_1]
			var3 += 1
			continue
		end
		local var4 = flatten(p0[i_1])
		
		for i = 1, #var4 do
			t[var3] = var4[i]
			var3 += 1
		end
	end
	return t
end

return flatten
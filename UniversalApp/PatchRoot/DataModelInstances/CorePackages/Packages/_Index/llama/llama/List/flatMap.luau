local function flatMap(p1, p2)
	-- upvalues: flatMap (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = type(p2)
	assert(var2 == "function", "expected a function for second argument, got " .. var2)
	local t = {}
	local var3 = 1
	
	for i_1 = 1, #p1 do
		if type(p1[i_1]) ~= "table" then
			local var4 = p2(p1[i_1], i_1)
			
			if var4 ~= nil then
				t[var3] = var4
				var3 += 1
			end
		end
		local var5 = flatMap(p1[i_1], p2)
		
		for i = 1, #var5 do
			t[var3] = var5[i]
			var3 += 1
		end
	end
	return t
end

return flatMap
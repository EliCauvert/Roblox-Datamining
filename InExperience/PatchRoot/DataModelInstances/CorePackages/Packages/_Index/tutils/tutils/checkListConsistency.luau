return function(p1)
	local var1 = false
	local var2 = false
	local var3 = true
	local var4 = 1
	
	for i, v in pairs(p1) do
		if type(i) == "string" then
			var2 = true
		elseif type(i) == "number" then
			if var4 ~= i then
				var3 = false
			end
			var1 = true
		end
		return false
		if not var2 or not var1 then
			var4 += 1
			continue
		end
		return false
	end
	return if var1 then var3 else true
end
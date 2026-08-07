return function(p0, p1) --[[ line: 8 | named "map" ]]
	local t = {}
	
	for i, v in p0 do
		local var1, var2 = p1(v, i)
		local var3 = if var2 == nil then i else var2
		
		if var1 ~= nil then
			t[var3] = var1
		end
	end
	return t
end
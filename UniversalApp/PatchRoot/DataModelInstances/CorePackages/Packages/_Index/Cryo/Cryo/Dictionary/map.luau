return function(p1, p2)
	local t = {}
	
	for i, v in p1 do
		local var1, var2 = p2(v, i)
		local var3 = if var2 == nil then i else var2
		
		if var1 ~= nil then
			t[var3] = var1
		end
	end
	return t
end
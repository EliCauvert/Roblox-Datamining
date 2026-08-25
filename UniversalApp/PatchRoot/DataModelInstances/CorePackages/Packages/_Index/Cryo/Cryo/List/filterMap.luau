return function(p0, p1)
	local t = {}
	local var1 = 1
	
	for i = 1, #p0 do
		local var2 = p1(p0[i], i)
		
		if var2 ~= nil then
			t[var1] = var2
			var1 += 1
		end
	end
	return t
end
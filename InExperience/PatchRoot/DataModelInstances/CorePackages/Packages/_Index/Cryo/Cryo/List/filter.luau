return function(p1, p2)
	local t = {}
	local var1 = 1
	
	for i = 1, #p1 do
		local var2 = p1[i]
		
		if p2(var2, i) then
			t[var1] = var2
			var1 += 1
		end
	end
	return t
end
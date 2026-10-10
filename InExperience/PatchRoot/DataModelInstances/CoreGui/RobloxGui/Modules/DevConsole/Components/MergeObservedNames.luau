return function(p1, p2, p3)
	local var1 = false
	
	for i, v in p1 do
		local var2 = v[p3]
		
		if var2 and not p2[var2] then
			p2[var2] = true
			var1 = true
		end
	end
	return var1
end
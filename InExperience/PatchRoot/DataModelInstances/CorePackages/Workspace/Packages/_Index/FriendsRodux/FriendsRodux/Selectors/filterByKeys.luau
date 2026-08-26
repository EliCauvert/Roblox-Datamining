return function(p1, p2)
	local t = {}
	
	for i, v in pairs(p1) do
		local var1 = tostring(v)
		local var2 = p2[var1]
		
		if var2 then
			t[var1] = var2
		end
	end
	return t
end
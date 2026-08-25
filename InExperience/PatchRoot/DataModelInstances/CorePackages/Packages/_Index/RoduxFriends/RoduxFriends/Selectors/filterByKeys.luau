return function(p0, p1)
	local t = {}
	
	for i, v in pairs(p0) do
		local var1 = tostring(v)
		local var2 = p1[var1]
		
		if var2 then
			t[var1] = var2
		end
	end
	return t
end
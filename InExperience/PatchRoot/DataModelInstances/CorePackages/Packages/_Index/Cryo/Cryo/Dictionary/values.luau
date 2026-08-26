return function(p1)
	local t = {}
	local var1 = 1
	
	for i, v in pairs(p1) do
		t[var1] = v
		var1 += 1
	end
	return t
end
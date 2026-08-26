return function(p1)
	local t = {}
	local var1 = 1
	
	for i in pairs(p1) do
		t[var1] = i
		var1 += 1
	end
	return t
end
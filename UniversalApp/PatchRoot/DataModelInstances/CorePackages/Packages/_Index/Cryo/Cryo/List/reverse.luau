return function(p1)
	local t = {}
	local p0Count = #p1
	local var1 = p0Count + 1
	
	for i = 1, p0Count do
		t[i] = p1[var1 - i]
	end
	return t
end
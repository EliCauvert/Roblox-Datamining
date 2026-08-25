return function(p0)
	local t = {}
	local p0Count = #p0
	local var2 = p0Count + 1
	
	for i = 1, p0Count do
		t[i] = p0[var2 - i]
	end
	return t
end
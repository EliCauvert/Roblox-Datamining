return function(p0) --[[ line: 5 | named "values" ]]
	local t = {}
	local var1 = 1
	
	for i, v in pairs(p0) do
		t[var1] = v
		var1 += 1
	end
	return t
end
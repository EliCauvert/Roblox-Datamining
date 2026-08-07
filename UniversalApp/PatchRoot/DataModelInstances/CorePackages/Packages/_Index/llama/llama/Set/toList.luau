return function(p0) --[[ line: 2 | named "toList" ]]
	local t = {}
	local var1 = 1
	
	for i, v in pairs(p0) do
		t[var1] = i
		var1 += 1
	end
	return t
end
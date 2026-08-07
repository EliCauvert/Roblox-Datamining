return function(p0) --[[ line: 4 | named "keys" ]]
	local t = {}
	local var1 = 1
	
	for i in pairs(p0) do
		t[var1] = i
		var1 += 1
	end
	return t
end
return function(value) --[[ line: 6 | named "toSet" ]]
	local t = {}
	
	for i = 1, #value do
		t[value[i]] = true
	end
	return t
end
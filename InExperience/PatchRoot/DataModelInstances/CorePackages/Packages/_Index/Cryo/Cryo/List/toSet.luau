return function(p1) --[[ Line: 6 | Named "toSet" ]]
	local t = {}
	
	for i = 1, #p1 do
		t[p1[i]] = true
	end
	return t
end
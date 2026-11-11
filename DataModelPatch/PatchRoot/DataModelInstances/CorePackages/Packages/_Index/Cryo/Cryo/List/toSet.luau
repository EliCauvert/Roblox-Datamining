return function(p1)
	local t = {}
	
	for i = 1, #p1 do
		t[p1[i]] = true
	end
	return t
end
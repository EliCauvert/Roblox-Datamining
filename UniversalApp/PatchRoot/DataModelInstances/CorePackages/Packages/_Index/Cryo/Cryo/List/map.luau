return function(p1, Callback) --[[ Line: 4 | Named "map" ]]
	local t = {}
	
	for i = 1, #p1 do
		t[i] = Callback(p1[i], i)
	end
	return t
end
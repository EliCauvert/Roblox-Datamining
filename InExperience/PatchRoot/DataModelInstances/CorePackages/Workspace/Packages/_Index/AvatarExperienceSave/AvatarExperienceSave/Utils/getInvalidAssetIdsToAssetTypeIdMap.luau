return function(value, p1)
	local t = {}
	
	for i, v in value do
		if not p1[i] then
			t[i] = v
		end
	end
	return t
end
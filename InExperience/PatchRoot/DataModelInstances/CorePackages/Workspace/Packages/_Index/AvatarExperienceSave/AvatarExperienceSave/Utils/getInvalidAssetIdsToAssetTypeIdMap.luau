return function(value, p0)
	local t = {}
	
	for i, v in value do
		if not p0[i] then
			t[i] = v
		end
	end
	return t
end
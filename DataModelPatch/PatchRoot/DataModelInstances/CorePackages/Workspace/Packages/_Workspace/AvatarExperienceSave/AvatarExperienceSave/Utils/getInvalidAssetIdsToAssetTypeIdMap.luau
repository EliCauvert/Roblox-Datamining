return function(List, p1)
	local t = {}
	
	for i, value in List do
		if not p1[i] then
			t[i] = value
		end
	end
	return t
end
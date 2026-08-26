return function(p1, p2)
	local t = {}
	
	for i, v in pairs(p1) do
		if p2[i] ~= p1[i] then
			t[i] = v
		end
	end
	for i_1, v_1 in pairs(p2) do
		if p2[i_1] ~= p1[i_1] then
			t[i_1] = v_1
		end
	end
	return t
end
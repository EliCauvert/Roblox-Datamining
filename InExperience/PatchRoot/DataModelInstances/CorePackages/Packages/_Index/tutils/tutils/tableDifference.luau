return function(p0, p1) --[[ line: 5 ]]
	local t = {}
	
	for i, v in pairs(p0) do
		if p1[i] ~= p0[i] then
			t[i] = v
		end
	end
	for i_1, v_1 in pairs(p1) do
		if p1[i_1] ~= p0[i_1] then
			t[i_1] = v_1
		end
	end
	return t
end
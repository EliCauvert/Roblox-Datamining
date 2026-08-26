return function(p1, p2)
	if p1 == nil or typeof(p1) ~= "table" then
		return false
	end
	local t = {}
	
	for i, v in p2 do
		t[v] = true
	end
	for i_1, v_1 in p2 do
		if p1[v_1] == nil or typeof(p1[v_1]) ~= "number" then
			return false
		end
	end
	for i_2, v_1 in p1 do
		if not t[i_2] then
			return false
		end
	end
	return true
end
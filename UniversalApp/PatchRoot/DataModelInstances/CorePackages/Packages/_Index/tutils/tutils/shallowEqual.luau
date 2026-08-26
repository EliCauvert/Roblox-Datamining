return function(p1, p2, p3)
	if not p1 or not p2 then
		return false
	elseif p1 == p2 then
		return true
	elseif not p3 then
		p3 = {}
	end
	for i, v in pairs(p1) do
		if p2[i] ~= v and not p3[i] then
			return false
		end
	end
	for i, v_1 in pairs(p2) do
		if p1[i] ~= v_1 and not p3[i] then
			return false
		end
	end
	return true
end
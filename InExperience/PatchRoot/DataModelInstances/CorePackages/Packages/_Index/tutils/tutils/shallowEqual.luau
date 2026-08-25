return function(p0, p1, p2)
	if not p0 or not p1 then
		return false
	elseif p0 == p1 then
		return true
	elseif not p2 then
		p2 = {}
	end
	for i, v in pairs(p0) do
		if p1[i] ~= v and not p2[i] then
			return false
		end
	end
	for i, v_1 in pairs(p1) do
		if p0[i] ~= v_1 and not p2[i] then
			return false
		end
	end
	return true
end
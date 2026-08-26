return function(p1, p2)
	if p1 == nil then
		return p2 == nil
	elseif p2 == nil then
		return p1 == nil
	end
	for i, v in pairs(p1) do
		if v ~= p2[i] then
			return false
		end
	end
	for i, v in pairs(p2) do
		if v ~= p1[i] then
			return false
		end
	end
	return true
end
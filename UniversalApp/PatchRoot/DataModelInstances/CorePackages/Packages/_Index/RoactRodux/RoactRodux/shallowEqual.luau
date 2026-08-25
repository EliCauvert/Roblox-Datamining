return function(p0, p1)
	if p0 == nil then
		return p1 == nil
	elseif p1 == nil then
		return p0 == nil
	end
	for i, v in pairs(p0) do
		if v ~= p1[i] then
			return false
		end
	end
	for i, v in pairs(p1) do
		if v ~= p0[i] then
			return false
		end
	end
	return true
end
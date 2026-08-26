return function(p1, p2)
	if p1 == p2 then
		return true
	elseif typeof(p1) ~= "table" or typeof(p2) ~= "table" or #p1 ~= #p2 then
		return false
	elseif p1 == nil or p2 == nil then
		return false
	end
	for i, v in p1 do
		if p2[i] ~= v then
			return false
		end
	end
	for i, v in p2 do
		if p1[i] ~= v then
			return false
		end
	end
	return true
end
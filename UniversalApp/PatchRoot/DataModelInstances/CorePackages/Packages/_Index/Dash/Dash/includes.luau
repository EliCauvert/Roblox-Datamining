return function(p1, p2)
	if p2 == nil then
		return false
	end
	for i, v in p1 do
		if v == p2 then
			return true
		end
	end
	return false
end
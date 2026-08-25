return function(p0, p1)
	for i, v in p0 do
		if p1[i] ~= v then
			return false
		end
	end
	for i, v in p1 do
		if p0[i] ~= v then
			return false
		end
	end
	return true
end
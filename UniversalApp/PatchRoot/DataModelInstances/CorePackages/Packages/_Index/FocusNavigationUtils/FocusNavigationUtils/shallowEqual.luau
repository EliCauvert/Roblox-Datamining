return function(p1, p2)
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
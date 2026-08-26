return function(p1, p2)
	for i, v in p1 do
		if p2(v, i) then
			return true
		end
	end
	return false
end
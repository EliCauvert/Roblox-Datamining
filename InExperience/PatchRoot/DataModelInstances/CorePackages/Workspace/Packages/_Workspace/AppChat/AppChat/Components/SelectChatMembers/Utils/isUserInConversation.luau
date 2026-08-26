return function(p1, p2)
	for i, v in pairs(p2.participants) do
		if p1 == v then
			return true
		end
	end
	return false
end
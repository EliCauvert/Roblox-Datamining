return function(p0, p1)
	for i, v in pairs(p1.participants) do
		if p0 == v then
			return true
		end
	end
	return false
end
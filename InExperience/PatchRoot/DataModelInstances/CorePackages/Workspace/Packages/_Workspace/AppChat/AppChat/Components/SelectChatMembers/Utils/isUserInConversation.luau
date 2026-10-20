return function(p1, p2): boolean
	for _, participant in pairs(p2.participants) do
		if p1 == participant then
			return true
		end
	end
	return false
end
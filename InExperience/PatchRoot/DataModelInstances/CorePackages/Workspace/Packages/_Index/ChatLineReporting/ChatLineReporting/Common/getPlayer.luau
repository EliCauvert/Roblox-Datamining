return function(p1, p2)
	for i, v in pairs(p1) do
		if v.userId == p2 then
			return v
		end
	end
	return nil
end
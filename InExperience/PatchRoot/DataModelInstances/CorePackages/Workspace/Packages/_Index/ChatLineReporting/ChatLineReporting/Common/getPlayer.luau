return function(p0, p1)
	for i, v in pairs(p0) do
		if v.userId == p1 then
			return v
		end
	end
	return nil
end
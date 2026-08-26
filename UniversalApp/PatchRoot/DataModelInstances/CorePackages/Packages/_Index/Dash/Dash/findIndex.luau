return function(p1, p2)
	for i, v in ipairs(p1) do
		if p2(v, i) then
			return i
		end
	end
	return nil
end
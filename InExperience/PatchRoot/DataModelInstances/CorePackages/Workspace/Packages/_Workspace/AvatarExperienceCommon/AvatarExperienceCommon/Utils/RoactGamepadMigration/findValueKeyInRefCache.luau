return function(p0, p1)
	for i, v in p1 do
		if v.current == p0 then
			return i
		end
	end
	return nil
end
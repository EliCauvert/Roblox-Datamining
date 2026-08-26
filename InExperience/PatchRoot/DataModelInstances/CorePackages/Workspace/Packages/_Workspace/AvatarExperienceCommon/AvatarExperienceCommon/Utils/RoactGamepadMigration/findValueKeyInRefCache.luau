return function(p1, p2)
	for i, v in p2 do
		if v.current == p1 then
			return i
		end
	end
	return nil
end
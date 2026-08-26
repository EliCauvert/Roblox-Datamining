return function(p1, p2)
	for i = 1, #p1 do
		if p1[i] ~= p2 then
			continue
		end
		return i
	end
	return nil
end
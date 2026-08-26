return function(p1, p2)
	for i = 1, #p1 do
		if not p2(p1[i], i) then
			continue
		end
		return i
	end
	return nil
end
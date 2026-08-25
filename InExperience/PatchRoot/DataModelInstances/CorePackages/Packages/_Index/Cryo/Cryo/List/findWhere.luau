return function(p0, p1)
	for i = 1, #p0 do
		if not p1(p0[i], i) then
			continue
		end
		return i
	end
	return nil
end
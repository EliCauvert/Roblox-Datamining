return function(p0, p1)
	for i = 1, #p0 do
		if p0[i] ~= p1 then
			continue
		end
		return i
	end
	return nil
end
return function(p1, p2): number?
	for i = 1, #p1 do
		if p1[i] == p2 then
			return i
		end
	end
	return nil
end
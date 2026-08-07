return function(p0, p1) --[[ line: 5 | named "find" ]]
	for i = 1, #p0 do
		if p0[i] ~= p1 then
			continue
		end
		return i
	end
	return nil
end
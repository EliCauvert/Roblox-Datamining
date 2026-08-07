return function(p0, p1) --[[ line: 13 | named "find" ]]
	for i, v in p0 do
		if p1(v, i) then
			return v
		end
	end
	return nil
end
return function(p0, p1) --[[ line: 10 | named "findIndex" ]]
	for i, v in ipairs(p0) do
		if p1(v, i) then
			return i
		end
	end
	return nil
end
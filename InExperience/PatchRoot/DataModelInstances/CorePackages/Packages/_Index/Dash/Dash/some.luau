return function(p0, p1) --[[ line: 12 | named "some" ]]
	for i, v in p0 do
		if p1(v, i) then
			return true
		end
	end
	return false
end
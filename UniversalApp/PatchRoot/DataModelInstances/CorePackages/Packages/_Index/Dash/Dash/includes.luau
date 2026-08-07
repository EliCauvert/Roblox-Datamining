return function(p0, p1) --[[ line: 10 | named "includes" ]]
	if p1 == nil then
		return false
	end
	for i, v in p0 do
		if v == p1 then
			return true
		end
	end
	return false
end
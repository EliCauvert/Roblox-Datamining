return function(p0) --[[ line: 1 | named "validateRefs" ]]
	for i, v in p0 do
		if v.current == nil then
			return false
		end
	end
	return true
end
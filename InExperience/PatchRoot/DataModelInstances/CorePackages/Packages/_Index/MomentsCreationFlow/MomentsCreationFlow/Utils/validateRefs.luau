return function(p1)
	for i, v in p1 do
		if v.current == nil then
			return false
		end
	end
	return true
end
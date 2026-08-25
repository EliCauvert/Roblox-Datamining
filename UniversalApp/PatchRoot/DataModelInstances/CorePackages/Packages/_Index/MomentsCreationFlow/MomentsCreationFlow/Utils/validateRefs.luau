return function(p0)
	for i, v in p0 do
		if v.current == nil then
			return false
		end
	end
	return true
end
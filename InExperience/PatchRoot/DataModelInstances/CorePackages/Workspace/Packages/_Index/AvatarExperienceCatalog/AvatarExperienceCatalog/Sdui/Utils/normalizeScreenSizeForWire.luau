return function(p1)
	return if #p1 == 0 then p1 else string.lower(string.sub(p1, 1, 1)) .. string.sub(p1, 2)
end
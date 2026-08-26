return function(p1)
	return if p1 == nil then 0 else utf8.len(p1) or p1:len()
end
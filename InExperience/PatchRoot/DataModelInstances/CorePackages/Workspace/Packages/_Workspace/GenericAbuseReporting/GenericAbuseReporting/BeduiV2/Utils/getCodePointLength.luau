return function(p0)
	return if p0 == nil then 0 else utf8.len(p0) or p0:len()
end
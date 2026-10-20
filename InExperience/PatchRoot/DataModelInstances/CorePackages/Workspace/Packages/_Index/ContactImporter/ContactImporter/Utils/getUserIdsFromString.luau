return function(p1)
	return string.gmatch(p1 or "", "([^,]+)")
end
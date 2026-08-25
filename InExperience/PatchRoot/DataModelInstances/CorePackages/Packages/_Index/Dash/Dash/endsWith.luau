return function(p0, p1)
	return p0:sub(-p1:len()) == p1
end
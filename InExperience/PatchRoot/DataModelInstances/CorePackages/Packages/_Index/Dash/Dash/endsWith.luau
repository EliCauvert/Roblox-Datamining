return function(p1, p2)
	return p1:sub(-p2:len()) == p2
end
return function(p0, p1) --[[ line: 14 | named "endsWith" ]]
	return p0:sub(-p1:len()) == p1
end
return function(p0, p1) --[[ line: 16 | named "startsWith" ]]
	return p0:sub(1, p1:len()) == p1
end
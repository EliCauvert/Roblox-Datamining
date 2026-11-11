return function(p1, p2): boolean
	return p2 >= #p1 and not p1:match("^%s*$")
end
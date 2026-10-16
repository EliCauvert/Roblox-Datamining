return function(p1, p2)
	return if p2 < #p1 then false else p1:match("^%s*$")
end
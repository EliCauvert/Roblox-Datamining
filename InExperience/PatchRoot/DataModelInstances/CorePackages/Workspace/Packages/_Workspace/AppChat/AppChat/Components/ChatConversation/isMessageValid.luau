return function(p0, p1) --[[ line: 1 ]]
	return if p1 < #p0 then false else p0:match("^%s*$")
end
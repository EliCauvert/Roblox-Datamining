return function(p1)
	return if typeof(p1) == "Object" then Content.fromObject(p1) else Content.none
end
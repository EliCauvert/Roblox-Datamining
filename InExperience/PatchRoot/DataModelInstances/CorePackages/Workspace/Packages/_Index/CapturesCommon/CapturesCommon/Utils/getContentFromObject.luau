return function(p0)
	return if typeof(p0) == "Object" then Content.fromObject(p0) else Content.none
end
return function(p0) --[[ line: 1 | named "getContentFromObject" ]]
	return if typeof(p0) == "Object" then Content.fromObject(p0) else Content.none
end
return function(p1) --[[ Line: 1 | Named "getContentFromObject" ]]
	return if typeof(p1) == "Object" then Content.fromObject(p1) else Content.none
end
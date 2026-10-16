return function(p1) --[[ Line: 1 | Named "parseBooleanString" ]]
	return if p1 == nil then nil else p1 == "true" or (p1 == "True" or p1 == "1")
end
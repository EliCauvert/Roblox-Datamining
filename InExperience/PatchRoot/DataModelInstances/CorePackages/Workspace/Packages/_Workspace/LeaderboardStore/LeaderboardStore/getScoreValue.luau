return function(p1) --[[ Line: 1 | Named "getScoreValue" ]]
	return if typeof(p1) == "boolean" then if p1 then 1 else 0 else p1
end
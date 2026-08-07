return function(p0) --[[ line: 1 | named "getScoreValue" ]]
	return if typeof(p0) == "boolean" then if p0 then 1 else 0 else p0
end
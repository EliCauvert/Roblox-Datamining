return function(p0) --[[ line: 17 ]]
	return type(p0) == "number" and (p0 ~= 1e999 and p0 == math.floor(p0))
end
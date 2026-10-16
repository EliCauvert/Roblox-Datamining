return function(p1): boolean --[[ Line: 16 ]]
	return typeof(p1) == "number" and p1 == p1 and (p1 ~= 1e999 and p1 ~= -1e999)
end
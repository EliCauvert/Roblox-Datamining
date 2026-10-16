return function(p1): boolean --[[ Line: 1 ]]
	return p1 ~= nil and (p1 ~= "" and tonumber(p1) > 0)
end
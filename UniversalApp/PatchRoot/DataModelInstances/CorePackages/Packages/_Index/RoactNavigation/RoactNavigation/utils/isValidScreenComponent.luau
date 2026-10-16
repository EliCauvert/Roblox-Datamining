return function(p1): boolean --[[ Line: 2 ]]
	local ValueType = type(p1)
	
	return ValueType == "function" or ValueType == "table" and type(p1.render) == "function"
end
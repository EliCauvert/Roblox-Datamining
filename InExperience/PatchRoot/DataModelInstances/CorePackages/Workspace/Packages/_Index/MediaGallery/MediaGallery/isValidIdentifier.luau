return function(p1): boolean --[[ Line: 1 | Named "isValidIdentifier" ]]
	return p1 ~= nil and (p1 ~= "" and p1 ~= "0")
end
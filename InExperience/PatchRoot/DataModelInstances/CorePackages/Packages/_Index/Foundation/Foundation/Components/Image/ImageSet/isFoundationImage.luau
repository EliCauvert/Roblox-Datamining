return function(p1): boolean --[[ Line: 1 | Named "isFoundationImage" ]]
	return p1 ~= nil and (p1 ~= "" and p1:match("^%w+://.*$") == nil)
end
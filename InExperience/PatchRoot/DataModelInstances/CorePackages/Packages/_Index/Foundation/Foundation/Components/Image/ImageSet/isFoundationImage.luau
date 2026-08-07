return function(p0) --[[ line: 1 | named "isFoundationImage" ]]
	return p0 ~= nil and (p0 ~= "" and p0:match("^%w+://.*$") == nil)
end
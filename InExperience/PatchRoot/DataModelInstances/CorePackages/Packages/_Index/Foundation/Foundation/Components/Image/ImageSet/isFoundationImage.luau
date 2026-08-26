return function(p1)
	return p1 ~= nil and (p1 ~= "" and p1:match("^%w+://.*$") == nil)
end
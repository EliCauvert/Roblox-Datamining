return function(p0)
	return p0 ~= nil and (p0 ~= "" and p0:match("^%w+://.*$") == nil)
end
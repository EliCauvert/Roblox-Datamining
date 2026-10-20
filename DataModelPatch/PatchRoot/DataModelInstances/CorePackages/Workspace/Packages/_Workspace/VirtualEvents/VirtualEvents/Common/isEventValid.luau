return function(p1): boolean
	return p1.title ~= nil and (p1.imageUrl ~= nil and p1.pagePath ~= nil)
end
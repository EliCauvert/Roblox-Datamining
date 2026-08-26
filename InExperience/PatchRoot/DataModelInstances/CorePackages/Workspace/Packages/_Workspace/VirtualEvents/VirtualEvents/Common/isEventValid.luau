return function(p1)
	return if p1.title == nil then false elseif p1.imageUrl == nil then false else p1.pagePath ~= nil
end
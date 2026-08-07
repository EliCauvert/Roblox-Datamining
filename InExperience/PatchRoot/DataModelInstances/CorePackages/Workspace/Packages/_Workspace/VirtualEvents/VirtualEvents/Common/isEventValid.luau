return function(p0) --[[ line: 1 | named "isEventValid" ]]
	return if p0.title == nil then false elseif p0.imageUrl == nil then false else p0.pagePath ~= nil
end
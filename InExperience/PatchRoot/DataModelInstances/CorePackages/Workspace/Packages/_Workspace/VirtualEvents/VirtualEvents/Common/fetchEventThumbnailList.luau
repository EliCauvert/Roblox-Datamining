local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: urlBuilder (ref)
	return p0(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = p1 }), "GET"):andThen(function(p2) --[[ line: 8 ]]
		return if p2.responseBody then p2.responseBody.thumbnails else {}
	end, function() --[[ line: 10 ]]
		return {}
	end)
end
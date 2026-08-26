local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p1, p2)
	-- upvalues: urlBuilder (ref)
	return p1(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = p2 }), "GET"):andThen(function(p3)
		return p3.responseBody
	end)
end
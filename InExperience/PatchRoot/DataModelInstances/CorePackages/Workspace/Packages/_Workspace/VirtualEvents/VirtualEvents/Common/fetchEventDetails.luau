local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p0, p1)
	-- upvalues: urlBuilder (ref)
	return p0(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = p1 }), "GET"):andThen(function(p2)
		return p2.responseBody
	end)
end
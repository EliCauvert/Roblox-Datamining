local UrlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(Callback, Id)
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = Id }), "GET"):andThen(function(Result)
		return Result.responseBody
	end)
end
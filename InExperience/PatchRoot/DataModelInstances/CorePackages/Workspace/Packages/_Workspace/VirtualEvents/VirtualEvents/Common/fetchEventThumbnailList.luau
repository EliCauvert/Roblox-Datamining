local UrlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(Callback, Id) --[[ Line: 5 ]]
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = Id }), "GET"):andThen(function(Result) --[[ Line: 8 ]]
		return Result.responseBody and Result.responseBody.thumbnails or {}
	end, function() --[[ Line: 10 ]]
		return {}
	end)
end
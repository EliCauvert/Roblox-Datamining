local UrlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(Callback, Id, p1) --[[ Line: 5 ]]
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = Id }), "GET"):andThen(function(Result) --[[ Line: 8 ]]
		-- upvalues: p1 (copy)
		local MediaId = Result.responseBody and Result.responseBody.thumbnails and Result.responseBody.thumbnails[1] and Result.responseBody.thumbnails[1].mediaId or nil
		
		return if MediaId then "rbxassetid://" .. MediaId else p1
	end, function() --[[ Line: 20 ]]
		-- upvalues: p1 (copy)
		return p1
	end)
end
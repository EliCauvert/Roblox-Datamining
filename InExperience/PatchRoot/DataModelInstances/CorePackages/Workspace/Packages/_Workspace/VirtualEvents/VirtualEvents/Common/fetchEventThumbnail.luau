local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2)
	-- upvalues: urlBuilder (ref)
	return p0(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = p1 }), "GET"):andThen(function(p3)
		-- upvalues: p2 (ref)
		local mediaId = p3.responseBody and (p3.responseBody.thumbnails and (p3.responseBody.thumbnails[1] and (p3.responseBody.thumbnails[1].mediaId or nil)))
		
		return if mediaId then "rbxassetid://" .. mediaId else p2
	end, function()
		-- upvalues: p2 (ref)
		return p2
	end)
end
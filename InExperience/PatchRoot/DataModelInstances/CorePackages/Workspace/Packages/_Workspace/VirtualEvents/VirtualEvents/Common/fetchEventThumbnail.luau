local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref)
	return p1(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")({ id = p2 }), "GET"):andThen(function(p4)
		-- upvalues: p3 (ref)
		local mediaId = p4.responseBody and (p4.responseBody.thumbnails and (p4.responseBody.thumbnails[1] and (p4.responseBody.thumbnails[1].mediaId or nil)))
		
		return if mediaId then "rbxassetid://" .. mediaId else p3
	end, function()
		-- upvalues: p3 (ref)
		return p3
	end)
end
local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p1(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps")({ id = p2 }), "POST", { postBody = httpService:JSONEncode({ rsvpStatus = p3 }) }):andThen(function(p4)
		return p4.responseBody
	end)
end
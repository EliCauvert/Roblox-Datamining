local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps")({ id = p1 }), "POST", { postBody = httpService:JSONEncode({ rsvpStatus = p2 }) }):andThen(function(p3) --[[ line: 17 ]]
		return p3.responseBody
	end)
end
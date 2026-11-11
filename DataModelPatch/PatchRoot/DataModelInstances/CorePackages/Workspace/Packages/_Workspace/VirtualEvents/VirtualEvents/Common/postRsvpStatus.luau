local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(Callback, Id, RsvpStatus)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps")({ id = Id }), "POST", {
		postBody = HttpService:JSONEncode({ rsvpStatus = RsvpStatus })
	}):andThen(function(Result)
		return Result.responseBody
	end)
end
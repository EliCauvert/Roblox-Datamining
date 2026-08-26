local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p1(urlBuilder.fromString("apis:virtual-events/v1/notifications/modal-history")(), "POST", { postBody = httpService:JSONEncode({}) })
end
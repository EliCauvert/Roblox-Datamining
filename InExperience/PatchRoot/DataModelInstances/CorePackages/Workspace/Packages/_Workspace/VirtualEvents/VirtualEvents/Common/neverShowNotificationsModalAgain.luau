local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(Callback)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:virtual-events/v1/notifications/modal-history")(), "POST", { postBody = HttpService:JSONEncode({}) })
end
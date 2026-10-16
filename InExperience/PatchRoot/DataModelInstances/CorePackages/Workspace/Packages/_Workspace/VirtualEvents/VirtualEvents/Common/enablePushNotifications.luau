local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(Callback) --[[ Line: 8 ]]
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:virtual-events/v1/notifications/preferences")(), "POST", { postBody = HttpService:JSONEncode({ isEnabled = true }) })
end
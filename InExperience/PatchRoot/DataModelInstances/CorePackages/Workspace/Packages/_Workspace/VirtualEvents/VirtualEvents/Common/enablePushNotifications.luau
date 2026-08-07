local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("VirtualEvents").Parent.UrlBuilder).UrlBuilder

return function(p0) --[[ line: 8 ]]
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("apis:virtual-events/v1/notifications/preferences")(), "POST", { postBody = httpService:JSONEncode({ isEnabled = true }) })
end
local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("SduiSharedContent").Parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("apis:modals-api/v1/prompts/dismiss")(), "POST", {
		postBody = httpService:JSONEncode({ promptType = p1, promptId = p2 })
	})
end
local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("SduiSharedContent").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p1(urlBuilder.fromString("apis:modals-api/v1/prompts/dismiss")(), "POST", {
		postBody = httpService:JSONEncode({ promptType = p2, promptId = p3 })
	})
end
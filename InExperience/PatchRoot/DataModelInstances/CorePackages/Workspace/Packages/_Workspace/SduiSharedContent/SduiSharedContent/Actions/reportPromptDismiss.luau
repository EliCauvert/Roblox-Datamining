local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("SduiSharedContent").Parent.UrlBuilder).UrlBuilder

return function(Callback, PromptType, PromptId)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:modals-api/v1/prompts/dismiss")(), "POST", {
		postBody = HttpService:JSONEncode({ promptType = PromptType, promptId = PromptId })
	})
end
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("PromptsServerDrivenUi").Parent.UrlBuilder).UrlBuilder

return function(Callback, MilestoneId, Count)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:modals-api/v1/prompts/milestones/set")(), "POST", {
		postBody = HttpService:JSONEncode({ milestoneId = MilestoneId, count = Count })
	})
end
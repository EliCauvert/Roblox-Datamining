local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("PromptsServerDrivenUi").Parent.UrlBuilder).UrlBuilder

return function(Callback, MilestoneId)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:modals-api/v1/prompts/milestones/increment")(), "POST", {
		postBody = HttpService:JSONEncode({ milestoneId = MilestoneId })
	})
end
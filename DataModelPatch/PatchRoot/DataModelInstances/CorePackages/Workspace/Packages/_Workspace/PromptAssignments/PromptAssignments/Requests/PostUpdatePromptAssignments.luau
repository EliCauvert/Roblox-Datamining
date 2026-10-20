local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("PromptAssignments").Parent.Http).Url

return function(Callback, PromptType, Action)
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%saccount-security-service/v1/prompt-assignments", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({ promptType = PromptType, action = Action })
	})
end
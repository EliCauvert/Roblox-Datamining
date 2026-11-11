local Url = require(script:FindFirstAncestor("PromptAssignments").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%saccount-security-service/v1/prompt-assignments?shouldReturnMetadata=true", Url.APIS_URL), "GET")
end
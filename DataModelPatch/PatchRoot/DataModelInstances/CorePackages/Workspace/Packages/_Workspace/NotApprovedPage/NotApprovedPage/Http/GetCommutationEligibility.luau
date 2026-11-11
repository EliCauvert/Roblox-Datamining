local Url = require(script:FindFirstAncestor("NotApprovedPage").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(Url.APIS_URL .. "moderation-appeal-service/v2/consequence-commutation-eligibility", "GET")
end
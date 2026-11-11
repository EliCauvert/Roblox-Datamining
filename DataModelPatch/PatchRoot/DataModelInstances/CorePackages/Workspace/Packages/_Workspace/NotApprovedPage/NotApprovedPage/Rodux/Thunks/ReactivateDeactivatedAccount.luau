local Url = require(script:FindFirstAncestor("NotApprovedPage").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(Url.APIS_URL .. "account-deletion-api/v1/reactivate", "POST")
end
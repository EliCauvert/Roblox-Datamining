local Url = require(script:FindFirstAncestor("AuthSignup").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%sv1/account-creation/metadata", Url.AUTH_URL), "GET", { maxRetryCount = 0 })
end
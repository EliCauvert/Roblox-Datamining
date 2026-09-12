local url = require(script:FindFirstAncestor("AuthSignup").Parent.Http).Url

return function(p1)
	-- upvalues: url (ref)
	return p1(string.format("%sv1/account-creation/metadata", url.AUTH_URL), "GET", { maxRetryCount = 0 })
end
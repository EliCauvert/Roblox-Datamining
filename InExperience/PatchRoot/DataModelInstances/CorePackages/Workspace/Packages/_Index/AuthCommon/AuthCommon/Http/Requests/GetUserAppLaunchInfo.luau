local url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(p1)
	-- upvalues: url (ref)
	return p1(string.format("%s/users/authenticated/app-launch-info", url.USERS_URL), "GET", { maxRetryCount = 0 })
end
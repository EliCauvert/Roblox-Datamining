local Url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%s/users/authenticated/app-launch-info", Url.USERS_URL), "GET", { maxRetryCount = 0 })
end
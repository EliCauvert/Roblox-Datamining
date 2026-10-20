local HttpModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Http)

return function(Callback)
	-- upvalues: HttpModule (copy)
	return Callback(("%s/users/authenticated/app-launch-info"):format(HttpModule.Url.USERS_URL), "GET")
end
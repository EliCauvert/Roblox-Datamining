local httpModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Http)

return function(p1)
	-- upvalues: httpModule (ref)
	return p1(("%s/users/authenticated/app-launch-info"):format(httpModule.Url.USERS_URL), "GET")
end
local httpModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Http)

return function(p0)
	-- upvalues: httpModule (ref)
	return p0(("%s/users/authenticated/app-launch-info"):format(httpModule.Url.USERS_URL), "GET")
end
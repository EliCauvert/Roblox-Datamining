local httpModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Http)

return function(p0) --[[ line: 5 | named "getAccounts" ]]
	-- upvalues: httpModule (ref)
	return p0(("%s/users/authenticated/app-launch-info"):format(httpModule.Url.USERS_URL), "GET")
end
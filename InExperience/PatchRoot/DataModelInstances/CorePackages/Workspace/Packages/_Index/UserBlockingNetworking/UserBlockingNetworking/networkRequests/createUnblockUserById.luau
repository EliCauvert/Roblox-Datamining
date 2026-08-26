local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.POST("UnblockUserById", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule, { params = p3.currentUserId }):path("user-blocking-api"):path("v1"):path("users"):id(p3.userId):path("unblock-user"):body({})
	end)
end
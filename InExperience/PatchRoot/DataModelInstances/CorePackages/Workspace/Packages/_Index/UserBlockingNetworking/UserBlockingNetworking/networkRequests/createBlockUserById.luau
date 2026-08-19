local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 13 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("BlockUserById", function(p1, p2) --[[ line: 16 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule, { currentUserId = p2.currentUserId }):path("user-blocking-api"):path("v1"):path("users"):id(p2.userId):path("block-user"):body({})
	end)
end
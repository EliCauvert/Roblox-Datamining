local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.GET("GetBlockedUsers", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule, { currentUserId = if p3 then p3.currentUserId else nil }):path("user-blocking-api"):path("v1"):path("users"):path("get-blocked-users"):queryArgs({
			cursor = if p3 then p3.cursor else nil,
			count = if p3 then p3.count else nil
		})
	end)
end
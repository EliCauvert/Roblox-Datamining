local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("GetBlockedUsers", function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule, { currentUserId = if p2 then p2.currentUserId else nil }):path("user-blocking-api"):path("v1"):path("users"):path("get-blocked-users"):queryArgs({
			cursor = if p2 then p2.cursor else nil,
			count = if p2 then p2.count else nil
		})
	end)
end
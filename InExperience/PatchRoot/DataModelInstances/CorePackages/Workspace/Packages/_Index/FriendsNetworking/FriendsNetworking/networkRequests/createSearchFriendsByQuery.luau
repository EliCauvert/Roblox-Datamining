local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0)
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET("SearchFriendsByQuery", function(p1, p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("users"):id(p2):path("friends"):path("search"):queryArgs({
			query = if p3 then p3.query else nil,
			userSort = if p3 then p3.userSort else nil,
			cursor = if p3 then p3.cursor else nil,
			limit = if p3 then p3.limit else nil
		})
	end)
end
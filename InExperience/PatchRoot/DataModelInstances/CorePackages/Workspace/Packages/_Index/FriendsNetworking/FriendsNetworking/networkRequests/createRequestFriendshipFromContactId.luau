local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 11 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.POST("RequestFriendshipFromContactId", function(p1, p2) --[[ line: 16 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("contacts"):id(p2.contactId):path("request-friendship"):body({})
	end)
end
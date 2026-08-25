local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0)
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.POST("ValidateFriendRequestNickname", function(p1, p2)
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("my"):path("friends"):path("validate-nickname"):body({ senderNickname = p2.senderNickname })
	end)
end
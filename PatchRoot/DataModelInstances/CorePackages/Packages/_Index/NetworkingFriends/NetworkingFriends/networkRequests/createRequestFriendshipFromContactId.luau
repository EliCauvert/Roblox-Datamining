-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 12 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "RequestFriendshipFromContactId" }, function(p1, p2) --[[ line: 17 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("contacts"):id(p2.contactId):path("request-friendship"):body({})
	end)
end
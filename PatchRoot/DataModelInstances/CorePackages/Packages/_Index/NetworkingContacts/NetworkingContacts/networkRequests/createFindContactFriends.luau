-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterFindFriendsUrl", "contacts")
local contactImporterFindFriendsUrlFastString = game:GetFastString("ContactImporterFindFriendsUrl")

return function(p0) --[[ line: 8 ]]
	-- upvalues: API_URLModule (ref), contactImporterFindFriendsUrlFastString (ref)
	return p0.roduxNetworking.GET({ Name = "FindContactFriends" }, function(p1) --[[ line: 11 ]]
		-- upvalues: API_URLModule (copy), contactImporterFindFriendsUrlFastString (copy)
		return p1(API_URLModule):path("contacts-api"):path("v1"):path(contactImporterFindFriendsUrlFastString)
	end)
end
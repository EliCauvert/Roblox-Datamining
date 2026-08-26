local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterFindFriendsUrl", "contacts")
local contactImporterFindFriendsUrlFastString = game:GetFastString("ContactImporterFindFriendsUrl")

return function(p1)
	-- upvalues: API_URLModule (ref), contactImporterFindFriendsUrlFastString (ref)
	return p1.roduxNetworking.GET("FindContactFriends", function(p2)
		-- upvalues: API_URLModule (copy), contactImporterFindFriendsUrlFastString (copy)
		return p2(API_URLModule):path("contacts-api"):path("v1"):path(contactImporterFindFriendsUrlFastString)
	end)
end
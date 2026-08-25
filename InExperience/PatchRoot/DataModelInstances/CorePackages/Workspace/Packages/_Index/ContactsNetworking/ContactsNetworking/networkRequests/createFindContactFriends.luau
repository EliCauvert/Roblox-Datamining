local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterFindFriendsUrl", "contacts")
local contactImporterFindFriendsUrlFastString = game:GetFastString("ContactImporterFindFriendsUrl")

return function(p0)
	-- upvalues: API_URLModule (ref), contactImporterFindFriendsUrlFastString (ref)
	return p0.roduxNetworking.GET("FindContactFriends", function(p1)
		-- upvalues: API_URLModule (copy), contactImporterFindFriendsUrlFastString (copy)
		return p1(API_URLModule):path("contacts-api"):path("v1"):path(contactImporterFindFriendsUrlFastString)
	end)
end
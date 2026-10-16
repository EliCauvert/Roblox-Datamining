local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterFindFriendsUrl", "contacts")
local ContactImporterFindFriendsUrlFastString = game:GetFastString("ContactImporterFindFriendsUrl")

return function(p1) --[[ Line: 8 ]]
	-- upvalues: APIURLModule (copy), ContactImporterFindFriendsUrlFastString (copy)
	return p1.roduxNetworking.GET({ Name = "FindContactFriends" }, function(Callback) --[[ Line: 11 ]]
		-- upvalues: APIURLModule (upval), ContactImporterFindFriendsUrlFastString (upval)
		return Callback(APIURLModule):path("contacts-api"):path("v1"):path(ContactImporterFindFriendsUrlFastString)
	end)
end
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserModule = require(Modules.LuaApp.Models.User)
local UseLastOnlineForSortFunction = require(Modules.LuaApp.sortFriendsUtilities).useLastOnlineForSort
local GetFriendWeightFunction = require(Modules.LuaApp.sortFriendsUtilities).getFriendWeight

return function(p1, p2): boolean
	-- upvalues: GetFriendWeightFunction (copy), UserModule (copy), UseLastOnlineForSortFunction (copy)
	local FriendWeight = GetFriendWeightFunction(p1)
	local FriendWeight1 = GetFriendWeightFunction(p2)
	
	return if FriendWeight == FriendWeight1 then if p1.presence == UserModule.PresenceType.OFFLINE or not UseLastOnlineForSortFunction(p1.lastOnline, p2.lastOnline) then p1.name:lower() < p2.name:lower() else p2.lastOnline < p1.lastOnline else FriendWeight1 < FriendWeight
end
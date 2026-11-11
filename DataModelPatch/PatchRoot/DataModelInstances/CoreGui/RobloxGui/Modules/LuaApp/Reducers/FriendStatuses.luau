local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local AddFriendStatusModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.AddFriendStatus)
local ConfigResult = require(CorePackages.Workspace.Packages.FriendsNetworking).config({
	roduxNetworking = require(CorePackages.Packages.RoduxNetworking).mock()
})

return function(p1, p2)
	-- upvalues: AddFriendStatusModule (copy), CryoModule (copy), ConfigResult (copy)
	local P0 = p1 or {}
	
	if p2.type == AddFriendStatusModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.id] = p2.status })
		
		return P0
	end
	if p2.type == ConfigResult.RequestFriendshipFromUserId.Succeeded.name then
		return CryoModule.Dictionary.join(P0, {
			[tostring(p2.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
		})
	end
	if p2.type == ConfigResult.AcceptFriendRequestFromUserId.Succeeded.name then
		return CryoModule.Dictionary.join(P0, { [tostring(p2.ids[1])] = Enum.FriendStatus.Friend })
	end
	if p2.type ~= ConfigResult.DeclineFriendRequestFromUserId.Succeeded.name then
		return if p2.type == ConfigResult.UnfriendTargetUserId.Succeeded.name then CryoModule.Dictionary.join(P0, {
			[tostring(p2.namedIds.users)] = Enum.FriendStatus.NotFriend
		}) else P0
	end
	local NotFriends = {}
	
	for _, id in p2.ids do
		NotFriends[tostring(id)] = Enum.FriendStatus.NotFriend
	end
	return CryoModule.Dictionary.join(P0, NotFriends)
end
local Players = game:GetService("Players")
local GetFFlagInviteListRerankFunction = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags).GetFFlagInviteListRerank
local UserModule = {
	PresenceType = {
		OFFLINE = "OFFLINE",
		ONLINE = "ONLINE",
		IN_GAME = "IN_GAME",
		IN_STUDIO = "IN_STUDIO"
	},
	new = function() --[[ Line: 17 ]]
		return {}
	end
}

function UserModule.fromData(p1, DisplayName, IsFriend, p2) --[[ Line: 25 ]]
	-- upvalues: UserModule (copy), Players (copy)
	local NewUser = UserModule.new()
	NewUser.id = tostring(p1)
	NewUser.isFetching = false
	NewUser.isFriend = IsFriend
	NewUser.friendRank = p2 or 0
	NewUser.lastLocation = nil
	NewUser.name = DisplayName
	NewUser.displayName = DisplayName
	NewUser.externalAppDisplayName = DisplayName
	NewUser.universeId = nil
	NewUser.placeId = nil
	NewUser.rootPlaceId = nil
	NewUser.gameInstanceId = nil
	NewUser.presence = Players.LocalPlayer and NewUser.id == tostring(Players.LocalPlayer.UserId) and UserModule.PresenceType.ONLINE or nil
	NewUser.DEPRECATED_thumbnails = nil
	NewUser.lastOnline = nil
	
	return NewUser
end

function UserModule.fromDataTable(p1) --[[ Line: 51 ]]
	-- upvalues: UserModule (copy), Players (copy), GetFFlagInviteListRerankFunction (copy)
	local NewUser = UserModule.new()
	NewUser.id = tostring(p1.id)
	NewUser.isFriend = p1.isFriend
	NewUser.friendRank = p1.friendRank
	NewUser.presence = Players.LocalPlayer and NewUser.id == tostring(Players.LocalPlayer.UserId) and UserModule.PresenceType.ONLINE or nil
	NewUser.isFetching = false
	NewUser.lastLocation = nil
	NewUser.name = p1.name
	NewUser.displayName = p1.displayName or p1.name
	NewUser.externalAppDisplayName = p1.externalAppDisplayName
	NewUser.universeId = nil
	NewUser.placeId = nil
	NewUser.rootPlaceId = nil
	NewUser.gameInstanceId = nil
	NewUser.DEPRECATED_thumbnails = nil
	NewUser.lastOnline = nil
	NewUser.hasVerifiedBadge = p1.hasVerifiedBadge
	
	if GetFFlagInviteListRerankFunction() then
		NewUser.friendFrequentRank = p1.friendFrequentRank
	end
	return NewUser
end

function UserModule.compare(List, List1): boolean --[[ Line: 80 ]]
	assert(not (List == nil and List1 == nil), "user1 and user2 cannot both be nil")
	assert(List == nil or typeof(List) == "table", "user1 must be a table or nil")
	assert(List1 == nil or typeof(List1) == "table", "user2 must be a table or nil")
	
	if not List or not List1 then
		return false
	end
	for i, value in pairs(List1) do
		if List[i] ~= value then
			return false
		end
	end
	for i1, value1 in pairs(List) do
		if List1[i1] ~= value1 then
			return false
		end
	end
	return true
end

function UserModule.userPresenceToText(p1, p2) --[[ Line: 105 ]]
	-- upvalues: UserModule (copy)
	local Presence = p2.presence
	local LastLocation = p2.lastLocation
	
	if not Presence then
		return ""
	elseif Presence == UserModule.PresenceType.OFFLINE then
		return p1:Format("Common.Presence.Label.Offline")
	elseif Presence == UserModule.PresenceType.ONLINE then
		return p1:Format("Common.Presence.Label.Online")
	elseif Presence ~= UserModule.PresenceType.IN_GAME and Presence ~= UserModule.PresenceType.IN_STUDIO then return end
	return if LastLocation == nil then p1:Format("Common.Presence.Label.Online") else LastLocation
end

return UserModule
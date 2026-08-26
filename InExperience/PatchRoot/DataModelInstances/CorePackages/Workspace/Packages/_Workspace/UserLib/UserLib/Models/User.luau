local playersService = game:GetService("Players")
local getFFlagInviteListRerank = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags).GetFFlagInviteListRerank
local t = {
	PresenceType = {
		OFFLINE = "OFFLINE",
		ONLINE = "ONLINE",
		IN_GAME = "IN_GAME",
		IN_STUDIO = "IN_STUDIO"
	},
	new = function()
		return {}
	end
}

function t.fromData(p1, p2, p3, p4)
	-- upvalues: t (ref), playersService (ref)
	local var1 = t.new()
	var1.id = tostring(p1)
	var1.isFetching = false
	var1.isFriend = p3
	var1.friendRank = p4 or 0
	var1.lastLocation = nil
	var1.name = p2
	var1.displayName = p2
	var1.externalAppDisplayName = p2
	var1.universeId = nil
	var1.placeId = nil
	var1.rootPlaceId = nil
	var1.gameInstanceId = nil
	var1.presence = playersService.LocalPlayer and (var1.id ~= tostring(playersService.LocalPlayer.UserId) and (t.PresenceType.ONLINE or nil))
	var1.DEPRECATED_thumbnails = nil
	var1.lastOnline = nil
	
	return var1
end

function t.fromDataTable(p1)
	-- upvalues: t (ref), playersService (ref), getFFlagInviteListRerank (ref)
	local var1 = t.new()
	var1.id = tostring(p1.id)
	var1.isFriend = p1.isFriend
	var1.friendRank = p1.friendRank
	var1.presence = playersService.LocalPlayer and (var1.id ~= tostring(playersService.LocalPlayer.UserId) and (t.PresenceType.ONLINE or nil))
	var1.isFetching = false
	var1.lastLocation = nil
	var1.name = p1.name
	var1.displayName = p1.displayName or p1.name
	var1.externalAppDisplayName = p1.externalAppDisplayName
	var1.universeId = nil
	var1.placeId = nil
	var1.rootPlaceId = nil
	var1.gameInstanceId = nil
	var1.DEPRECATED_thumbnails = nil
	var1.lastOnline = nil
	var1.hasVerifiedBadge = p1.hasVerifiedBadge
	
	if getFFlagInviteListRerank() then
		var1.friendFrequentRank = p1.friendFrequentRank
	end
	return var1
end

function t.compare(p1, p2)
	assert(not (p1 == nil and p2 == nil), "user1 and user2 cannot both be nil")
	assert(if p1 ~= nil then typeof(p1) == "table" else true, "user1 must be a table or nil")
	assert(if p2 ~= nil then typeof(p2) == "table" else true, "user2 must be a table or nil")
	
	if not p1 or not p2 then
		return false
	end
	for i, v in pairs(p2) do
		if p1[i] ~= v then
			return false
		end
	end
	for i, v in pairs(p1) do
		if p2[i] ~= v then
			return false
		end
	end
	return true
end

function t.userPresenceToText(p3, p4)
	-- upvalues: t (ref)
	local presence = p4.presence
	local lastLocation = p4.lastLocation
	
	if not presence then
		return ""
	elseif presence == t.PresenceType.OFFLINE then
		return p3:Format("Common.Presence.Label.Offline")
	elseif presence == t.PresenceType.ONLINE then
		return p3:Format("Common.Presence.Label.Online")
	elseif presence ~= t.PresenceType.IN_GAME and presence ~= t.PresenceType.IN_STUDIO then return end
	return if lastLocation == nil then p3:Format("Common.Presence.Label.Online") else lastLocation
end

return t
local playersService = game:GetService("Players")
local getFFlagInviteListRerank = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags).GetFFlagInviteListRerank
local t = {
	PresenceType = {
		OFFLINE = "OFFLINE",
		ONLINE = "ONLINE",
		IN_GAME = "IN_GAME",
		IN_STUDIO = "IN_STUDIO"
	},
	new = function() --[[ line: 17 ]]
		return {}
	end
}

function t.fromData(p0, p1, p2, p3) --[[ line: 25 ]]
	-- upvalues: t (ref), playersService (ref)
	local var2 = t.new()
	var2.id = tostring(p0)
	var2.isFetching = false
	var2.isFriend = p2
	var2.friendRank = p3 or 0
	var2.lastLocation = nil
	var2.name = p1
	var2.displayName = p1
	var2.externalAppDisplayName = p1
	var2.universeId = nil
	var2.placeId = nil
	var2.rootPlaceId = nil
	var2.gameInstanceId = nil
	var2.presence = playersService.LocalPlayer and (var2.id ~= tostring(playersService.LocalPlayer.UserId) and (t.PresenceType.ONLINE or nil))
	var2.DEPRECATED_thumbnails = nil
	var2.lastOnline = nil
	
	return var2
end

function t.fromDataTable(p4) --[[ line: 51 ]]
	-- upvalues: t (ref), playersService (ref), getFFlagInviteListRerank (ref)
	local var3 = t.new()
	var3.id = tostring(p4.id)
	var3.isFriend = p4.isFriend
	var3.friendRank = p4.friendRank
	var3.presence = playersService.LocalPlayer and (var3.id ~= tostring(playersService.LocalPlayer.UserId) and (t.PresenceType.ONLINE or nil))
	var3.isFetching = false
	var3.lastLocation = nil
	var3.name = p4.name
	var3.displayName = p4.displayName or p4.name
	var3.externalAppDisplayName = p4.externalAppDisplayName
	var3.universeId = nil
	var3.placeId = nil
	var3.rootPlaceId = nil
	var3.gameInstanceId = nil
	var3.DEPRECATED_thumbnails = nil
	var3.lastOnline = nil
	var3.hasVerifiedBadge = p4.hasVerifiedBadge
	
	if getFFlagInviteListRerank() then
		var3.friendFrequentRank = p4.friendFrequentRank
	end
	return var3
end

function t.compare(p5, p6) --[[ line: 80 ]]
	assert(not (p5 == nil and p6 == nil), "user1 and user2 cannot both be nil")
	assert(if p5 ~= nil then typeof(p5) == "table" else true, "user1 must be a table or nil")
	assert(if p6 ~= nil then typeof(p6) == "table" else true, "user2 must be a table or nil")
	
	if not p5 or not p6 then
		return false
	end
	for i, v in pairs(p6) do
		if p5[i] ~= v then
			return false
		end
	end
	for i, v in pairs(p5) do
		if p6[i] ~= v then
			return false
		end
	end
	return true
end

function t.userPresenceToText(p7, p8) --[[ line: 105 ]]
	-- upvalues: t (ref)
	local presence = p8.presence
	local lastLocation = p8.lastLocation
	
	if not presence then
		return ""
	elseif presence == t.PresenceType.OFFLINE then
		return p7:Format("Common.Presence.Label.Offline")
	elseif presence == t.PresenceType.ONLINE then
		return p7:Format("Common.Presence.Label.Online")
	elseif presence ~= t.PresenceType.IN_GAME and presence ~= t.PresenceType.IN_STUDIO then return end
	return if lastLocation == nil then p7:Format("Common.Presence.Label.Online") else lastLocation
end

return t
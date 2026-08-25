local userLib = script:FindFirstAncestor("UserLib")
local receivedUserPresenceModule = require(userLib.Actions.ReceivedUserPresence)
local updateFriendPresenceCounts = require(userLib.Parent.LegacyFriendsRodux).Actions.UpdateFriendPresenceCounts
local webPresenceMapModule = require(userLib.Enum.WebPresenceMap)

return function(p0, p1)
	-- upvalues: receivedUserPresenceModule (ref), webPresenceMapModule (ref), updateFriendPresenceCounts (ref)
	for i, v in pairs(p0) do
		local userId = p1:getState().Users[tostring(v.userId)]
		p1:dispatch(receivedUserPresenceModule(tostring(v.userId), webPresenceMapModule[v.userPresenceType], v.lastLocation, v.placeId and tostring(v.placeId) or nil, v.rootPlaceId and tostring(v.rootPlaceId) or nil, v.gameId and tostring(v.gameId) or nil, v.lastOnline and tostring(v.lastOnline) or nil, v.universeId, if userId then userId.universeId else nil))
	end
	local t = {}
	
	for i_1, v_1 in pairs(p1:getState().Users) do
		if v_1.isFriend and v_1.presence then
			t[v_1.presence] = (t[v_1.presence] or 0) + 1
		end
	end
	p1:dispatch(updateFriendPresenceCounts(t))
end
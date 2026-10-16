local UserLib = script:FindFirstAncestor("UserLib")
local ReceivedUserPresenceModule = require(UserLib.Actions.ReceivedUserPresence)
local UpdateFriendPresenceCountsFunction = require(UserLib.Parent.LegacyFriendsRodux).Actions.UpdateFriendPresenceCounts
local WebPresenceMapModule = require(UserLib.Enum.WebPresenceMap)

return function(List, p1) --[[ Line: 8 ]]
	-- upvalues: ReceivedUserPresenceModule (copy), WebPresenceMapModule (copy), UpdateFriendPresenceCountsFunction (copy)
	for _, value in pairs(List) do
		local User = p1:getState().Users[tostring(value.userId)]
		p1:dispatch(ReceivedUserPresenceModule(tostring(value.userId), WebPresenceMapModule[value.userPresenceType], value.lastLocation, value.placeId and tostring(value.placeId) or nil, value.rootPlaceId and tostring(value.rootPlaceId) or nil, value.gameId and tostring(value.gameId) or nil, value.lastOnline and tostring(value.lastOnline) or nil, value.universeId, User and User.universeId or nil))
	end
	local t = {}
	
	for _, user in pairs(p1:getState().Users) do
		if user.isFriend and user.presence then
			t[user.presence] = (t[user.presence] or 0) + 1
		end
	end
	p1:dispatch(UpdateFriendPresenceCountsFunction(t))
end
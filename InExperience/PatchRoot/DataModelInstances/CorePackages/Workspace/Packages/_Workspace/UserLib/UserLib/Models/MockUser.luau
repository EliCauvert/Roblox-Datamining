local userModule = require(script.Parent.User)
local var1 = 0

local _ = function() --[[ line: 7 ]]
	-- upvalues: var1 (write)
	var1 += 1
	
	return tostring(var1)
end

local t = {}
t.__index = t

function t.new() --[[ line: 15 ]]
	-- upvalues: userModule (ref), var1 (write)
	local var3 = userModule.new()
	var1 += 1
	var3.id = tostring(var1)
	var3.isFetching = false
	var3.isFriend = false
	var3.friendRank = 0
	var3.lastLocation = nil
	var3.name = "USER NAME"
	var3.universeId = nil
	var3.placeId = nil
	var3.rootPlaceId = nil
	var3.gameInstanceId = nil
	var3.presence = userModule.PresenceType.OFFLINE
	var3.membership = nil
	var3.thumbnails = nil
	var3.lastOnline = nil
	var3.displayName = "DN+" .. var3.name
	var3.externalAppDisplayName = "EXTERNAL APP DISPLAY NAME"
	var3.hasVerifiedBadge = false
	var3.hasRobloxSubscription = false
	setmetatable(var3, { __index = userModule })
	
	return var3
end

function t.mockEndpointResponse() --[[ line: 45 ]]
	return {
		created = "0001-01-01T06:00:00Z",
		displayName = "DN+12345",
		friendFrequentRank = 1,
		friendFrequentScore = 2,
		id = 12345,
		isBanned = false,
		isDeleted = false,
		isOnline = false,
		name = "USER NAME",
		presenceType = 0,
		hasVerifiedBadge = false
	}
end

return t
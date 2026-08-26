local userModule = require(script.Parent.User)
local var1 = 0

local _ = function()
	-- upvalues: var1 (write)
	var1 += 1
	
	return tostring(var1)
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: userModule (ref), var1 (write)
	local var2 = userModule.new()
	var1 += 1
	var2.id = tostring(var1)
	var2.isFetching = false
	var2.isFriend = false
	var2.friendRank = 0
	var2.lastLocation = nil
	var2.name = "USER NAME"
	var2.universeId = nil
	var2.placeId = nil
	var2.rootPlaceId = nil
	var2.gameInstanceId = nil
	var2.presence = userModule.PresenceType.OFFLINE
	var2.membership = nil
	var2.thumbnails = nil
	var2.lastOnline = nil
	var2.displayName = "DN+" .. var3.name
	var2.externalAppDisplayName = "EXTERNAL APP DISPLAY NAME"
	var2.hasVerifiedBadge = false
	var2.hasRobloxSubscription = false
	setmetatable(var2, { __index = userModule })
	
	return var2
end

function t.mockEndpointResponse()
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
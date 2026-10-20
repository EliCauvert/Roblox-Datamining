local UserModule = require(script.Parent.User)
local Count = 0

local function _(): string
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end

local MockUserModule = {}
MockUserModule.__index = MockUserModule

function MockUserModule.new()
	-- upvalues: UserModule (copy), Count (ref)
	local NewUser = UserModule.new()
	Count += 1
	NewUser.id = tostring(Count)
	NewUser.isFetching = false
	NewUser.isFriend = false
	NewUser.friendRank = 0
	NewUser.lastLocation = nil
	NewUser.name = "USER NAME"
	NewUser.universeId = nil
	NewUser.placeId = nil
	NewUser.rootPlaceId = nil
	NewUser.gameInstanceId = nil
	NewUser.presence = UserModule.PresenceType.OFFLINE
	NewUser.membership = nil
	NewUser.thumbnails = nil
	NewUser.lastOnline = nil
	NewUser.displayName = "DN+" .. NewUser.name
	NewUser.externalAppDisplayName = "EXTERNAL APP DISPLAY NAME"
	NewUser.hasVerifiedBadge = false
	NewUser.hasRobloxSubscription = false
	setmetatable(NewUser, { __index = UserModule })
	
	return NewUser
end

function MockUserModule.mockEndpointResponse()
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

return MockUserModule
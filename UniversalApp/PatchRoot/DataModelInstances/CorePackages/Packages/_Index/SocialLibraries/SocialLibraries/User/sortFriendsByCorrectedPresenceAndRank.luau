local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local UserModel = DependenciesModule.UserModel
local T = DependenciesModule.t
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local config = {
	[PresenceType.InGame.rawValue()] = 3,
	[PresenceType.Online.rawValue()] = 2,
	[PresenceType.InStudio.rawValue()] = 1,
	[PresenceType.Offline.rawValue()] = 0
}
local config1 = {
	[UserModel.PresenceType.IN_GAME] = 3,
	[UserModel.PresenceType.ONLINE] = 2,
	[UserModel.PresenceType.IN_STUDIO] = 1,
	[UserModel.PresenceType.OFFLINE] = 0
}

local function _(p1)
	-- upvalues: PresenceType (copy)
	local UserPresenceType = p1.userPresenceType
	local LastLocation = p1.lastLocation or ""
	
	return if (UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio) and #LastLocation == 0 then PresenceType.Online.rawValue() else UserPresenceType.rawValue()
end

local _ = function(p1)
	-- upvalues: UserModel (copy)
	local Presence = p1.presence
	local LastLocation = p1.lastLocation or ""
	
	return if (Presence == UserModel.PresenceType.IN_GAME or Presence == UserModel.PresenceType.IN_STUDIO) and #LastLocation == 0 then UserModel.PresenceType.ONLINE else Presence
end

local _ = function(p1)
	-- upvalues: PresenceType (copy), T (copy), config (copy)
	local UserPresenceType = p1.userPresenceType
	local LastLocation = p1.lastLocation or ""
	local RawValueResult = if (UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio) and #LastLocation == 0 then PresenceType.Online.rawValue() else UserPresenceType.rawValue()
	
	return T.number(RawValueResult) and config[RawValueResult] or config[PresenceType.Offline]
end

local _ = function(p1)
	-- upvalues: UserModel (copy), T (copy), config1 (copy)
	local Presence = p1.presence
	local LastLocation = p1.lastLocation or ""
	local ONLINE = if (Presence == UserModel.PresenceType.IN_GAME or Presence == UserModel.PresenceType.IN_STUDIO) and #LastLocation == 0 then UserModel.PresenceType.ONLINE else Presence
	
	return T.string(ONLINE) and config1[ONLINE] or config1[UserModel.PresenceType.OFFLINE]
end

local _ = function(p1, p2)
	-- upvalues: PresenceType (copy), T (copy), config (copy), UserModel (copy), config1 (copy)
	local v1 = 0
	local v2 = 0
	repeat
		if p1.userPresenceType and p2.userPresenceType then
			local UserPresenceType = p1.userPresenceType
			local LastLocation = p1.lastLocation or ""
			local RawValueResult = if (UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio) and #LastLocation == 0 then PresenceType.Online.rawValue() else UserPresenceType.rawValue()
			v1 = T.number(RawValueResult) and config[RawValueResult] or config[PresenceType.Offline]
			local UserPresenceType1 = p2.userPresenceType
			local LastLocation1 = p2.lastLocation or ""
			local RawValueResult1 = nil
			
			if (UserPresenceType1 == PresenceType.InGame or UserPresenceType1 == PresenceType.InStudio) and #LastLocation1 == 0 then
				RawValueResult1 = PresenceType.Online.rawValue()
			else
				RawValueResult1 = UserPresenceType1.rawValue()
			end
			if T.number(RawValueResult1) then
				v2 = config[RawValueResult1]
				
				if v2 then break end
			end
			v2 = config[PresenceType.Offline]
			
			return v1, v2
		end
		if not p1.presence or not p2.presence then break end
		local Presence = p1.presence
		local LastLocation = p1.lastLocation or ""
		local ONLINE = if (Presence == UserModel.PresenceType.IN_GAME or Presence == UserModel.PresenceType.IN_STUDIO) and #LastLocation == 0 then UserModel.PresenceType.ONLINE else Presence
		v1 = T.string(ONLINE) and config1[ONLINE] or config1[UserModel.PresenceType.OFFLINE]
		local Presence1 = p2.presence
		local LastLocation2 = p2.lastLocation or ""
		local ONLINE1 = if (Presence1 == UserModel.PresenceType.IN_GAME or Presence1 == UserModel.PresenceType.IN_STUDIO) and #LastLocation2 == 0 then UserModel.PresenceType.ONLINE else Presence1
		v2 = T.string(ONLINE1) and config1[ONLINE1] or config1[UserModel.PresenceType.OFFLINE]
	until true
	return v1, v2
end

local _ = function(p1, p2)
	return p1.username or (p1.name or ""), p2.username or (p2.name or "")
end

return function(p1, p2): boolean
	-- upvalues: PresenceType (copy), T (copy), config (copy), UserModel (copy), config1 (copy)
	local v1 = 0
	local v2 = 0
	
	if p1.userPresenceType and p2.userPresenceType then
		local UserPresenceType = p1.userPresenceType
		local LastLocation = p1.lastLocation or ""
		local RawValueResult = if (UserPresenceType == PresenceType.InGame or UserPresenceType == PresenceType.InStudio) and #LastLocation == 0 then PresenceType.Online.rawValue() else UserPresenceType.rawValue()
		v1 = T.number(RawValueResult) and config[RawValueResult] or config[PresenceType.Offline]
		local UserPresenceType1 = p2.userPresenceType
		local LastLocation1 = p2.lastLocation or ""
		local RawValueResult1 = if (UserPresenceType1 == PresenceType.InGame or UserPresenceType1 == PresenceType.InStudio) and #LastLocation1 == 0 then PresenceType.Online.rawValue() else UserPresenceType1.rawValue()
		v2 = T.number(RawValueResult1) and config[RawValueResult1] or config[PresenceType.Offline]
	elseif p1.presence and p2.presence then
		local Presence = p1.presence
		local LastLocation = p1.lastLocation or ""
		local ONLINE = if (Presence == UserModel.PresenceType.IN_GAME or Presence == UserModel.PresenceType.IN_STUDIO) and #LastLocation == 0 then UserModel.PresenceType.ONLINE else Presence
		v1 = T.string(ONLINE) and config1[ONLINE] or config1[UserModel.PresenceType.OFFLINE]
		local Presence1 = p2.presence
		local LastLocation2 = p2.lastLocation or ""
		local ONLINE1 = if (Presence1 == UserModel.PresenceType.IN_GAME or Presence1 == UserModel.PresenceType.IN_STUDIO) and #LastLocation2 == 0 then UserModel.PresenceType.ONLINE else Presence1
		v2 = T.string(ONLINE1) and config1[ONLINE1] or config1[UserModel.PresenceType.OFFLINE]
	end
	local v3: number = v1
	local v4: number = v2
	
	if v3 ~= v4 then
		return v4 < v3
	end
	local FriendRank = T.number(p1.friendRank) and p1.friendRank or 0
	local FriendRank1 = T.number(p2.friendRank) and p2.friendRank or 0
	
	if FriendRank == FriendRank1 then
		local DisplayName = T.string(p1.displayName) and p1.displayName or ""
		local DisplayName1 = T.string(p2.displayName) and p2.displayName or ""
		
		return if string.lower(DisplayName) == string.lower(DisplayName1) then string.lower(p1.username or (p1.name or "")) < string.lower(p2.username or (p2.name or "")) else string.lower(DisplayName) < string.lower(DisplayName1)
	else
		return FriendRank < FriendRank1
	end
end
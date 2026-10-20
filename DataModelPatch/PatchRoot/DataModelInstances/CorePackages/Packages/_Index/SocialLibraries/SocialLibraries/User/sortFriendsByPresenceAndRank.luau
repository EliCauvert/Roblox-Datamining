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
	-- upvalues: T (copy), config (copy), PresenceType (copy)
	return T.number(p1) and config[p1] or config[PresenceType.Offline]
end

local _ = function(p1)
	-- upvalues: T (copy), config1 (copy), UserModel (copy)
	return T.string(p1) and config1[p1] or config1[UserModel.PresenceType.OFFLINE]
end

local function v8(p1, p2)
	-- upvalues: T (copy), config (copy), PresenceType (copy), config1 (copy), UserModel (copy)
	local v1 = 0
	local v2 = 0
	repeat
		if p1.userPresenceType and p2.userPresenceType then
			local RawValueResult = p1.userPresenceType.rawValue()
			v1 = T.number(RawValueResult) and config[RawValueResult] or config[PresenceType.Offline]
			local RawValueResult1 = p2.userPresenceType.rawValue()
			
			if T.number(RawValueResult1) then
				v2 = config[RawValueResult1]
				
				if v2 then break end
			end
			v2 = config[PresenceType.Offline]
			
			return v1, v2
		end
		if not p1.presence or not p2.presence then break end
		local Presence = p1.presence
		v1 = T.string(Presence) and config1[Presence] or config1[UserModel.PresenceType.OFFLINE]
		local Presence1 = p2.presence
		v2 = T.string(Presence1) and config1[Presence1] or config1[UserModel.PresenceType.OFFLINE]
	until true
	return v1, v2
end

local _ = function(p1, p2)
	return p1.username or (p1.name or ""), p2.username or (p2.name or "")
end

return function(p1, p2): boolean
	-- upvalues: v8 (copy), T (copy)
	local v1, v2 = v8(p1, p2)
	
	if v1 ~= v2 then
		return v2 < v1
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
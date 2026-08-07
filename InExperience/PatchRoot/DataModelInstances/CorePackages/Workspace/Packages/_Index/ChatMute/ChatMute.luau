local getMutedUsersStoreModule = require(script.GetMutedUsersStore)

local function _() --[[ line: 3 | named "store" ]]
	-- upvalues: getMutedUsersStoreModule (ref)
	return getMutedUsersStoreModule(false)
end

return {
	mutePlayer = function(p0) --[[ line: 16 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		if p0.userId then
			getMutedUsersStoreModule(false).muteGlobalUserId(p0.userId)
		end
		if p0.username then
			getMutedUsersStoreModule(false).muteGlobalUsername(p0.username)
		end
		if p0.displayName then
			getMutedUsersStoreModule(false).muteGlobalDisplayName(p0.displayName)
		end
	end,
	unmutePlayer = function(p1) --[[ line: 28 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		if p1.userId then
			getMutedUsersStoreModule(false).unmuteGlobalUserId(p1.userId)
		end
		if p1.username then
			getMutedUsersStoreModule(false).unmuteGlobalUsername(p1.username)
		end
		if p1.displayName then
			getMutedUsersStoreModule(false).unmuteGlobalDisplayName(p1.displayName)
		end
	end,
	isUserIdMuted = function(p2) --[[ line: 41 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).isUserIdMuted(p2)
	end,
	isUsernameMuted = function(p3) --[[ line: 44 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).isUsernameMuted(p3)
	end,
	isDisplayNameMuted = function(p4) --[[ line: 47 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).isDisplayNameMuted(p4)
	end,
	getMutedUserIds = function() --[[ line: 52 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).getMutedUserIds
	end,
	getMutedUsernames = function() --[[ line: 55 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).getMutedUsernames
	end,
	getMutedDisplayNames = function() --[[ line: 58 ]]
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).getMutedDisplayNames
	end,
	resolveMuteTarget = require(script.resolveMuteTarget),
	resolveUnmuteTarget = require(script.resolveUnmuteTarget),
	getPlayersFromService = require(script.getPlayersFromService),
	["jest.config"] = script["jest.config"]
}
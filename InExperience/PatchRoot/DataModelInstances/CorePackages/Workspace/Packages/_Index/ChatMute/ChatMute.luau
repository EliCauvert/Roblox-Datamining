local getMutedUsersStoreModule = require(script.GetMutedUsersStore)

local function _()
	-- upvalues: getMutedUsersStoreModule (ref)
	return getMutedUsersStoreModule(false)
end

return {
	mutePlayer = function(p1)
		-- upvalues: getMutedUsersStoreModule (ref)
		if p1.userId then
			getMutedUsersStoreModule(false).muteGlobalUserId(p1.userId)
		end
		if p1.username then
			getMutedUsersStoreModule(false).muteGlobalUsername(p1.username)
		end
		if p1.displayName then
			getMutedUsersStoreModule(false).muteGlobalDisplayName(p1.displayName)
		end
	end,
	unmutePlayer = function(p1)
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
	isUserIdMuted = function(p1)
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).isUserIdMuted(p1)
	end,
	isUsernameMuted = function(p1)
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).isUsernameMuted(p1)
	end,
	isDisplayNameMuted = function(p1)
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).isDisplayNameMuted(p1)
	end,
	getMutedUserIds = function()
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).getMutedUserIds
	end,
	getMutedUsernames = function()
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).getMutedUsernames
	end,
	getMutedDisplayNames = function()
		-- upvalues: getMutedUsersStoreModule (ref)
		return getMutedUsersStoreModule(false).getMutedDisplayNames
	end,
	resolveMuteTarget = require(script.resolveMuteTarget),
	resolveUnmuteTarget = require(script.resolveUnmuteTarget),
	getPlayersFromService = require(script.getPlayersFromService),
	["jest.config"] = script["jest.config"]
}
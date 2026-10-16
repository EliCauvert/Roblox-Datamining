local GetMutedUsersStoreModule = require(script.GetMutedUsersStore)

local function _() --[[ Line: 3 | Named "store" ]]
	-- upvalues: GetMutedUsersStoreModule (copy)
	return GetMutedUsersStoreModule(false)
end

return {
	mutePlayer = function(p1) --[[ Line: 16 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		if p1.userId then
			GetMutedUsersStoreModule(false).muteGlobalUserId(p1.userId)
		end
		if p1.username then
			GetMutedUsersStoreModule(false).muteGlobalUsername(p1.username)
		end
		if p1.displayName then
			GetMutedUsersStoreModule(false).muteGlobalDisplayName(p1.displayName)
		end
	end,
	unmutePlayer = function(p1) --[[ Line: 28 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		if p1.userId then
			GetMutedUsersStoreModule(false).unmuteGlobalUserId(p1.userId)
		end
		if p1.username then
			GetMutedUsersStoreModule(false).unmuteGlobalUsername(p1.username)
		end
		if p1.displayName then
			GetMutedUsersStoreModule(false).unmuteGlobalDisplayName(p1.displayName)
		end
	end,
	isUserIdMuted = function(p1) --[[ Line: 41 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		return GetMutedUsersStoreModule(false).isUserIdMuted(p1)
	end,
	isUsernameMuted = function(p1) --[[ Line: 44 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		return GetMutedUsersStoreModule(false).isUsernameMuted(p1)
	end,
	isDisplayNameMuted = function(p1) --[[ Line: 47 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		return GetMutedUsersStoreModule(false).isDisplayNameMuted(p1)
	end,
	getMutedUserIds = function() --[[ Line: 52 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		return GetMutedUsersStoreModule(false).getMutedUserIds
	end,
	getMutedUsernames = function() --[[ Line: 55 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		return GetMutedUsersStoreModule(false).getMutedUsernames
	end,
	getMutedDisplayNames = function() --[[ Line: 58 ]]
		-- upvalues: GetMutedUsersStoreModule (copy)
		return GetMutedUsersStoreModule(false).getMutedDisplayNames
	end,
	resolveMuteTarget = require(script.resolveMuteTarget),
	resolveUnmuteTarget = require(script.resolveUnmuteTarget),
	getPlayersFromService = require(script.getPlayersFromService),
	["jest.config"] = script["jest.config"]
}
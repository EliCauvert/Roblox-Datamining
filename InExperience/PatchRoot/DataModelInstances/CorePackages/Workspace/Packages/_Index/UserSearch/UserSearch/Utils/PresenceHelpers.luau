local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local _ = require(userSearch.Common.LocalTypes)
local presenceType = require(userSearch.Rodux.RoduxPresence).Enums.PresenceType
local fFlagUserSearchPresenceStoreMigrationModule = require(userSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local var1 = if fFlagUserSearchPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil

return {
	isUserOnline = function(p1)
		-- upvalues: fFlagUserSearchPresenceStoreMigrationModule (ref), var1 (ref), presenceType (ref)
		return if fFlagUserSearchPresenceStoreMigrationModule then if p1 ~= var1.Online then if p1 ~= var1.InStudio then p1 == var1.InGame else true else true elseif p1 ~= presenceType.Online then if p1 ~= presenceType.InStudio then p1 == presenceType.InGame else true else true
	end,
	isUserInGame = function(p1)
		-- upvalues: fFlagUserSearchPresenceStoreMigrationModule (ref), var1 (ref), presenceType (ref)
		return not (not p1 or not p1.universeId) and (if fFlagUserSearchPresenceStoreMigrationModule then p1.userPresenceType == var1.InGame else p1.userPresenceType == presenceType.InGame)
	end
}
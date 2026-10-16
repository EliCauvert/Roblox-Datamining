local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local _ = require(UserSearch.Common.LocalTypes)
local PresenceType = require(UserSearch.Rodux.RoduxPresence).Enums.PresenceType
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local PresenceType1 = if FFlagUserSearchPresenceStoreMigrationModule then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil

return {
	isUserOnline = function(InGame): boolean --[[ Line: 13 ]]
		-- upvalues: FFlagUserSearchPresenceStoreMigrationModule (copy), PresenceType1 (copy), PresenceType (copy)
		return if FFlagUserSearchPresenceStoreMigrationModule then InGame == PresenceType1.Online or (InGame == PresenceType1.InStudio or InGame == PresenceType1.InGame) else InGame == PresenceType.Online or (InGame == PresenceType.InStudio or InGame == PresenceType.InGame)
	end,
	isUserInGame = function(p1): boolean --[[ Line: 29 ]]
		-- upvalues: FFlagUserSearchPresenceStoreMigrationModule (copy), PresenceType1 (copy), PresenceType (copy)
		return if p1 and p1.universeId then if FFlagUserSearchPresenceStoreMigrationModule then p1.userPresenceType == PresenceType1.InGame else p1.userPresenceType == PresenceType.InGame else false
	end
}
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local PresenceType = require(Squads.dependencies).RoduxPresence.Enums.PresenceType
local FFlagSquadMemberJoinDialogAndOverflowMenuModule = require(Squads.Flags.FFlagSquadMemberJoinDialogAndOverflowMenu)
local FFlagSquadsPresenceStoreMigration = require(Parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local PresenceType1 = if FFlagSquadsPresenceStoreMigration then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil

return function(p1): boolean
	-- upvalues: FFlagSquadsPresenceStoreMigration (copy), PresenceType1 (copy), PresenceType (copy), FFlagSquadMemberJoinDialogAndOverflowMenuModule (copy)
	return if p1 and (p1.userPresenceType == (if FFlagSquadsPresenceStoreMigration then PresenceType1.InGame else PresenceType.InGame) and p1.gameId ~= game.JobId) then if FFlagSquadMemberJoinDialogAndOverflowMenuModule then p1.placeId ~= nil and p1.placeId ~= "" elseif FFlagSquadsPresenceStoreMigration then p1.placeId ~= "" else p1.placeId ~= nil else false
end
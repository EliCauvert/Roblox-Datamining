local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local PresenceTypes = require(GameJoinCard.Parent.SocialCommon).Enums.PresenceTypes
local UniverseSourceModule = require(GameJoinCard.Enums.UniverseSource)

return function(Enabled, UniverseId, InGame, p1)
	-- upvalues: PresenceTypes (copy), UniverseSourceModule (copy)
	local Text: string = if p1 == nil then "" else tostring(p1)
	
	return if InGame == PresenceTypes.InGame and Text ~= "" then {
		universeId = Text,
		source = UniverseSourceModule.Presence
	} elseif Enabled == true and UniverseId ~= nil and UniverseId ~= "" then {
		universeId = UniverseId,
		source = UniverseSourceModule.Coplay
	} else {
		universeId = Text,
		source = UniverseSourceModule.Presence
	}
end
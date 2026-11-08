local IsInThisServerModule = require(script.Parent.isInThisServer)
local InGame = require(script:FindFirstAncestor("GameInvite").Parent.DataHydration).Presence.PresenceEnums.PresenceType.InGame

local function _(p1, UniverseId): boolean
	return UniverseId ~= "" and (UniverseId ~= "0" and p1.universeId == UniverseId)
end

local _ = function(p1, p2): boolean
	-- upvalues: IsInThisServerModule (copy)
	return p2 ~= "" and (p1.gameId ~= "" and not IsInThisServerModule(p1, p2))
end

return function(p1, UniverseId, p2): boolean
	-- upvalues: InGame (copy), IsInThisServerModule (copy)
	return p1 ~= nil and (p1.userPresenceType == InGame and (UniverseId ~= "" and (UniverseId ~= "0" and p1.universeId == UniverseId and (p2 ~= "" and (p1.gameId ~= "" and not IsInThisServerModule(p1, p2))))))
end
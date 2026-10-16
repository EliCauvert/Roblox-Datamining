local Parent = script.Parent.Parent.Parent
local PresenceTypes = require(Parent.Analytics.Enums).PresenceTypes
local PresenceType = require(Parent.dependencies).RoduxPresence.Enums.PresenceType
local config = {
	[PresenceType.InGame] = PresenceTypes.InGame,
	[PresenceType.InStudio] = PresenceTypes.InStudio,
	[PresenceType.Offline] = PresenceTypes.Offline,
	[PresenceType.Online] = PresenceTypes.Online
}

return function(p1) --[[ Line: 15 ]]
	-- upvalues: PresenceTypes (copy), config (copy)
	return if p1 then if type(p1) == "string" and p1 ~= "" then PresenceTypes[p1] else config[p1] else nil
end
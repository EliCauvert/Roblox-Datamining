local parent = script.Parent.Parent.Parent
local presenceTypes = require(parent.Analytics.Enums).PresenceTypes
local presenceType = require(parent.dependencies).RoduxPresence.Enums.PresenceType
local t = {
	[presenceType.InGame] = presenceTypes.InGame,
	[presenceType.InStudio] = presenceTypes.InStudio,
	[presenceType.Offline] = presenceTypes.Offline,
	[presenceType.Online] = presenceTypes.Online
}

return function(p1)
	-- upvalues: presenceTypes (ref), t (ref)
	return if p1 then if type(p1) == "string" and p1 ~= "" then presenceTypes[p1] else t[p1] else nil
end
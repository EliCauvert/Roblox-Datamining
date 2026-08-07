local parent = script.Parent.Parent.Parent
local presenceTypes = require(parent.Analytics.Enums).PresenceTypes
local presenceType = require(parent.dependencies).RoduxPresence.Enums.PresenceType
local t = {
	[presenceType.InGame] = presenceTypes.InGame,
	[presenceType.InStudio] = presenceTypes.InStudio,
	[presenceType.Offline] = presenceTypes.Offline,
	[presenceType.Online] = presenceTypes.Online
}

return function(p0) --[[ line: 15 ]]
	-- upvalues: presenceTypes (ref), t (ref)
	return if p0 then if type(p0) == "string" and p0 ~= "" then presenceTypes[p0] else t[p0] else nil
end
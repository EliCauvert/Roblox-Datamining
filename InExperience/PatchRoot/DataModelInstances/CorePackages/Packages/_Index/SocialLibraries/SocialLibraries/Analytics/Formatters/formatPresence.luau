local parent = script.Parent.Parent.Parent
local presenceTypes = require(parent.Analytics.Enums).PresenceTypes
local presenceType = require(parent.dependencies).RoduxPresence.Enums.PresenceType
local t = {
	[presenceType.InGame] = presenceTypes.InGame.rawValue(),
	[presenceType.InStudio] = presenceTypes.InStudio.rawValue(),
	[presenceType.Offline] = presenceTypes.Offline.rawValue(),
	[presenceType.Online] = presenceTypes.Online.rawValue()
}

return function(p0) --[[ line: 15 ]]
	-- upvalues: t (ref)
	return t[p0]
end
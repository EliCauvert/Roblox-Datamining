local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local PresenceTypes = require(Parent.Analytics.Enums).PresenceTypes
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local config = {
	[PresenceType.InGame] = PresenceTypes.InGame.rawValue(),
	[PresenceType.InStudio] = PresenceTypes.InStudio.rawValue(),
	[PresenceType.Offline] = PresenceTypes.Offline.rawValue(),
	[PresenceType.Online] = PresenceTypes.Online.rawValue()
}

return function(p1)
	-- upvalues: config (copy)
	return config[p1]
end
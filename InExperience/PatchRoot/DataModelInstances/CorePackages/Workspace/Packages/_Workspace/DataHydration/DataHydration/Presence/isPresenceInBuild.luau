local LocationTypeModule = require(script.Parent.Enums.LocationType)
local PresenceTypeModule = require(script.Parent.Enums.PresenceType)
local _ = require(script.Parent.normalizePresenceRawData)

return function(p1): boolean
	-- upvalues: PresenceTypeModule (copy), LocationTypeModule (copy)
	return p1 ~= nil and (p1.userPresenceType == PresenceTypeModule.Online and p1.locationType == LocationTypeModule.Build)
end
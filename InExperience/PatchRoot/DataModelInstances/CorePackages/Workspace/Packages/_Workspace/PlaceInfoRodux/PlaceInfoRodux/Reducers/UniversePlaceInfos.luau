local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local parent = placeInfoRodux.Parent
local immutable = require(parent.AppCommonLib).Immutable
local receivedPlacesInfos = require(placeInfoRodux.Actions).ReceivedPlacesInfos
local convertUniverseIdToString = require(parent.SharedFlags).ConvertUniverseIdToString

return function(p0, p1)
	-- upvalues: receivedPlacesInfos (ref), convertUniverseIdToString (ref), immutable (ref)
	p0 = p0 or {}
	
	if p1.type == receivedPlacesInfos.name then
		for i, v in pairs(p1.placesInfos) do
			p0 = immutable.Set(p0, convertUniverseIdToString(v.universeId), v)
		end
	end
	return p0
end
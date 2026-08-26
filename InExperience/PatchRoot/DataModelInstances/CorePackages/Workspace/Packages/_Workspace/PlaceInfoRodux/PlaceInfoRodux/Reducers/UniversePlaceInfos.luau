local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local parent = placeInfoRodux.Parent
local immutable = require(parent.AppCommonLib).Immutable
local receivedPlacesInfos = require(placeInfoRodux.Actions).ReceivedPlacesInfos
local convertUniverseIdToString = require(parent.SharedFlags).ConvertUniverseIdToString

return function(p1, p2)
	-- upvalues: receivedPlacesInfos (ref), convertUniverseIdToString (ref), immutable (ref)
	p1 = p1 or {}
	
	if p2.type == receivedPlacesInfos.name then
		for i, v in pairs(p2.placesInfos) do
			p1 = immutable.Set(p1, convertUniverseIdToString(v.universeId), v)
		end
	end
	return p1
end
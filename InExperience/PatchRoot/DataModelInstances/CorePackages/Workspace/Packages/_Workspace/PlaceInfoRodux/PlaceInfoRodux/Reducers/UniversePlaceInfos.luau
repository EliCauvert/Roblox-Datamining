local PlaceInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local Parent = PlaceInfoRodux.Parent
local Immutable = require(Parent.AppCommonLib).Immutable
local ReceivedPlacesInfos = require(PlaceInfoRodux.Actions).ReceivedPlacesInfos
local ConvertUniverseIdToStringFunction = require(Parent.SharedFlags).ConvertUniverseIdToString

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: ReceivedPlacesInfos (copy), ConvertUniverseIdToStringFunction (copy), Immutable (copy)
	local P0 = p1 or {}
	
	if p2.type == ReceivedPlacesInfos.name then
		for _, placesInfo in pairs(p2.placesInfos) do
			P0 = Immutable.Set(P0, ConvertUniverseIdToStringFunction(placesInfo.universeId), placesInfo)
		end
	end
	return P0
end
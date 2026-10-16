local PlaceInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local Immutable = require(PlaceInfoRodux.Parent.AppCommonLib).Immutable
local RequestMultiplePlaceInfos = require(PlaceInfoRodux.Actions).RequestMultiplePlaceInfos
local FailedToFetchMultiplePlaceInfos = require(PlaceInfoRodux.Actions).FailedToFetchMultiplePlaceInfos
local ReceivedMultiplePlaceInfos = require(PlaceInfoRodux.Actions).ReceivedMultiplePlaceInfos

return function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: RequestMultiplePlaceInfos (copy), Immutable (copy), ReceivedMultiplePlaceInfos (copy), FailedToFetchMultiplePlaceInfos (copy)
	local P0 = p1 or {}
	
	if p2.type == RequestMultiplePlaceInfos.name then
		local t = {}
		
		for _, placeId in ipairs(p2.placeIds) do
			t[placeId] = true
		end
		return Immutable.JoinDictionaries(P0, t)
	elseif p2.type == ReceivedMultiplePlaceInfos.name then
		local t = {}
		
		for _, placeInfo in ipairs(p2.placeInfos) do
			t[placeInfo.placeId] = false
		end
		return Immutable.JoinDictionaries(P0, t)
	else
		if p2.type ~= FailedToFetchMultiplePlaceInfos.name then
			return P0
		end
		local t = {}
		
		for _, placeId1 in ipairs(p2.placeIds) do
			t[placeId1] = false
		end
		return Immutable.JoinDictionaries(P0, t)
	end
end
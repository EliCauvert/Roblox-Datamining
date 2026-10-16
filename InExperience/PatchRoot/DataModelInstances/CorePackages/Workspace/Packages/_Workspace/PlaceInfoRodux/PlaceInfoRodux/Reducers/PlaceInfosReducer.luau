local PlaceInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local ReceivedMultiplePlaceInfos = require(PlaceInfoRodux.Actions).ReceivedMultiplePlaceInfos
local Immutable = require(PlaceInfoRodux.Parent.AppCommonLib).Immutable

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: ReceivedMultiplePlaceInfos (copy), Immutable (copy)
	local P0 = p1 or {}
	
	if p2.type == ReceivedMultiplePlaceInfos.name then
		local t = {}
		
		for _, placeInfo in ipairs(p2.placeInfos) do
			t[placeInfo.placeId] = placeInfo
		end
		P0 = Immutable.JoinDictionaries(P0, t)
	end
	return P0
end
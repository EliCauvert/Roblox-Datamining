local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local immutable = require(placeInfoRodux.Parent.AppCommonLib).Immutable
local requestMultiplePlaceInfos = require(placeInfoRodux.Actions).RequestMultiplePlaceInfos
local failedToFetchMultiplePlaceInfos = require(placeInfoRodux.Actions).FailedToFetchMultiplePlaceInfos
local receivedMultiplePlaceInfos = require(placeInfoRodux.Actions).ReceivedMultiplePlaceInfos

return function(p1, p2)
	-- upvalues: requestMultiplePlaceInfos (ref), immutable (ref), receivedMultiplePlaceInfos (ref), failedToFetchMultiplePlaceInfos (ref)
	p1 = p1 or {}
	
	if p2.type == requestMultiplePlaceInfos.name then
		local t = {}
		
		for i, v in ipairs(p2.placeIds) do
			t[v] = true
		end
		return immutable.JoinDictionaries(p1, t)
	elseif p2.type == receivedMultiplePlaceInfos.name then
		local t = {}
		
		for i, v in ipairs(p2.placeInfos) do
			t[v.placeId] = false
		end
		return immutable.JoinDictionaries(p1, t)
	elseif p2.type ~= failedToFetchMultiplePlaceInfos.name then
		return p1
	end
	local t = {}
	
	for i, v in ipairs(p2.placeIds) do
		t[v] = false
	end
	return immutable.JoinDictionaries(p1, t)
end
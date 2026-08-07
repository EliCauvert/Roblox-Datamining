local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local immutable = require(placeInfoRodux.Parent.AppCommonLib).Immutable
local requestMultiplePlaceInfos = require(placeInfoRodux.Actions).RequestMultiplePlaceInfos
local failedToFetchMultiplePlaceInfos = require(placeInfoRodux.Actions).FailedToFetchMultiplePlaceInfos
local receivedMultiplePlaceInfos = require(placeInfoRodux.Actions).ReceivedMultiplePlaceInfos

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: requestMultiplePlaceInfos (ref), immutable (ref), receivedMultiplePlaceInfos (ref), failedToFetchMultiplePlaceInfos (ref)
	p0 = p0 or {}
	
	if p1.type == requestMultiplePlaceInfos.name then
		local t = {}
		
		for i, v in ipairs(p1.placeIds) do
			t[v] = true
		end
		return immutable.JoinDictionaries(p0, t)
	elseif p1.type == receivedMultiplePlaceInfos.name then
		local t = {}
		
		for i, v in ipairs(p1.placeInfos) do
			t[v.placeId] = false
		end
		return immutable.JoinDictionaries(p0, t)
	elseif p1.type ~= failedToFetchMultiplePlaceInfos.name then
		return p0
	end
	local t = {}
	
	for i, v in ipairs(p1.placeIds) do
		t[v] = false
	end
	return immutable.JoinDictionaries(p0, t)
end
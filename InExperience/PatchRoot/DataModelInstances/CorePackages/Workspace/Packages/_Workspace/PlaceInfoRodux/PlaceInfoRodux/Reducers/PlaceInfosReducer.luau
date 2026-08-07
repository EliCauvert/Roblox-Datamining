local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local receivedMultiplePlaceInfos = require(placeInfoRodux.Actions).ReceivedMultiplePlaceInfos
local immutable = require(placeInfoRodux.Parent.AppCommonLib).Immutable

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: receivedMultiplePlaceInfos (ref), immutable (ref)
	p0 = p0 or {}
	
	if p1.type == receivedMultiplePlaceInfos.name then
		local t = {}
		
		for i, v in ipairs(p1.placeInfos) do
			t[v.placeId] = v
		end
		p0 = immutable.JoinDictionaries(p0, t)
	end
	return p0
end
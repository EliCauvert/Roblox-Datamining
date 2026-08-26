local placeInfoRodux = script:FindFirstAncestor("PlaceInfoRodux")
local receivedMultiplePlaceInfos = require(placeInfoRodux.Actions).ReceivedMultiplePlaceInfos
local immutable = require(placeInfoRodux.Parent.AppCommonLib).Immutable

return function(p1, p2)
	-- upvalues: receivedMultiplePlaceInfos (ref), immutable (ref)
	p1 = p1 or {}
	
	if p2.type == receivedMultiplePlaceInfos.name then
		local t = {}
		
		for i, v in ipairs(p2.placeInfos) do
			t[v.placeId] = v
		end
		p1 = immutable.JoinDictionaries(p1, t)
	end
	return p1
end
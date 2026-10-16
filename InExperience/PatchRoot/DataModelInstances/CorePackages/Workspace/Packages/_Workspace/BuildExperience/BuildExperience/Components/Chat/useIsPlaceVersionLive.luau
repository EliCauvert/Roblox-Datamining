local Parent = script:FindFirstAncestor("BuildExperience").Parent
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function(p1, Number): boolean --[[ Line: 14 | Named "useIsPlaceVersionLive" ]]
	-- upvalues: PlaceVersionHistoryModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local PlaceVersionHistoryStore = PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	local v1 = if Number == nil then nil else p1
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: v1 (copy), SignalsModule (upval), PlaceVersionHistoryStore (copy)
		return if v1 == nil then SignalsModule.createSignal(nil) else PlaceVersionHistoryStore.getLiveVersion(v1).data
	end, { v1, PlaceVersionHistoryStore })))
	ReactModule.useEffect(function() --[[ Line: 26 ]]
		-- upvalues: v1 (copy), PlaceVersionHistoryStore (copy)
		if v1 ~= nil then
			PlaceVersionHistoryStore.fetchLiveVersion(v1)
		end
	end, { v1, PlaceVersionHistoryStore })
	local PlaceVersion = if UseSignalStateResult == nil then nil else UseSignalStateResult.placeVersion
	
	return Number ~= nil and (PlaceVersion ~= nil and tonumber(PlaceVersion.version) == Number)
end
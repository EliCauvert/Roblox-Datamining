local parent = script:FindFirstAncestor("BuildExperience").Parent
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function(p1, p2)
	-- upvalues: placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	local var1 = if p2 ~= nil then nil else p1
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (ref), signalsModule (copy), placeVersionHistoryStore (ref)
		return if var1 == nil then signalsModule.createSignal(nil) else placeVersionHistoryStore.getLiveVersion(var1).data
	end, { var1, placeVersionHistoryStore }))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), placeVersionHistoryStore (ref)
		if var1 ~= nil then
			placeVersionHistoryStore.fetchLiveVersion(var1)
		end
	end, { var1, placeVersionHistoryStore })
	local var3 = if var2 ~= nil then nil else var2.placeVersion
	
	return p2 ~= nil and (var3 ~= nil and tonumber(var3.version) == p2)
end
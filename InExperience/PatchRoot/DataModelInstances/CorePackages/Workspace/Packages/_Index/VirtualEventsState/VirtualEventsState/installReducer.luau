local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local roduxModule = require(virtualEventsState.Parent.Rodux)
local roduxNetworking = require(virtualEventsState.network).RoduxNetworking

return function()
	-- upvalues: roduxModule (ref), roduxNetworking (ref), virtualEventsState (ref)
	return roduxModule.combineReducers({
		networkStatus = roduxNetworking.installReducer(),
		events = require(virtualEventsState.Reducers.events),
		media = require(virtualEventsState.Reducers.media),
		experienceDetails = require(virtualEventsState.Reducers.experienceDetails),
		rsvps = require(virtualEventsState.Reducers.rsvps)
	})
end
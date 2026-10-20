local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local RoduxModule = require(VirtualEventsState.Parent.Rodux)
local RoduxNetworking = require(VirtualEventsState.network).RoduxNetworking

return function()
	-- upvalues: RoduxModule (copy), RoduxNetworking (copy), VirtualEventsState (copy)
	return RoduxModule.combineReducers({
		networkStatus = RoduxNetworking.installReducer(),
		events = require(VirtualEventsState.Reducers.events),
		media = require(VirtualEventsState.Reducers.media),
		experienceDetails = require(VirtualEventsState.Reducers.experienceDetails),
		rsvps = require(VirtualEventsState.Reducers.rsvps)
	})
end
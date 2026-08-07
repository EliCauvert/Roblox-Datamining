local networkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local createCreateVirtualEventModule = require(networkingVirtualEvents.requests.createCreateVirtualEvent)
local createUpdateVirtualEventModule = require(networkingVirtualEvents.requests.createUpdateVirtualEvent)
local createDeleteVirtualEventModule = require(networkingVirtualEvents.requests.createDeleteVirtualEvent)
local createGetVirtualEventModule = require(networkingVirtualEvents.requests.createGetVirtualEvent)
local createGetMyVirtualEventsModule = require(networkingVirtualEvents.requests.createGetMyVirtualEvents)
local createGetActiveVirtualEventsModule = require(networkingVirtualEvents.requests.createGetActiveVirtualEvents)
local createGetVirtualEventRsvpsModule = require(networkingVirtualEvents.requests.createGetVirtualEventRsvps)
local createUpdateMyRsvpStatusModule = require(networkingVirtualEvents.requests.createUpdateMyRsvpStatus)
local createGetVirtualEventRsvpCountsModule = require(networkingVirtualEvents.requests.createGetVirtualEventRsvpCounts)
local _ = require(networkingVirtualEvents.types)

return function(p0) --[[ line: 14 ]]
	-- upvalues: createCreateVirtualEventModule (ref), createUpdateVirtualEventModule (ref), createDeleteVirtualEventModule (ref), createGetVirtualEventModule (ref), createGetMyVirtualEventsModule (ref), createGetActiveVirtualEventsModule (ref), createGetVirtualEventRsvpsModule (ref), createUpdateMyRsvpStatusModule (ref), createGetVirtualEventRsvpCountsModule (ref), networkingVirtualEvents (ref)
	local roduxNetworking = p0.roduxNetworking
	
	return {
		CreateVirtualEvent = createCreateVirtualEventModule(roduxNetworking),
		UpdateVirtualEvent = createUpdateVirtualEventModule(roduxNetworking),
		DeleteVirtualEvent = createDeleteVirtualEventModule(roduxNetworking),
		GetVirtualEvent = createGetVirtualEventModule(roduxNetworking),
		GetMyVirtualEvents = createGetMyVirtualEventsModule(roduxNetworking),
		GetActiveVirtualEvents = createGetActiveVirtualEventsModule(roduxNetworking),
		GetVirtualEventRsvps = createGetVirtualEventRsvpsModule(roduxNetworking),
		UpdateMyRsvpStatus = createUpdateMyRsvpStatusModule(roduxNetworking),
		GetVirtualEventRsvpCounts = createGetVirtualEventRsvpCountsModule(roduxNetworking),
		VirtualEventModel = require(networkingVirtualEvents.models.VirtualEventModel),
		createMockVirtualEventResponse = require(networkingVirtualEvents.createMockVirtualEventResponse)
	}
end
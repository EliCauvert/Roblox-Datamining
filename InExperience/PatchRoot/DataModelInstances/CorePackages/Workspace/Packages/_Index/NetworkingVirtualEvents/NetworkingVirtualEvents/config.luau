local NetworkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local CreateCreateVirtualEventModule = require(NetworkingVirtualEvents.requests.createCreateVirtualEvent)
local CreateUpdateVirtualEventModule = require(NetworkingVirtualEvents.requests.createUpdateVirtualEvent)
local CreateDeleteVirtualEventModule = require(NetworkingVirtualEvents.requests.createDeleteVirtualEvent)
local CreateGetVirtualEventModule = require(NetworkingVirtualEvents.requests.createGetVirtualEvent)
local CreateGetMyVirtualEventsModule = require(NetworkingVirtualEvents.requests.createGetMyVirtualEvents)
local CreateGetActiveVirtualEventsModule = require(NetworkingVirtualEvents.requests.createGetActiveVirtualEvents)
local CreateGetVirtualEventRsvpsModule = require(NetworkingVirtualEvents.requests.createGetVirtualEventRsvps)
local CreateUpdateMyRsvpStatusModule = require(NetworkingVirtualEvents.requests.createUpdateMyRsvpStatus)
local CreateGetVirtualEventRsvpCountsModule = require(NetworkingVirtualEvents.requests.createGetVirtualEventRsvpCounts)
local _ = require(NetworkingVirtualEvents.types)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: CreateCreateVirtualEventModule (copy), CreateUpdateVirtualEventModule (copy), CreateDeleteVirtualEventModule (copy), CreateGetVirtualEventModule (copy), CreateGetMyVirtualEventsModule (copy), CreateGetActiveVirtualEventsModule (copy), CreateGetVirtualEventRsvpsModule (copy), CreateUpdateMyRsvpStatusModule (copy), CreateGetVirtualEventRsvpCountsModule (copy), NetworkingVirtualEvents (copy)
	local RoduxNetworking = p1.roduxNetworking
	
	return {
		CreateVirtualEvent = CreateCreateVirtualEventModule(RoduxNetworking),
		UpdateVirtualEvent = CreateUpdateVirtualEventModule(RoduxNetworking),
		DeleteVirtualEvent = CreateDeleteVirtualEventModule(RoduxNetworking),
		GetVirtualEvent = CreateGetVirtualEventModule(RoduxNetworking),
		GetMyVirtualEvents = CreateGetMyVirtualEventsModule(RoduxNetworking),
		GetActiveVirtualEvents = CreateGetActiveVirtualEventsModule(RoduxNetworking),
		GetVirtualEventRsvps = CreateGetVirtualEventRsvpsModule(RoduxNetworking),
		UpdateMyRsvpStatus = CreateUpdateMyRsvpStatusModule(RoduxNetworking),
		GetVirtualEventRsvpCounts = CreateGetVirtualEventRsvpCountsModule(RoduxNetworking),
		VirtualEventModel = require(NetworkingVirtualEvents.models.VirtualEventModel),
		createMockVirtualEventResponse = require(NetworkingVirtualEvents.createMockVirtualEventResponse)
	}
end
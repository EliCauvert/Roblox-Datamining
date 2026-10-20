local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local VirtualEventConnectorModule = require(GraphQLServer.graphql.connectors.VirtualEventConnector)
local FindVirtualEventByIdFunction = VirtualEventConnectorModule.findVirtualEventById
local FindVirtualEventsByUniverseIdFunction = VirtualEventConnectorModule.findVirtualEventsByUniverseId
local FindRsvpCountersByVirtualEventIdFunction = VirtualEventConnectorModule.findRsvpCountersByVirtualEventId
local FindRsvpsByVirtualEventIdFunction = VirtualEventConnectorModule.findRsvpsByVirtualEventId
local UpdateRsvpStatusFunction = VirtualEventConnectorModule.updateRsvpStatus
local NeverShowNotificationModalAgainFunction = VirtualEventConnectorModule.neverShowNotificationModalAgain
local EnablePushNotificationsFunction = VirtualEventConnectorModule.enablePushNotifications
local ExperienceConnectorModule = require(GraphQLServer.graphql.connectors.ExperienceConnector)
local FindExperienceDetailsByUniverseIdFunction = ExperienceConnectorModule.findExperienceDetailsByUniverseId
local FindExperienceMediaByUniverseIdFunction = ExperienceConnectorModule.findExperienceMediaByUniverseId
local _ = require(GraphQLServer.graphql.generatedTypes)

return {
	VirtualEventMutations = {
		neverShowNotificationModalAgain = function(_, _, p1)
			-- upvalues: NeverShowNotificationModalAgainFunction (copy)
			return NeverShowNotificationModalAgainFunction(p1.fetchImpl)
		end,
		enablePushNotifications = function(_, _, p1)
			-- upvalues: EnablePushNotificationsFunction (copy)
			return EnablePushNotificationsFunction(p1.fetchImpl)
		end
	},
	VirtualEvent = {
		experienceDetails = function(p1, _, p2)
			-- upvalues: FindExperienceDetailsByUniverseIdFunction (copy)
			return FindExperienceDetailsByUniverseIdFunction(tostring(p1.universeId), p2.fetchImpl)
		end,
		media = function(p1, _, p2)
			-- upvalues: FindExperienceMediaByUniverseIdFunction (copy)
			return FindExperienceMediaByUniverseIdFunction(tostring(p1.universeId), p2.fetchImpl)
		end,
		rsvpCounters = function(p1, _, p2)
			-- upvalues: FindRsvpCountersByVirtualEventIdFunction (copy)
			return FindRsvpCountersByVirtualEventIdFunction(p1.id, p2.fetchImpl)
		end,
		rsvps = function(p1, _, p2)
			-- upvalues: FindRsvpsByVirtualEventIdFunction (copy)
			return FindRsvpsByVirtualEventIdFunction(p1.id, p2.fetchImpl)
		end
	},
	Mutation = {
		virtualEvents = function()
			return {}
		end,
		virtualEventRsvp = function(_, p1, p2)
			-- upvalues: UpdateRsvpStatusFunction (copy)
			return UpdateRsvpStatusFunction(p1.id, p1.rsvpStatus, p2.fetchImpl)
		end
	},
	Query = {
		virtualEvent = function(_, p1, p2)
			-- upvalues: FindVirtualEventByIdFunction (copy)
			return FindVirtualEventByIdFunction(p1.id, p2.fetchImpl)
		end,
		virtualEventsByUniverseId = function(_, p1, p2)
			-- upvalues: FindVirtualEventsByUniverseIdFunction (copy)
			return FindVirtualEventsByUniverseIdFunction(p1.universeId, p1.options, p2.fetchImpl)
		end
	}
}
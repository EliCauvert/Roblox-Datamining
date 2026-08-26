local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local virtualEventConnectorModule = require(graphQLServer.graphql.connectors.VirtualEventConnector)
local findVirtualEventById = virtualEventConnectorModule.findVirtualEventById
local findVirtualEventsByUniverseId = virtualEventConnectorModule.findVirtualEventsByUniverseId
local findRsvpCountersByVirtualEventId = virtualEventConnectorModule.findRsvpCountersByVirtualEventId
local findRsvpsByVirtualEventId = virtualEventConnectorModule.findRsvpsByVirtualEventId
local updateRsvpStatus = virtualEventConnectorModule.updateRsvpStatus
local neverShowNotificationModalAgain = virtualEventConnectorModule.neverShowNotificationModalAgain
local enablePushNotifications = virtualEventConnectorModule.enablePushNotifications
local experienceConnectorModule = require(graphQLServer.graphql.connectors.ExperienceConnector)
local findExperienceDetailsByUniverseId = experienceConnectorModule.findExperienceDetailsByUniverseId
local findExperienceMediaByUniverseId = experienceConnectorModule.findExperienceMediaByUniverseId
local _ = require(graphQLServer.graphql.generatedTypes)

return {
	VirtualEventMutations = {
		neverShowNotificationModalAgain = function(_, _, p1)
			-- upvalues: neverShowNotificationModalAgain (ref)
			return neverShowNotificationModalAgain(p1.fetchImpl)
		end,
		enablePushNotifications = function(_, _, p1)
			-- upvalues: enablePushNotifications (ref)
			return enablePushNotifications(p1.fetchImpl)
		end
	},
	VirtualEvent = {
		experienceDetails = function(p1, _, p2)
			-- upvalues: findExperienceDetailsByUniverseId (ref)
			return findExperienceDetailsByUniverseId(tostring(p1.universeId), p2.fetchImpl)
		end,
		media = function(p1, _, p2)
			-- upvalues: findExperienceMediaByUniverseId (ref)
			return findExperienceMediaByUniverseId(tostring(p1.universeId), p2.fetchImpl)
		end,
		rsvpCounters = function(p1, _, p2)
			-- upvalues: findRsvpCountersByVirtualEventId (ref)
			return findRsvpCountersByVirtualEventId(p1.id, p2.fetchImpl)
		end,
		rsvps = function(p1, _, p2)
			-- upvalues: findRsvpsByVirtualEventId (ref)
			return findRsvpsByVirtualEventId(p1.id, p2.fetchImpl)
		end
	},
	Mutation = {
		virtualEvents = function()
			return {}
		end,
		virtualEventRsvp = function(_, p1, p2)
			-- upvalues: updateRsvpStatus (ref)
			return updateRsvpStatus(p1.id, p1.rsvpStatus, p2.fetchImpl)
		end
	},
	Query = {
		virtualEvent = function(_, p1, p2)
			-- upvalues: findVirtualEventById (ref)
			return findVirtualEventById(p1.id, p2.fetchImpl)
		end,
		virtualEventsByUniverseId = function(_, p1, p2)
			-- upvalues: findVirtualEventsByUniverseId (ref)
			return findVirtualEventsByUniverseId(p1.universeId, p1.options, p2.fetchImpl)
		end
	}
}
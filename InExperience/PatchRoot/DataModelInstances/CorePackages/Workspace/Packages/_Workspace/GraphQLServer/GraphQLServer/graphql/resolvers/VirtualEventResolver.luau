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
		neverShowNotificationModalAgain = function(_, _, p0)
			-- upvalues: neverShowNotificationModalAgain (ref)
			return neverShowNotificationModalAgain(p0.fetchImpl)
		end,
		enablePushNotifications = function(_, _, p1)
			-- upvalues: enablePushNotifications (ref)
			return enablePushNotifications(p1.fetchImpl)
		end
	},
	VirtualEvent = {
		experienceDetails = function(p2, _, p3)
			-- upvalues: findExperienceDetailsByUniverseId (ref)
			return findExperienceDetailsByUniverseId(tostring(p2.universeId), p3.fetchImpl)
		end,
		media = function(p4, _, p5)
			-- upvalues: findExperienceMediaByUniverseId (ref)
			return findExperienceMediaByUniverseId(tostring(p4.universeId), p5.fetchImpl)
		end,
		rsvpCounters = function(p6, _, p7)
			-- upvalues: findRsvpCountersByVirtualEventId (ref)
			return findRsvpCountersByVirtualEventId(p6.id, p7.fetchImpl)
		end,
		rsvps = function(p8, _, p9)
			-- upvalues: findRsvpsByVirtualEventId (ref)
			return findRsvpsByVirtualEventId(p8.id, p9.fetchImpl)
		end
	},
	Mutation = {
		virtualEvents = function()
			return {}
		end,
		virtualEventRsvp = function(_, p10, p11)
			-- upvalues: updateRsvpStatus (ref)
			return updateRsvpStatus(p10.id, p10.rsvpStatus, p11.fetchImpl)
		end
	},
	Query = {
		virtualEvent = function(_, p12, p13)
			-- upvalues: findVirtualEventById (ref)
			return findVirtualEventById(p12.id, p13.fetchImpl)
		end,
		virtualEventsByUniverseId = function(_, p14, p15)
			-- upvalues: findVirtualEventsByUniverseId (ref)
			return findVirtualEventsByUniverseId(p14.universeId, p14.options, p15.fetchImpl)
		end
	}
}
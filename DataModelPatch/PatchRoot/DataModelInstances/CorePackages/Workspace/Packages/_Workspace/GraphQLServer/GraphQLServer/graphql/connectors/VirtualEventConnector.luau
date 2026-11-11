local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local HttpService = game:GetService("HttpService")
local _ = require(GraphQLServer.Parent.LuauPolyfill)
local _ = require(GraphQLServer.graphql.generatedTypes)
local PromiseModule = require(GraphQLServer.Parent.Promise)
local GraphQLError = require(GraphQLServer.Parent.GraphQL).GraphQLError
local FetchModule = require(GraphQLServer.Parent.Fetch)
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local UrlBuilder = require(GraphQLServer.Parent.UrlBuilder).UrlBuilder
local Id = UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")
local Rsvps = UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps")
local Counters = UrlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps/counters")
local VirtualEventsCursorCursorLimitLimitFromUtcFromUtc = UrlBuilder.fromString("apis:virtual-events/v1/universes/{id}/virtual-events?cursor={cursor}&limit={limit}&fromUtc={fromUtc}")
local ModalHistory = UrlBuilder.fromString("apis:virtual-events/v1/notifications/modal-history")
local Preferences = UrlBuilder.fromString("apis:virtual-events/v1/notifications/preferences")

return {
	findVirtualEventById = function(Id1, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), Id (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Id (upval), Id1 (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(Id({ id = Id1 }), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to find VirtualEvent matching id: %s.", Id1)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for VirtualEvent matching id: %s.", Id1)))
			end
		end)
	end,
	findVirtualEventsByUniverseId = function(Id, p1, p2)
		-- upvalues: Fetch (copy), PromiseModule (copy), VirtualEventsCursorCursorLimitLimitFromUtcFromUtc (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p2 then p2 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: VirtualEventsCursorCursorLimitLimitFromUtcFromUtc (upval), Id (copy), p1 (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(VirtualEventsCursorCursorLimitLimitFromUtcFromUtc({
				id = Id,
				cursor = if p1 and p1.cursor then p1.cursor else "",
				limit = if p1 and p1.limit then p1.limit else 25,
				fromUtc = if p1 and p1.fromUtc then p1.fromUtc else ""
			}), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to find experience matching universeId: %i", Id)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1({ cursor = v2.nextPageCursor, virtualEvents = v2.data })
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for experience matching universeId: %i", Id)))
			end
		end)
	end,
	findRsvpsByVirtualEventId = function(Id, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), Rsvps (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Rsvps (upval), Id (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(Rsvps({ id = Id }), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to find RSVPs matching VirtualEvent id: %s.", Id)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.data)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVPs matching VirtualEvent id: %s.", Id)))
			end
		end)
	end,
	findRsvpCountersByVirtualEventId = function(Id, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), Counters (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Counters (upval), Id (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(Counters({ id = Id }), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to find RSVP counters matching VirtualEvent id: %s.", Id)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.counters)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVP counters matching VirtualEvent id: %s.", Id)))
			end
		end)
	end,
	updateRsvpStatus = function(Id, RsvpStatus, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), Rsvps (copy), HttpService (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Rsvps (upval), Id (copy), Fetch1 (copy), HttpService (upval), RsvpStatus (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(Rsvps({ id = Id }), {
				method = "POST",
				body = HttpService:JSONEncode({ rsvpStatus = RsvpStatus }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to set RSVP status matching VirtualEvent id: %s.", Id)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1({
					shouldSeeNotificationsUpsellModal = v2.shouldSeeNotificationsUpsellModal,
					virtualEvent = { id = Id, userRsvpStatus = v2.rsvpStatus }
				})
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVP status matching VirtualEvent id: %s.", Id)))
			end
		end)
	end,
	neverShowNotificationModalAgain = function(p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), ModalHistory (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: ModalHistory (upval), Fetch1 (copy), Response (upval), GraphQLError (upval)
			if Fetch1(ModalHistory(), { method = "POST" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect().ok then
				Callback1(true)
				
				return
			else
				Callback(GraphQLError.new("Failed to update modal history"))
			end
		end)
	end,
	enablePushNotifications = function(p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), Preferences (copy), HttpService (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Preferences (upval), Fetch1 (copy), HttpService (upval), Response (upval), GraphQLError (upval)
			if Fetch1(Preferences(), {
				method = "POST",
				body = HttpService:JSONEncode({ isEnabled = true }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect().ok then
				Callback1(true)
				
				return
			else
				Callback(GraphQLError.new("Failed to update notification preferences"))
			end
		end)
	end
}
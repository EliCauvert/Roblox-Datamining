local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local httpService = game:GetService("HttpService")
local _ = require(graphQLServer.Parent.LuauPolyfill)
local _ = require(graphQLServer.graphql.generatedTypes)
local promiseModule = require(graphQLServer.Parent.Promise)
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local fetchModule = require(graphQLServer.Parent.Fetch)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local urlBuilder = require(graphQLServer.Parent.UrlBuilder).UrlBuilder
local t = {}
local var1 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")
local var2 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps")
local var3 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps/counters")
local var4 = urlBuilder.fromString("apis:virtual-events/v1/universes/{id}/virtual-events?cursor={cursor}&limit={limit}&fromUtc={fromUtc}")
local var5 = urlBuilder.fromString("apis:virtual-events/v1/notifications/modal-history")
local var6 = urlBuilder.fromString("apis:virtual-events/v1/notifications/preferences")

function t.findVirtualEventById(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), response (ref), graphQLError (ref)
	local var7 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var1 (copy), p1 (ref), var7 (ref), response (copy), graphQLError (copy)
		local var8 = var7(var1({ id = p1 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var8.ok then
			p4(graphQLError.new(string.format("Failed to find VirtualEvent matching id: %s.", p1)))
			
			return
		end
		local var9 = var8:json():catch(function()
			return nil
		end):expect()
		
		if var9 then
			p3(var9)
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for VirtualEvent matching id: %s.", p1)))
	end)
end

function t.findVirtualEventsByUniverseId(p1, p2, p3)
	-- upvalues: fetch (ref), promiseModule (ref), var4 (ref), response (ref), graphQLError (ref)
	local var7 = p3 or fetch
	
	return promiseModule.new(function(p4, p5)
		-- upvalues: var4 (copy), p1 (ref), p2 (ref), var7 (ref), response (copy), graphQLError (copy)
		local t = {
			id = p1,
			cursor = if p2 and p2.cursor then p2.cursor else "",
			limit = if p2 and p2.limit then p2.limit else 25,
			fromUtc = if p2 and p2.fromUtc then p2.fromUtc else ""
		}
		t = var7(var4(t), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not t.ok then
			p5(graphQLError.new(string.format("Failed to find experience matching universeId: %i", p1)))
			
			return
		end
		local var8 = t:json():catch(function()
			return nil
		end):expect()
		
		if var8 then
			p4({
				cursor = var8.nextPageCursor,
				virtualEvents = var8.data
			})
			
			return
		end
		p5(graphQLError.new(string.format("Failed to decode HTTP response as JSON for experience matching universeId: %i", p1)))
	end)
end

function t.findRsvpsByVirtualEventId(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), response (ref), graphQLError (ref)
	local var7 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var2 (copy), p1 (ref), var7 (ref), response (copy), graphQLError (copy)
		local var8 = var7(var2({ id = p1 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var8.ok then
			p4(graphQLError.new(string.format("Failed to find RSVPs matching VirtualEvent id: %s.", p1)))
			
			return
		end
		local var9 = var8:json():catch(function()
			return nil
		end):expect()
		
		if var9 then
			p3(var9.data)
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVPs matching VirtualEvent id: %s.", p1)))
	end)
end

function t.findRsvpCountersByVirtualEventId(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var3 (ref), response (ref), graphQLError (ref)
	local var7 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var3 (copy), p1 (ref), var7 (ref), response (copy), graphQLError (copy)
		local var8 = var7(var3({ id = p1 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var8.ok then
			p4(graphQLError.new(string.format("Failed to find RSVP counters matching VirtualEvent id: %s.", p1)))
			
			return
		end
		local var9 = var8:json():catch(function()
			return nil
		end):expect()
		
		if var9 then
			p3(var9.counters)
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVP counters matching VirtualEvent id: %s.", p1)))
	end)
end

function t.updateRsvpStatus(p1, p2, p3)
	-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), httpService (ref), response (ref), graphQLError (ref)
	local var7 = p3 or fetch
	
	return promiseModule.new(function(p4, p5)
		-- upvalues: var2 (copy), p1 (ref), var7 (ref), httpService (copy), p2 (ref), response (copy), graphQLError (copy)
		local var8 = var7(var2({ id = p1 }), {
			method = "POST",
			body = httpService:JSONEncode({ rsvpStatus = p2 }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var8.ok then
			p5(graphQLError.new(string.format("Failed to set RSVP status matching VirtualEvent id: %s.", p1)))
			
			return
		end
		local var9 = var8:json():catch(function()
			return nil
		end):expect()
		
		if var9 then
			p4({
				shouldSeeNotificationsUpsellModal = var9.shouldSeeNotificationsUpsellModal,
				virtualEvent = { id = p1, userRsvpStatus = var9.rsvpStatus }
			})
			
			return
		end
		p5(graphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVP status matching VirtualEvent id: %s.", p1)))
	end)
end

function t.neverShowNotificationModalAgain(p1)
	-- upvalues: fetch (ref), promiseModule (ref), var5 (ref), response (ref), graphQLError (ref)
	local var7 = p1 or fetch
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: var5 (copy), var7 (ref), response (copy), graphQLError (copy)
		if var7(var5(), { method = "POST" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect().ok then
			p2(true)
			
			return
		end
		p3(graphQLError.new("Failed to update modal history"))
	end)
end

function t.enablePushNotifications(p1)
	-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), httpService (ref), response (ref), graphQLError (ref)
	local var7 = p1 or fetch
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: var6 (copy), var7 (ref), httpService (copy), response (copy), graphQLError (copy)
		if var7(var6(), {
			method = "POST",
			body = httpService:JSONEncode({ isEnabled = true }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect().ok then
			p2(true)
			
			return
		end
		p3(graphQLError.new("Failed to update notification preferences"))
	end)
end

return t
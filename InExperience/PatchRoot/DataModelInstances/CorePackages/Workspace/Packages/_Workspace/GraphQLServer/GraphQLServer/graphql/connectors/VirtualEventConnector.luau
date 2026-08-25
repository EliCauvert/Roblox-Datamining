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
local var5 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}")
local var6 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps")
local var7 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps/counters")
local var8 = urlBuilder.fromString("apis:virtual-events/v1/universes/{id}/virtual-events?cursor={cursor}&limit={limit}&fromUtc={fromUtc}")
local var9 = urlBuilder.fromString("apis:virtual-events/v1/notifications/modal-history")
local var10 = urlBuilder.fromString("apis:virtual-events/v1/notifications/preferences")

function t.findVirtualEventById(p0, p1)
	-- upvalues: fetch (ref), promiseModule (ref), var5 (ref), response (ref), graphQLError (ref)
	local var11 = p1 or fetch
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: var5 (copy), p0 (ref), var11 (ref), response (copy), graphQLError (copy)
		local var12 = var11(var5({ id = p0 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var12.ok then
			p3(graphQLError.new(string.format("Failed to find VirtualEvent matching id: %s.", p0)))
			
			return
		end
		local var13 = var12:json():catch(function()
			return nil
		end):expect()
		
		if var13 then
			p2(var13)
			
			return
		end
		p3(graphQLError.new(string.format("Failed to decode HTTP response as JSON for VirtualEvent matching id: %s.", p0)))
	end)
end

function t.findVirtualEventsByUniverseId(p4, p5, p6)
	-- upvalues: fetch (ref), promiseModule (ref), var8 (ref), response (ref), graphQLError (ref)
	local var14 = p6 or fetch
	
	return promiseModule.new(function(p7, p8)
		-- upvalues: var8 (copy), p4 (ref), p5 (ref), var14 (ref), response (copy), graphQLError (copy)
		local t = {
			id = p4,
			cursor = if p5 and p5.cursor then p5.cursor else "",
			limit = if p5 and p5.limit then p5.limit else 25,
			fromUtc = if p5 and p5.fromUtc then p5.fromUtc else ""
		}
		t = var14(var8(t), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not t.ok then
			p8(graphQLError.new(string.format("Failed to find experience matching universeId: %i", p4)))
			
			return
		end
		local var16 = t:json():catch(function()
			return nil
		end):expect()
		
		if var16 then
			p7({
				cursor = var16.nextPageCursor,
				virtualEvents = var16.data
			})
			
			return
		end
		p8(graphQLError.new(string.format("Failed to decode HTTP response as JSON for experience matching universeId: %i", p4)))
	end)
end

function t.findRsvpsByVirtualEventId(p9, p10)
	-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), response (ref), graphQLError (ref)
	local var17 = p10 or fetch
	
	return promiseModule.new(function(p11, p12)
		-- upvalues: var6 (copy), p9 (ref), var17 (ref), response (copy), graphQLError (copy)
		local var18 = var17(var6({ id = p9 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var18.ok then
			p12(graphQLError.new(string.format("Failed to find RSVPs matching VirtualEvent id: %s.", p9)))
			
			return
		end
		local var19 = var18:json():catch(function()
			return nil
		end):expect()
		
		if var19 then
			p11(var19.data)
			
			return
		end
		p12(graphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVPs matching VirtualEvent id: %s.", p9)))
	end)
end

function t.findRsvpCountersByVirtualEventId(p13, p14)
	-- upvalues: fetch (ref), promiseModule (ref), var7 (ref), response (ref), graphQLError (ref)
	local var20 = p14 or fetch
	
	return promiseModule.new(function(p15, p16)
		-- upvalues: var7 (copy), p13 (ref), var20 (ref), response (copy), graphQLError (copy)
		local var21 = var20(var7({ id = p13 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var21.ok then
			p16(graphQLError.new(string.format("Failed to find RSVP counters matching VirtualEvent id: %s.", p13)))
			
			return
		end
		local var22 = var21:json():catch(function()
			return nil
		end):expect()
		
		if var22 then
			p15(var22.counters)
			
			return
		end
		p16(graphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVP counters matching VirtualEvent id: %s.", p13)))
	end)
end

function t.updateRsvpStatus(p17, p18, p19)
	-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), httpService (ref), response (ref), graphQLError (ref)
	local var23 = p19 or fetch
	
	return promiseModule.new(function(p20, p21)
		-- upvalues: var6 (copy), p17 (ref), var23 (ref), httpService (copy), p18 (ref), response (copy), graphQLError (copy)
		local var24 = var23(var6({ id = p17 }), {
			method = "POST",
			body = httpService:JSONEncode({ rsvpStatus = p18 }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var24.ok then
			p21(graphQLError.new(string.format("Failed to set RSVP status matching VirtualEvent id: %s.", p17)))
			
			return
		end
		local var25 = var24:json():catch(function()
			return nil
		end):expect()
		
		if var25 then
			p20({
				shouldSeeNotificationsUpsellModal = var25.shouldSeeNotificationsUpsellModal,
				virtualEvent = { id = p17, userRsvpStatus = var25.rsvpStatus }
			})
			
			return
		end
		p21(graphQLError.new(string.format("Failed to decode HTTP response as JSON for RSVP status matching VirtualEvent id: %s.", p17)))
	end)
end

function t.neverShowNotificationModalAgain(p22)
	-- upvalues: fetch (ref), promiseModule (ref), var9 (ref), response (ref), graphQLError (ref)
	local var26 = p22 or fetch
	
	return promiseModule.new(function(p23, p24)
		-- upvalues: var9 (copy), var26 (ref), response (copy), graphQLError (copy)
		if var26(var9(), { method = "POST" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect().ok then
			p23(true)
			
			return
		end
		p24(graphQLError.new("Failed to update modal history"))
	end)
end

function t.enablePushNotifications(p25)
	-- upvalues: fetch (ref), promiseModule (ref), var10 (ref), httpService (ref), response (ref), graphQLError (ref)
	local var27 = p25 or fetch
	
	return promiseModule.new(function(p26, p27)
		-- upvalues: var10 (copy), var27 (ref), httpService (copy), response (copy), graphQLError (copy)
		if var27(var10(), {
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
			p26(true)
			
			return
		end
		p27(graphQLError.new("Failed to update notification preferences"))
	end)
end

return t
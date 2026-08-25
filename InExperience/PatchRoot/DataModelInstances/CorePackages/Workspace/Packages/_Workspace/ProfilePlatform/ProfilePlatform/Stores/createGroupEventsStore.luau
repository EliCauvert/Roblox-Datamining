local httpService = game:GetService("HttpService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local signalsModule = require(parent.Signals)
local httpStoreModule = require(parent.HttpStore)
local fFlagLuaAppUseAppHttpStore = require(parent.SharedFlags).FFlagLuaAppUseAppHttpStore
local internalHttpStoreModule = require(parent.InternalHttpStore)
local _ = require(profilePlatform.Parent.GraphQLServer)
local var5 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/groups/{id}")
local var6 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{eventId}/rsvps")
local fFlagEnableCommunityProfileLoadingSkeletonsModule = require(profilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local t = {}

return function(p0)
	-- upvalues: internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), var5 (ref), t (ref), httpService (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), var6 (ref)
	local httpStore = internalHttpStoreModule.GetHttpStore()
	
	if fFlagLuaAppUseAppHttpStore then
		local var10 = httpStoreModule.Instance.get()
		
		if var10 then
			httpStore = var10
		end
	end
	local var11, var12 = signalsModule.createSignal(0)
	local t_1 = {}
	local var14, var15 = signalsModule.createSignal(t_1)
	
	local _ = function(p1, p2)
		-- upvalues: t_1 (write), var15 (ref)
		local cloned = table.clone(t_1)
		cloned[p1] = p2
		var15(cloned)
		t_1 = cloned
	end
	
	local var16 = signalsModule.createComputed(function(p3)
		-- upvalues: var11 (ref), p0 (ref), var5 (copy), httpStore (write)
		return httpStore.fetch(string.format("GetEvents_%d_%d", p0, var11(p3)), { Method = "GET", Url = var5({ id = p0 }) })
	end)
	local var17 = t
	local var18 = nil
	
	return {
		getEvents = signalsModule.createComputed(function(p4)
			-- upvalues: var16 (ref), var14 (ref), httpService (copy), var17 (write)
			local var20 = var16(p4)(p4)
			local var21 = var14(p4)
			
			if var20.status == "Success" then
				local t = {}
				local ok, status = pcall(httpService.JSONDecode, httpService, var20.response.Body)
				
				if ok then
					for i, v in pairs(status.data) do
						v.universeId = tostring(v.universeId)
						local id = var21[v.id]
						
						if id ~= nil then
							v.userRsvpStatus = id
						end
						t[i] = v
					end
				end
				var17 = t
				
				return t
			else
				return if var20.status == "Failed" then {} else var17
			end
		end),
		isLoading = if fFlagEnableCommunityProfileLoadingSkeletonsModule then signalsModule.createComputed(function(p5)
			-- upvalues: var16 (ref)
			return var16(p5)(p5).status == "Fetching"
		end) else nil,
		updateRsvpStatus = function(p6, p7)
			-- upvalues: var6 (copy), httpService (copy), httpStore (write), t_1 (write), var15 (ref), var18 (write), signalsModule (copy)
			local var23 = httpStore.fetch(string.format("UpdateEventRsvpStatus_%s_%s", p6.id, p7), {
				Method = "POST",
				Url = var6({ eventId = p6.id }),
				Body = httpService:JSONEncode({ rsvpStatus = p7 }),
				Headers = { ["Content-Type"] = "application/json" }
			})
			local id = t_1[p6.id]
			local cloned = table.clone(t_1)
			cloned[p6.id] = p7
			var15(cloned)
			t_1 = cloned
			
			if var18 then
				var18()
			end
			var18 = signalsModule.createEffect(function(p8)
				-- upvalues: var23 (ref), p6 (ref), id (ref), t_1 (copy), var15 (copy)
				if var23(p8).status == "Failed" then
					local cloned = table.clone(t_1)
					cloned[p6.id] = id
					var15(cloned)
					t_1 = cloned
				end
			end)
			
			return var23
		end,
		refetch = function()
			-- upvalues: var12 (ref), var15 (ref)
			var12(function(p9)
				return p9 + 1
			end)
			var15(function(_)
				return {}
			end)
		end
	}
end
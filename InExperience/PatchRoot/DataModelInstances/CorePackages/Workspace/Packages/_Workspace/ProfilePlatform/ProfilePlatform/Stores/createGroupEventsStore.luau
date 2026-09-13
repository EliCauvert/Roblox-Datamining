local httpService = game:GetService("HttpService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local signalsModule = require(parent.Signals)
local httpStoreModule = require(parent.HttpStore)
local fFlagLuaAppUseAppHttpStore = require(parent.SharedFlags).FFlagLuaAppUseAppHttpStore
local internalHttpStoreModule = require(parent.InternalHttpStore)
local _ = require(profilePlatform.Parent.GraphQLServer)
local var1 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/groups/{id}")
local var2 = urlBuilder.fromString("apis:virtual-events/v1/virtual-events/{eventId}/rsvps")
local fFlagEnableCommunityProfileLoadingSkeletonsModule = require(profilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local t = {}

return function(p1)
	-- upvalues: internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), var1 (ref), t (ref), httpService (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), var2 (ref)
	local httpStore = internalHttpStoreModule.GetHttpStore()
	
	if fFlagLuaAppUseAppHttpStore then
		local var3 = httpStoreModule.Instance.get()
		
		if var3 then
			httpStore = var3
		end
	end
	local var4, var5 = signalsModule.createSignal(0)
	local t_1 = {}
	local var6, var7 = signalsModule.createSignal(t_1)
	
	local _ = function(p2, p3)
		-- upvalues: t_1 (write), var7 (ref)
		local cloned = table.clone(t_1)
		cloned[p2] = p3
		var7(cloned)
		t_1 = cloned
	end
	
	local var8 = signalsModule.createComputed(function(p2)
		-- upvalues: var4 (ref), p1 (ref), var1 (copy), httpStore (write)
		return httpStore.fetch(string.format("GetEvents_%d_%d", p1, var4(p2)), { Method = "GET", Url = var1({ id = p1 }) })
	end)
	local var9 = t
	local var10 = nil
	
	return {
		getEvents = signalsModule.createComputed(function(p2)
			-- upvalues: var8 (ref), var6 (ref), httpService (copy), var9 (write)
			local var11 = var8(p2)(p2)
			local var12 = var6(p2)
			
			if var11.status == "Success" then
				local t = {}
				local ok, status = pcall(httpService.JSONDecode, httpService, var11.response.Body)
				
				if ok then
					for i, v in pairs(status.data) do
						v.universeId = tostring(v.universeId)
						local id = var12[v.id]
						
						if id ~= nil then
							v.userRsvpStatus = id
						end
						t[i] = v
					end
				end
				var9 = t
				
				return t
			else
				return if var11.status == "Failed" then {} else var9
			end
		end),
		isLoading = if fFlagEnableCommunityProfileLoadingSkeletonsModule then signalsModule.createComputed(function(p3)
			-- upvalues: var8 (ref)
			return var8(p3)(p3).status == "Fetching"
		end) else nil,
		updateRsvpStatus = function(p3, p4)
			-- upvalues: var2 (copy), httpService (copy), httpStore (write), t_1 (write), var7 (ref), var10 (write), signalsModule (copy)
			local var13 = httpStore.fetch(string.format("UpdateEventRsvpStatus_%s_%s", p3.id, p4), {
				Method = "POST",
				Url = var2({ eventId = p3.id }),
				Body = httpService:JSONEncode({ rsvpStatus = p4 }),
				Headers = { ["Content-Type"] = "application/json" }
			})
			local id = t_1[p3.id]
			local cloned = table.clone(t_1)
			cloned[p3.id] = p4
			var7(cloned)
			t_1 = cloned
			
			if var10 then
				var10()
			end
			var10 = signalsModule.createEffect(function(p5)
				-- upvalues: var13 (ref), p3 (ref), id (ref), t_1 (copy), var7 (copy)
				if var13(p5).status == "Failed" then
					local cloned = table.clone(t_1)
					cloned[p3.id] = id
					var7(cloned)
					t_1 = cloned
				end
			end)
			
			return var13
		end,
		refetch = function()
			-- upvalues: var5 (ref), var7 (ref)
			var5(function(p3)
				return p3 + 1
			end)
			var7(function(_)
				return {}
			end)
		end
	}
end
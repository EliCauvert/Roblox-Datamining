local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local playersService = game:GetService("Players")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local signalsModule = require(parent.Signals)
local fFlagBuildAgentAdCampaignRefreshEligibility = require(parent.SharedFlags).FFlagBuildAgentAdCampaignRefreshEligibility
local fetchAdCampaignEligibilityModule = require(script.Parent.fetchAdCampaignEligibility)
local _ = require(script.Parent.AdCampaignEligibilityStoreTypes)

return function(p1)
	-- upvalues: fetchAdCampaignEligibilityModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), fFlagBuildAgentAdCampaignRefreshEligibility (ref), signalsModule (ref), playersService (ref)
	local var1 = if p1 and p1.fetchEligibility then p1.fetchEligibility else fetchAdCampaignEligibilityModule
	local var2 = nil
	local var3 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		ignoreResponsesAfterTimeout = fFlagBuildAgentAdCampaignRefreshEligibility,
		onClear = if fFlagBuildAgentAdCampaignRefreshEligibility then function()
			-- upvalues: var2 (write)
			var2()
		end else nil,
		fetchFn = function(p2, _)
			-- upvalues: var1 (write)
			return var1(tonumber(p2))
		end
	})
	local t = {}
	local var4 = if fFlagBuildAgentAdCampaignRefreshEligibility then {} else nil
	
	local function fetchEligibility(p2, p3)
		-- upvalues: fFlagBuildAgentAdCampaignRefreshEligibility (copy), var3 (ref), var4 (ref), signalsModule (copy), t (ref)
		if fFlagBuildAgentAdCampaignRefreshEligibility then
			local var5 = tostring(p2)
			local var6 = var3.isRequestInQueueOrInFlight(var5)
			
			if not var6 and p3 == nil then
				return var3.fetchItem(var5)
			end
			local cachedItem = var3.getCachedItem(var5)
			local var7 = var4[var5]
			
			if var7 == nil then
				local t_1 = { pending = var6, callbacks = {}, nextCallbacks = {} }
				
				if p3 ~= nil then
					table.insert(if var6 then t_1.nextCallbacks else t_1.callbacks, p3)
				end
				var4[var5] = t_1
				
				if not var6 then
					var3.fetchItem(var5)
				end
				t_1.dispose = signalsModule.createEffect(function(p4)
					-- upvalues: cachedItem (ref), var3 (copy), var5 (ref), t_1 (ref), var4 (copy)
					local var8 = cachedItem.data(p4)
					local var9 = cachedItem.status(p4)
					
					if var9 == "NotReady" or var3.isRequestInQueueOrInFlight(var5) then return end
					local callbacks = t_1.callbacks
					t_1.callbacks = t_1.nextCallbacks
					t_1.nextCallbacks = {}
					
					if t_1.pending then
						t_1.pending = false
						var3.fetchItem(var5)
					else
						var4[var5] = nil
						
						if t_1.dispose ~= nil then
							t_1.dispose()
						end
					end
					for i, v in callbacks do
						v(if var9 == "Ready" then var8 else nil)
					end
				end)
				
				return cachedItem
			else
				var7.pending = true
				
				if p3 ~= nil then
					table.insert(var7.nextCallbacks, p3)
				end
				return cachedItem
			end
		else
			local var8 = tostring(p2)
			
			if not var3.isRequestInQueueOrInFlight(var8) then
				return var3.fetchItem(var8)
			end
			local cachedItem = var3.getCachedItem(var8)
			
			if t[var8] == nil then
				local _ = nil
				t[var8] = signalsModule.createEffect(function(p4)
					-- upvalues: cachedItem (ref), var3 (copy), var8 (ref), t (copy)
					cachedItem.data(p4)
					cachedItem.status(p4)
					
					if var3.isRequestInQueueOrInFlight(var8) then return end
					local var9 = t[var8]
					t[var8] = nil
					
					if var9 ~= nil then
						var9()
					end
					var3.fetchItem(var8)
				end)
			end
			return cachedItem
		end
	end
	
	var2 = function()
		-- upvalues: fFlagBuildAgentAdCampaignRefreshEligibility (copy), var4 (ref), t (ref)
		if fFlagBuildAgentAdCampaignRefreshEligibility then
			for i, v in var4 do
				var4[i] = nil
				
				if v.dispose ~= nil then
					v.dispose()
				end
			end
			return
		else
			for i, v in t do
				t[i] = nil
				v()
			end
		end
	end
	
	local localPlayer = playersService.LocalPlayer
	local var9 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: playersService (copy), localPlayer (write), var2 (write)
		if playersService.LocalPlayer ~= localPlayer then
			localPlayer = playersService.LocalPlayer
			var2()
		end
	end)
	
	return {
		getEligibility = function(p4)
			-- upvalues: var3 (ref)
			return var3.getCachedItem(tostring(p4))
		end,
		fetchEligibility = fetchEligibility,
		getAndFetchEligibility = function(p4)
			-- upvalues: var3 (ref)
			return var3.getAndFetchItem(tostring(p4))
		end,
		clear = function()
			-- upvalues: var2 (write), var3 (ref)
			var2()
			var3.clear()
		end,
		dispose = function()
			-- upvalues: var2 (write), var9 (write), var3 (ref)
			var2()
			
			if var9 ~= nil then
				var9:Disconnect()
				var9 = nil
			end
			var3.dispose()
		end
	}
end
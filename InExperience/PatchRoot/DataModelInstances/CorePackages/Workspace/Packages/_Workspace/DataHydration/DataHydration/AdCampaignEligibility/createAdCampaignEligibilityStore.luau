local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local playersService = game:GetService("Players")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local signalsModule = require(parent.Signals)
local fetchAdCampaignEligibilityModule = require(script.Parent.fetchAdCampaignEligibility)
local _ = require(script.Parent.AdCampaignEligibilityStoreTypes)

return function(p1)
	-- upvalues: fetchAdCampaignEligibilityModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), signalsModule (ref), playersService (ref)
	local var1 = if p1 and p1.fetchEligibility then p1.fetchEligibility else fetchAdCampaignEligibilityModule
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: var1 (write)
			return var1(tonumber(p2))
		end
	})
	local t = {}
	
	local function fetchEligibility(p2)
		-- upvalues: var2 (ref), t (ref), signalsModule (copy)
		local var3 = tostring(p2)
		
		if not var2.isRequestInQueueOrInFlight(var3) then
			return var2.fetchItem(var3)
		end
		local cachedItem = var2.getCachedItem(var3)
		
		if t[var3] == nil then
			local _ = nil
			t[var3] = signalsModule.createEffect(function(p3)
				-- upvalues: cachedItem (ref), var2 (copy), var3 (ref), t (copy)
				cachedItem.data(p3)
				cachedItem.status(p3)
				
				if var2.isRequestInQueueOrInFlight(var3) then return end
				local var4 = t[var3]
				t[var3] = nil
				
				if var4 ~= nil then
					var4()
				end
				var2.fetchItem(var3)
			end)
		end
		return cachedItem
	end
	
	local function _()
		-- upvalues: t (ref)
		for i, v in t do
			t[i] = nil
			v()
		end
	end
	
	local localPlayer = playersService.LocalPlayer
	local var3 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: playersService (copy), localPlayer (write), t (ref)
		if playersService.LocalPlayer ~= localPlayer then
			localPlayer = playersService.LocalPlayer
			
			for i, v in t do
				t[i] = nil
				v()
			end
		end
	end)
	
	return {
		getEligibility = function(p2)
			-- upvalues: var2 (ref)
			return var2.getCachedItem(tostring(p2))
		end,
		fetchEligibility = fetchEligibility,
		getAndFetchEligibility = function(p2)
			-- upvalues: var2 (ref)
			return var2.getAndFetchItem(tostring(p2))
		end,
		clear = function()
			-- upvalues: t (ref), var2 (ref)
			for i, v in t do
				t[i] = nil
				v()
			end
			var2.clear()
		end,
		dispose = function()
			-- upvalues: t (ref), var3 (write), var2 (ref)
			for i, v in t do
				t[i] = nil
				v()
			end
			if var3 ~= nil then
				var3:Disconnect()
				var3 = nil
			end
			var2.dispose()
		end
	}
end
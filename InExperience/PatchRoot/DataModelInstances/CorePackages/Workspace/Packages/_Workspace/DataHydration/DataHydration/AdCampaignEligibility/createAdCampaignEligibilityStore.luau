local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local Players = game:GetService("Players")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local SignalsModule = require(Parent.Signals)
local FFlagBuildAgentAdCampaignRefreshEligibility = require(Parent.SharedFlags).FFlagBuildAgentAdCampaignRefreshEligibility
local FetchAdCampaignEligibilityModule = require(script.Parent.fetchAdCampaignEligibility)
local _ = require(script.Parent.AdCampaignEligibilityStoreTypes)

return function(p1)
	-- upvalues: FetchAdCampaignEligibilityModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy), FFlagBuildAgentAdCampaignRefreshEligibility (copy), SignalsModule (copy), Players (copy)
	local FetchEligibility = if p1 and p1.fetchEligibility then p1.fetchEligibility else FetchAdCampaignEligibilityModule
	local Callback = nil
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		ignoreResponsesAfterTimeout = FFlagBuildAgentAdCampaignRefreshEligibility,
		onClear = if FFlagBuildAgentAdCampaignRefreshEligibility then function()
			-- upvalues: Callback (ref)
			Callback()
		end else nil,
		fetchFn = function(p2, _)
			-- upvalues: FetchEligibility (ref)
			return FetchEligibility((tonumber(p2)))
		end
	})
	local Effects = {}
	local T = if FFlagBuildAgentAdCampaignRefreshEligibility then {} else nil
	
	Callback = function()
		-- upvalues: FFlagBuildAgentAdCampaignRefreshEligibility (upval), T (copy), Effects (copy)
		if FFlagBuildAgentAdCampaignRefreshEligibility then
			for i, value in T do
				T[i] = nil
				
				if value.dispose ~= nil then
					value.dispose()
				end
			end
			return
		else
			for i1, effect in Effects do
				Effects[i1] = nil
				effect()
			end
		end
	end
	
	local LocalPlayer = Players.LocalPlayer
	local Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: Players (upval), LocalPlayer (ref), Callback (ref)
		if Players.LocalPlayer ~= LocalPlayer then
			LocalPlayer = Players.LocalPlayer
			Callback()
		end
	end)
	
	return {
		getEligibility = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem((tostring(p2)))
		end,
		fetchEligibility = function(p2, p3)
			-- upvalues: FFlagBuildAgentAdCampaignRefreshEligibility (upval), DataResolverModule (copy), T (copy), SignalsModule (upval), Effects (copy)
			if FFlagBuildAgentAdCampaignRefreshEligibility then
				local Text = tostring(p2)
				local IsRequestInQueueOrInFlight = DataResolverModule.isRequestInQueueOrInFlight(Text)
				
				if not IsRequestInQueueOrInFlight and p3 == nil then
					return DataResolverModule.fetchItem(Text)
				end
				local CachedItem = DataResolverModule.getCachedItem(Text)
				local Entry = T[Text]
				
				if Entry == nil then
					local config = {
						pending = IsRequestInQueueOrInFlight,
						callbacks = {},
						nextCallbacks = {}
					}
					
					if p3 ~= nil then
						table.insert(if IsRequestInQueueOrInFlight then config.nextCallbacks else config.callbacks, p3)
					end
					T[Text] = config
					
					if not IsRequestInQueueOrInFlight then
						DataResolverModule.fetchItem(Text)
					end
					config.dispose = SignalsModule.createEffect(function(p4)
						-- upvalues: CachedItem (copy), DataResolverModule (upval), Text (copy), config (copy), T (upval)
						local DataResult = CachedItem.data(p4)
						local StatusResult = CachedItem.status(p4)
						
						if StatusResult == "NotReady" or DataResolverModule.isRequestInQueueOrInFlight(Text) then return end
						local Callbacks = config.callbacks
						config.callbacks = config.nextCallbacks
						config.nextCallbacks = {}
						
						if config.pending then
							config.pending = false
							DataResolverModule.fetchItem(Text)
						else
							T[Text] = nil
							
							if config.dispose ~= nil then
								config.dispose()
							end
						end
						for _, callback in Callbacks do
							callback(if StatusResult == "Ready" then DataResult else nil)
						end
					end)
					
					return CachedItem
				else
					Entry.pending = true
					
					if p3 ~= nil then
						table.insert(Entry.nextCallbacks, p3)
					end
					return CachedItem
				end
			else
				local Text1 = tostring(p2)
				
				if not DataResolverModule.isRequestInQueueOrInFlight(Text1) then
					return DataResolverModule.fetchItem(Text1)
				end
				local CachedItem1 = DataResolverModule.getCachedItem(Text1)
				
				if Effects[Text1] == nil then
					Effects[Text1] = SignalsModule.createEffect(function(p4)
						-- upvalues: CachedItem1 (copy), DataResolverModule (upval), Text1 (copy), Effects (upval)
						CachedItem1.data(p4)
						CachedItem1.status(p4)
						
						if DataResolverModule.isRequestInQueueOrInFlight(Text1) then return end
						local Effect: () -> () = Effects[Text1]
						Effects[Text1] = nil
						
						if Effect ~= nil then
							Effect()
						end
						DataResolverModule.fetchItem(Text1)
					end)
				end
				return CachedItem1
			end
		end,
		getAndFetchEligibility = function(p4)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem((tostring(p4)))
		end,
		clear = function()
			-- upvalues: Callback (ref), DataResolverModule (copy)
			Callback()
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: Callback (ref), Connection (ref), DataResolverModule (copy)
			Callback()
			
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			DataResolverModule.dispose()
		end
	}
end
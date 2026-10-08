local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local profileInsightsModel = require(parent.ProfileInsights).ProfileInsightsModel
local multiGetProfileInsightsModule = require(script.Parent.Requests.MultiGetProfileInsights)
local _ = require(script.Parent.ProfileInsightsStoreTypes)
local profileInsightsStoreProcessDelaySec = game:DefineFastInt("ProfileInsightsStoreProcessDelaySec", 0)

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), profileInsightsStoreProcessDelaySec (ref), cryoModule (ref), multiGetProfileInsightsModule (ref), profileInsightsModel (ref)
	local var1 = createDataCacheModule()
	local t = {}
	local var2 = createDataResolverModule({
		cache = var1,
		queueProcessDelaySec = profileInsightsStoreProcessDelaySec,
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), t (ref), multiGetProfileInsightsModule (copy), profileInsightsModel (copy)
			local var3 = cryoModule.Dictionary.keys(p1)
			local rankingStrategy = nil
			local count = nil
			
			for i, v in var3 do
				local var4 = t[v]
				
				if var4 then
					if rankingStrategy == nil then
						rankingStrategy = var4.rankingStrategy
					end
					if count == nil then
						count = var4.count
					end
					t[v] = nil
				end
			end
			return multiGetProfileInsightsModule({
				userIds = var3,
				count = count,
				rankingStrategy = rankingStrategy
			}):andThen(function(p2)
				-- upvalues: profileInsightsModel (copy), var3 (ref)
				local var5 = profileInsightsModel.createProfileInsightsList(if p2 then p2.userInsights else nil)
				local t = {}
				
				for i, v in var3 do
					t[v] = {
						isOfflineFrequents = false,
						targetUserId = v,
						mutualFriends = {}
					}
				end
				for i, v_1 in var5 do
					if t[v_1.targetUserId] ~= nil then
						t[v_1.targetUserId] = v_1
					end
				end
				return t
			end)
		end
	})
	
	return {
		GetProfileInsight = function(p3, p4)
			-- upvalues: var2 (ref), t (ref)
			if p4 and p4.skipFetch then
				return var2.getCachedItem(p3)
			elseif p4 then
				t[p3] = { rankingStrategy = p4.rankingStrategy, count = p4.count }
			end
			return var2.getAndFetchItem(p3)
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end
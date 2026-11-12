local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local ProfileInsightsModel = require(Parent.ProfileInsights).ProfileInsightsModel
local MultiGetProfileInsightsModule = require(script.Parent.Requests.MultiGetProfileInsights)
local _ = require(script.Parent.ProfileInsightsStoreTypes)
local ProfileInsightsStoreProcessDelaySec = game:DefineFastInt("ProfileInsightsStoreProcessDelaySec", 0)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), ProfileInsightsStoreProcessDelaySec (copy), CryoModule (copy), MultiGetProfileInsightsModule (copy), ProfileInsightsModel (copy)
	local DataCacheModule = CreateDataCacheModule()
	local t = {}
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		queueProcessDelaySec = ProfileInsightsStoreProcessDelaySec,
		fetchFn = function(p1)
			-- upvalues: CryoModule (upval), t (copy), MultiGetProfileInsightsModule (upval), ProfileInsightsModel (upval)
			local KeysResult = CryoModule.Dictionary.keys(p1)
			local RankingStrategy = nil
			local Count = nil
			
			for _, value in KeysResult do
				local Entry = t[value]
				
				if Entry then
					if RankingStrategy == nil then
						RankingStrategy = Entry.rankingStrategy
					end
					if Count == nil then
						Count = Entry.count
					end
					t[value] = nil
				end
			end
			return MultiGetProfileInsightsModule({
				userIds = KeysResult,
				count = Count,
				rankingStrategy = RankingStrategy
			}):andThen(function(Result)
				-- upvalues: ProfileInsightsModel (upval), KeysResult (copy)
				local ProfileInsightsList = ProfileInsightsModel.createProfileInsightsList(if Result then Result.userInsights else nil)
				local t = {}
				
				for _, TargetUserId in KeysResult do
					t[TargetUserId] = {
						isOfflineFrequents = false,
						targetUserId = TargetUserId,
						mutualFriends = {}
					}
				end
				for _, value in ProfileInsightsList do
					if t[value.targetUserId] ~= nil then
						t[value.targetUserId] = value
					end
				end
				return t
			end)
		end
	})
	
	return {
		GetProfileInsight = function(Key, p2)
			-- upvalues: DataResolverModule (copy), t (copy)
			if p2 and p2.skipFetch then
				return DataResolverModule.getCachedItem(Key)
			end
			if p2 then
				t[Key] = { rankingStrategy = p2.rankingStrategy, count = p2.count }
			end
			return DataResolverModule.getAndFetchItem(Key)
		end,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end
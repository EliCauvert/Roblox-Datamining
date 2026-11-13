local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local ProfileInsightsModel = require(Parent.ProfileInsights).ProfileInsightsModel
local MultiGetProfileInsightsModule = require(script.Parent.Requests.MultiGetProfileInsights)
local _ = require(script.Parent.ProfileInsightsStoreTypes)
local FFlagProfileInsightsKeyByRankingStrategy = require(Parent.SharedFlags).FFlagProfileInsightsKeyByRankingStrategy
local ProfileInsightsStoreProcessDelaySec = game:DefineFastInt("ProfileInsightsStoreProcessDelaySec", 0)

local function createInsightBucket()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), ProfileInsightsStoreProcessDelaySec (copy), CryoModule (copy), MultiGetProfileInsightsModule (copy), ProfileInsightsModel (copy)
	local PendingFetchOptions = {}
	
	return {
		resolver = CreateDataResolverModule({
			replaceItems = true,
			cache = CreateDataCacheModule(),
			queueProcessDelaySec = ProfileInsightsStoreProcessDelaySec,
			onClear = function()
				-- upvalues: PendingFetchOptions (copy)
				table.clear(PendingFetchOptions)
			end,
			fetchFn = function(p1)
				-- upvalues: CryoModule (upval), PendingFetchOptions (copy), MultiGetProfileInsightsModule (upval), ProfileInsightsModel (upval)
				local KeysResult = CryoModule.Dictionary.keys(p1)
				local RankingStrategy = nil
				local Count = nil
				
				for _, value in KeysResult do
					local PendingFetchOption = PendingFetchOptions[value]
					
					if PendingFetchOption then
						if RankingStrategy == nil then
							RankingStrategy = PendingFetchOption.rankingStrategy
						end
						if Count == nil then
							Count = PendingFetchOption.count
						end
						PendingFetchOptions[value] = nil
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
		}),
		pendingFetchOptions = PendingFetchOptions
	}
end

local function createProfileInsightsStoreKeyedByRankingStrategy()
	-- upvalues: createInsightBucket (copy)
	local t = {}
	
	local function _(p2)
		-- upvalues: t (copy), createInsightBucket (upval)
		local P2 = p2 or ""
		local Entry = t[P2]
		
		if Entry == nil then
			Entry = createInsightBucket()
			t[P2] = Entry
		end
		return Entry
	end
	
	return {
		GetProfileInsight = function(p2, p3)
			-- upvalues: t (copy), createInsightBucket (upval)
			local RankingStrategy = (if p3 then p3.rankingStrategy else nil) or ""
			local Entry = t[RankingStrategy]
			
			if Entry == nil then
				Entry = createInsightBucket()
				t[RankingStrategy] = Entry
			end
			if p3 and p3.skipFetch then
				return Entry.resolver.getCachedItem(p2)
			end
			if p3 then
				Entry.pendingFetchOptions[p2] = { rankingStrategy = p3.rankingStrategy, count = p3.count }
			end
			return Entry.resolver.getAndFetchItem(p2)
		end,
		clear = function()
			-- upvalues: t (copy)
			for _, value in t do
				value.resolver.clear()
			end
		end,
		dispose = function()
			-- upvalues: t (copy)
			for _, value in t do
				value.resolver.dispose()
			end
		end
	}
end

local function createProfileInsightsStore()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), ProfileInsightsStoreProcessDelaySec (copy), CryoModule (copy), MultiGetProfileInsightsModule (copy), ProfileInsightsModel (copy)
	local DataCacheModule = CreateDataCacheModule()
	local t = {}
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		queueProcessDelaySec = ProfileInsightsStoreProcessDelaySec,
		fetchFn = function(p2)
			-- upvalues: CryoModule (upval), t (copy), MultiGetProfileInsightsModule (upval), ProfileInsightsModel (upval)
			local KeysResult = CryoModule.Dictionary.keys(p2)
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
		GetProfileInsight = function(Key, p3)
			-- upvalues: DataResolverModule (copy), t (copy)
			if p3 and p3.skipFetch then
				return DataResolverModule.getCachedItem(Key)
			end
			if p3 then
				t[Key] = { rankingStrategy = p3.rankingStrategy, count = p3.count }
			end
			return DataResolverModule.getAndFetchItem(Key)
		end,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end

return if FFlagProfileInsightsKeyByRankingStrategy then createProfileInsightsStoreKeyedByRankingStrategy else createProfileInsightsStore
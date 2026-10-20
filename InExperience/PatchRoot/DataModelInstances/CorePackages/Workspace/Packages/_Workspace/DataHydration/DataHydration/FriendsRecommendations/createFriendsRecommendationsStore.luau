local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local RequestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FriendsRecommendationsStoreTypes)
local ContextTypeModule = require(script.Parent.Enums.ContextType)
local FFlagAddFriendsPageUseSections = require(Parent.SharedFlags).FFlagAddFriendsPageUseSections
local config = {
	[ContextTypeModule.None] = true,
	[ContextTypeModule.MutualFriends] = true,
	[ContextTypeModule.Frequents] = true,
	[ContextTypeModule.Contacts] = true
}

local function _()
	-- upvalues: LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	
	if CurrentUserId == "" then
		local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
		
		return if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
	else
		return CurrentUserId
	end
end

local function normalizeRecommendation(p1)
	-- upvalues: config (copy)
	local ContactId = if p1.contactId and p1.contactId ~= "" then p1.contactId else nil
	
	return {
		id = tostring(ContactId or p1.id),
		rank = p1.rank or 0,
		hasIncomingFriendRequest = if p1.friendRequest then true else false,
		type = if ContactId then "Contact" else "User",
		contactProps = {
			contactId = ContactId,
			displayName = p1.displayName,
			thumbnailEntities = p1.thumbnailEntities
		},
		contextProps = {
			contextType = if p1.contextType and config[p1.contextType] then p1.contextType else nil,
			mutualFriendsCount = p1.mutualFriendsCount or (p1.mutualFriendsList and #p1.mutualFriendsList or nil)
		}
	}
end

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), RequestsModule (copy), LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy), CryoModule (copy), normalizeRecommendation (copy), FFlagAddFriendsPageUseSections (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(p1, _)
			-- upvalues: RequestsModule (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), CryoModule (upval), normalizeRecommendation (upval)
			local GetFriendsRecommendationsFunction = RequestsModule.GetFriendsRecommendations
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			return GetFriendsRecommendationsFunction(CurrentUserId1, p1):andThen(function(Result)
				-- upvalues: CryoModule (upval), normalizeRecommendation (upval)
				local MapResult = if Result.data then CryoModule.List.map(Result.data, normalizeRecommendation) else nil
				
				if MapResult then
					table.sort(MapResult, function(A, B): boolean
						return (A.rank or 0) < (B.rank or 0)
					end)
				end
				return {
					data = MapResult,
					recommendationRequestId = Result.recommendationRequestId
				}
			end)
		end
	})
	
	return {
		getFriendsRecommendations = function(p1, p2)
			-- upvalues: DataResolverModule (copy), FFlagAddFriendsPageUseSections (upval)
			if p2 and p2.skipFetch then
				return DataResolverModule.getCachedItem(p1)
			end
			if FFlagAddFriendsPageUseSections and p2 and p2.forceFetch and not DataResolverModule.isRequestInQueueOrInFlight(p1) then
				DataResolverModule.fetchItem(p1)
			end
			return DataResolverModule.getAndFetchItem(p1)
		end,
		refreshFriendsRecommendations = function(p1)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem(p1)
		end,
		removeFriendsRecommendationByUserId = function(p1, Id)
			-- upvalues: DataResolverModule (copy), DataCacheModule (copy)
			local DataResult = DataResolverModule.getCachedItem(p1).data(false)
			
			if DataResult == nil or DataResult.data == nil then return end
			local Data = {}
			
			for _, entry in DataResult.data do
				if entry.id ~= Id then
					table.insert(Data, entry)
				end
			end
			DataCacheModule.replaceItem(p1, {
				data = Data,
				recommendationRequestId = DataResult.recommendationRequestId
			})
		end,
		clear = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end
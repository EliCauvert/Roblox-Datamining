local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local requestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FriendsRecommendationsStoreTypes)
local contextTypeModule = require(script.Parent.Enums.ContextType)
local fFlagAddFriendsPageUseSections = require(parent.SharedFlags).FFlagAddFriendsPageUseSections
local t = {
	[contextTypeModule.None] = true,
	[contextTypeModule.MutualFriends] = true,
	[contextTypeModule.Frequents] = true,
	[contextTypeModule.Contacts] = true
}

local function _()
	-- upvalues: localUserIdStore (ref), getLocalPlayerUserId (ref)
	local currentUserId = localUserIdStore.getCurrentUserId(false)
	
	if currentUserId ~= "" then
		return currentUserId
	end
	local var1 = getLocalPlayerUserId()
	
	return if var1 then tostring(var1) else ""
end

local function normalizeRecommendation(p1)
	-- upvalues: t (ref)
	local var1 = if p1.contactId and p1.contactId ~= "" then p1.contactId else nil
	
	return {
		id = tostring(var1 or p1.id),
		rank = p1.rank or 0,
		hasIncomingFriendRequest = if p1.friendRequest then true else false,
		type = if var1 then "Contact" else "User",
		contactProps = {
			contactId = var1,
			displayName = p1.displayName,
			thumbnailEntities = p1.thumbnailEntities
		},
		contextProps = {
			contextType = if p1.contextType and t[p1.contextType] then p1.contextType else nil,
			mutualFriendsCount = p1.mutualFriendsCount or (if p1.mutualFriendsList then #p1.mutualFriendsList else nil)
		}
	}
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), requestsModule (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), cryoModule (ref), normalizeRecommendation (ref), fFlagAddFriendsPageUseSections (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(p1, _)
			-- upvalues: requestsModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), cryoModule (copy), normalizeRecommendation (copy)
			local var3
			local getFriendsRecommendations = requestsModule.GetFriendsRecommendations
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var4 = getLocalPlayerUserId()
				var3 = if var4 then tostring(var4) else ""
			else
				var3 = currentUserId
			end
			return getFriendsRecommendations(var3, p1):andThen(function(p2)
				-- upvalues: cryoModule (copy), normalizeRecommendation (copy)
				local var5 = if p2.data then cryoModule.List.map(p2.data, normalizeRecommendation) else nil
				
				if var5 then
					table.sort(var5, function(p3, p4)
						return (p3.rank or 0) < (p4.rank or 0)
					end)
				end
				return {
					data = var5,
					recommendationRequestId = p2.recommendationRequestId
				}
			end)
		end
	})
	
	return {
		getFriendsRecommendations = function(p1, p2)
			-- upvalues: var2 (ref), fFlagAddFriendsPageUseSections (copy)
			if p2 and p2.skipFetch then
				return var2.getCachedItem(p1)
			elseif fFlagAddFriendsPageUseSections and p2 and (p2.forceFetch and not var2.isRequestInQueueOrInFlight(p1)) then
				var2.fetchItem(p1)
			end
			return var2.getAndFetchItem(p1)
		end,
		refreshFriendsRecommendations = function(p1)
			-- upvalues: var2 (ref)
			return var2.fetchItem(p1)
		end,
		removeFriendsRecommendationByUserId = function(p1, p2)
			-- upvalues: var2 (ref), var1 (ref)
			local var3 = var2.getCachedItem(p1).data(false)
			
			if var3 == nil or var3.data == nil then return end
			local t = {}
			
			for i, v in var3.data do
				if v.id ~= p2 then
					table.insert(t, v)
				end
			end
			var1.replaceItem(p1, {
				data = t,
				recommendationRequestId = var3.recommendationRequestId
			})
		end,
		clear = function()
			-- upvalues: var2 (ref)
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref)
			var2.dispose()
		end
	}
end
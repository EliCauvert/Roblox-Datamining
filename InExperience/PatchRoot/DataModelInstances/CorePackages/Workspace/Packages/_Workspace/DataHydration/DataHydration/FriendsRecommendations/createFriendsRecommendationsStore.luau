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
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), requestsModule (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), cryoModule (ref), normalizeRecommendation (ref)
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(),
		fetchFn = function(p1, _)
			-- upvalues: requestsModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), cryoModule (copy), normalizeRecommendation (copy)
			local var2
			local getFriendsRecommendations = requestsModule.GetFriendsRecommendations
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var3 = getLocalPlayerUserId()
				var2 = if var3 then tostring(var3) else ""
			else
				var2 = currentUserId
			end
			return getFriendsRecommendations(var2, p1):andThen(function(p2)
				-- upvalues: cryoModule (copy), normalizeRecommendation (copy)
				local var4 = if p2.data then cryoModule.List.map(p2.data, normalizeRecommendation) else nil
				
				if var4 then
					table.sort(var4, function(p3, p4)
						return (p3.rank or 0) < (p4.rank or 0)
					end)
				end
				return {
					data = var4,
					recommendationRequestId = p2.recommendationRequestId
				}
			end)
		end
	})
	
	return {
		getFriendsRecommendations = function(p1, p2)
			-- upvalues: var1 (ref)
			return if p2 and p2.skipFetch then var1.getCachedItem(p1) else var1.getAndFetchItem(p1)
		end,
		refreshFriendsRecommendations = function(p1)
			-- upvalues: var1 (ref)
			return var1.fetchItem(p1)
		end,
		clear = function()
			-- upvalues: var1 (ref)
			var1.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref)
			var1.dispose()
		end
	}
end
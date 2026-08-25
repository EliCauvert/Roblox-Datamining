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
	local var9 = getLocalPlayerUserId()
	
	return if var9 then tostring(var9) else ""
end

local function normalizeRecommendation(p0)
	-- upvalues: t (ref)
	local var10 = if p0.contactId and p0.contactId ~= "" then p0.contactId else nil
	
	return {
		id = tostring(var10 or p0.id),
		rank = p0.rank or 0,
		hasIncomingFriendRequest = if p0.friendRequest then true else false,
		type = if var10 then "Contact" else "User",
		contactProps = {
			contactId = var10,
			displayName = p0.displayName,
			thumbnailEntities = p0.thumbnailEntities
		},
		contextProps = {
			contextType = if p0.contextType and t[p0.contextType] then p0.contextType else nil,
			mutualFriendsCount = p0.mutualFriendsCount or (if p0.mutualFriendsList then #p0.mutualFriendsList else nil)
		}
	}
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), requestsModule (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), cryoModule (ref), normalizeRecommendation (ref)
	local var11 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(),
		fetchFn = function(p1, _)
			-- upvalues: requestsModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), cryoModule (copy), normalizeRecommendation (copy)
			local var13
			local getFriendsRecommendations = requestsModule.GetFriendsRecommendations
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var14 = getLocalPlayerUserId()
				var13 = if var14 then tostring(var14) else ""
			else
				var13 = currentUserId
			end
			return getFriendsRecommendations(var13, p1):andThen(function(p2)
				-- upvalues: cryoModule (copy), normalizeRecommendation (copy)
				local var15 = if p2.data then cryoModule.List.map(p2.data, normalizeRecommendation) else nil
				
				if var15 then
					table.sort(var15, function(p3, p4)
						return (p3.rank or 0) < (p4.rank or 0)
					end)
				end
				return {
					data = var15,
					recommendationRequestId = p2.recommendationRequestId
				}
			end)
		end
	})
	
	return {
		getFriendsRecommendations = function(p5, p6)
			-- upvalues: var11 (ref)
			return if p6 and p6.skipFetch then var11.getCachedItem(p5) else var11.getAndFetchItem(p5)
		end,
		refreshFriendsRecommendations = function(p7)
			-- upvalues: var11 (ref)
			return var11.fetchItem(p7)
		end,
		clear = function()
			-- upvalues: var11 (ref)
			var11.clear()
		end,
		dispose = function()
			-- upvalues: var11 (ref)
			var11.dispose()
		end
	}
end
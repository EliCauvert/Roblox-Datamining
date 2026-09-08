local friendsCommon = script:FindFirstAncestor("FriendsCommon")
local parent = friendsCommon.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local apolloClientModule = require(parent.ApolloClient)
local useQuery = apolloClientModule.useQuery
local useApolloClient = apolloClientModule.useApolloClient
local queries = require(parent.ApolloLocalState).queries
local apolloFriendsModule = require(parent.ApolloFriends)
local apolloPresenceModule = require(parent.ApolloPresence)
local presenceType = require(parent.GraphQLServer).types.PresenceType
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationModule = require(parent.DataHydration)
local friendsCommonPresenceUpdateSignal = require(friendsCommon.Signals).FriendsCommonPresenceUpdateSignal
local friendsListDefaultPageSize = game:DefineFastInt("FriendsListDefaultPageSize", 12)
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local usePresenceImpressionEventsModule = require(script.Parent.usePresenceImpressionEvents)
local useFriendsListOrderedByIdPresenceImpressionEventsEnabled = game:DefineFastFlag("UseFriendsListOrderedByIdPresenceImpressionEventsEnabled", false)
local var1 = dataHydrationModule.Friends.FriendsStore.get()

local _ = function(p1)
	-- upvalues: cryoModule (ref), presenceType (ref)
	return cryoModule.List.map(p1, function(p2)
		-- upvalues: presenceType (copy), cryoModule (copy)
		return if p2.presence and p2.presence.userPresenceType == presenceType.InGame and p2.presence.universeId == "" then cryoModule.Dictionary.join(p2, {
			presence = cryoModule.Dictionary.join(p2.presence, { userPresenceType = presenceType.Online })
		}) else p2
	end)
end

local var2 = function(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in p1 do
		t[v.id] = v.presence
	end
	local _ = nil
	
	return cryoModule.List.sort(p1, function(p3, p4)
		return p4.sortScore < p3.sortScore
	end), cryoModule.List.filter(p2 or {}, function(p3)
		-- upvalues: t (ref)
		return not t[p3.id]
	end)
end

local function shouldRefetchOnlineFriends(p3, p4, p5)
	-- upvalues: queries (ref), cryoModule (ref), apolloPresenceModule (ref), presenceType (ref)
	local var3 = p3:readQuery({ query = queries.onlineFriendsByUserId, variables = p4 })
	local t = {}
	
	for i, v in (if var3 then var3.onlineFriendsByUserId else {}) or {} do
		t[v.id] = v.presence
	end
	return #cryoModule.List.filter(p5, function(p6)
		-- upvalues: apolloPresenceModule (copy), presenceType (copy), t (ref)
		return apolloPresenceModule.Formatters.formatNumberToPresenceType(p6.userPresenceType) ~= presenceType.Offline and not t[tostring(p6.userId)]
	end) > 0
end

local function bulkUpdateUserPresences(p6, p7)
	-- upvalues: apolloPresenceModule (ref)
	for i, v in p7 do
		apolloPresenceModule.Mutations.createUserPresenceCache(p6, {
			id = v.userId,
			userPresenceNumber = v.userPresenceType,
			lastLocation = v.lastLocation,
			lastOnline = v.lastOnline,
			gameId = v.gameId,
			placeId = v.placeId,
			rootPlaceId = v.rootPlaceId,
			universeId = v.universeId
		})
	end
end

return function(p8)
	-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (ref), useApolloClient (ref), reactModule (ref), var1 (ref), useSignalState (ref), friendsListDefaultPageSize (ref), apolloFriendsModule (ref), useQuery (ref), queries (ref), cryoModule (ref), friendsCommonPresenceUpdateSignal (ref), bulkUpdateUserPresences (ref), shouldRefetchOnlineFriends (ref), var2 (ref), presenceType (ref), useFriendsListOrderedByIdPresenceImpressionEventsEnabled (ref), usePresenceImpressionEventsModule (ref), dataHydrationModule (ref)
	local var4 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useApolloClient()
	local var5 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetOnlineFriends()
	end, {}) else nil) else nil
	local pageSize = p8.pageSize or friendsListDefaultPageSize
	local var6 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetAllFriends()
	end, {}) else nil) else nil
	local var7 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetAllFriendsStatus()
	end, {}) else nil) else nil
	local t = {
		userId = p8.userId,
		sort = apolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.allFriendsByUserId, {
		errorPolicy = "all",
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = cryoModule.Dictionary.join(t, { pageCursor = "", pageLimit = pageSize })
	})
	local var11 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.onlineFriendsByUserId, {
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = t
	})
	local var12 = if fFlagFriendSortedByPresenceSignalsImplementation then if var6 then var6.nextCursor else nil elseif var10.data then var10.data.allFriendsByUserId.nextCursor else nil
	local var13 = if fFlagFriendSortedByPresenceSignalsImplementation then if var6 then var6.friends else nil elseif var10.data then var10.data.allFriendsByUserId.friends else nil
	local var14 = if fFlagFriendSortedByPresenceSignalsImplementation then if var6 then var6.hasMore else nil else nil
	local var15 = if fFlagFriendSortedByPresenceSignalsImplementation then var5 or {} elseif var11.data then var11.data.onlineFriendsByUserId else {}
	local var16 = reactModule.useCallback(function()
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), var14 (ref), var12 (ref), var10 (ref), var1 (copy), pageSize (ref), var9 (ref), var8 (ref)
		if fFlagFriendSortedByPresenceSignalsImplementation then
			if not var14 then return end
		elseif not var12 or var12 == "" or var10.loading then return end
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.FetchMoreFriends()
			
			return
		end
		var10:fetchMore({ variables = { pageCursor = var12, pageLimit = pageSize } }):andThen(function(p9)
			-- upvalues: var9 (copy)
			var9.current = p9 and p9.errors
		end)
		var8.current = var12
	end, {
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var12,
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var10.loading,
		if fFlagFriendSortedByPresenceSignalsImplementation then var14 else nil
	})
	
	local var17 = function()
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), var1 (copy), var11 (ref), var10 (ref), var8 (ref), var9 (ref)
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.RefetchOnlineFriends()
			var1.RefetchAllFriends()
			
			return
		end
		var11:refetch()
		var10:refetch()
		var8.current = nil
		var9.current = nil
	end
	
	if not fFlagFriendSortedByPresenceSignalsImplementation then
		reactModule.useEffect(function()
			-- upvalues: friendsCommonPresenceUpdateSignal (copy), bulkUpdateUserPresences (copy), var4 (ref), shouldRefetchOnlineFriends (copy), t (ref), fFlagFriendSortedByPresenceSignalsImplementation (copy), var1 (copy), var11 (ref)
			friendsCommonPresenceUpdateSignal.Event:Connect(function(p9)
				-- upvalues: bulkUpdateUserPresences (copy), var4 (copy), shouldRefetchOnlineFriends (copy), t (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), var1 (copy), var11 (copy)
				bulkUpdateUserPresences(var4, p9)
				
				if shouldRefetchOnlineFriends(var4, t, p9) then
					if fFlagFriendSortedByPresenceSignalsImplementation then
						var1._fetchOnlineFriendsAsync()
						
						return
					end
					var11:refetch()
				end
			end)
			
			return function()
				-- upvalues: friendsCommonPresenceUpdateSignal (copy)
				friendsCommonPresenceUpdateSignal:Destroy()
			end
		end, {})
	end
	local var18, var19 = reactModule.useMemo(function()
		-- upvalues: var2 (copy), var15 (ref), cryoModule (copy), presenceType (copy), var13 (ref)
		return var2(cryoModule.List.map(var15, function(p9)
			-- upvalues: presenceType (copy), cryoModule (copy)
			return if p9.presence and p9.presence.userPresenceType == presenceType.InGame and p9.presence.universeId == "" then cryoModule.Dictionary.join(p9, {
				presence = cryoModule.Dictionary.join(p9.presence, { userPresenceType = presenceType.Online })
			}) else p9
		end), var13)
	end, { var15, var13 })
	
	if useFriendsListOrderedByIdPresenceImpressionEventsEnabled then
		usePresenceImpressionEventsModule(var15)
	end
	local loading
	local var20 = not var12 or var12 == ""
	
	if fFlagFriendSortedByPresenceSignalsImplementation then
		loading = false
		
		if var6 == nil then
			local _ = var7 == dataHydrationModule.DataStatus.NotReady
		end
	else
		loading = var10.loading
	end
	return {
		onlineFriends = var18,
		offlineFriends = var19,
		fetchMoreFriends = var16,
		refreshFriendsData = var17,
		isEndOfList = if fFlagFriendSortedByPresenceSignalsImplementation then not var14 else var20,
		isLoading = loading
	}
end
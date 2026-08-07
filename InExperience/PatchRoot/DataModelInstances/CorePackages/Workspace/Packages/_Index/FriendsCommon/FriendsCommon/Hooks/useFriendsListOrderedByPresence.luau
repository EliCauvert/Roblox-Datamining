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
local var10 = if fFlagFriendSortedByPresenceSignalsImplementation then dataHydrationModule.Friends.FriendsStore.get() else nil

local _ = function(p0) --[[ line: 50 ]]
	-- upvalues: cryoModule (ref), presenceType (ref)
	return cryoModule.List.map(p0, function(p1) --[[ line: 51 ]]
		-- upvalues: presenceType (copy), cryoModule (copy)
		return if p1.presence and p1.presence.userPresenceType == presenceType.InGame and p1.presence.universeId == "" then cryoModule.Dictionary.join(p1, {
			presence = cryoModule.Dictionary.join(p1.presence, { userPresenceType = presenceType.Online })
		}) else p1
	end)
end

local var11 = function(p2, p3) --[[ line: 64 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in p2 do
		t[v.id] = v.presence
	end
	local _ = nil
	
	return cryoModule.List.sort(p2, function(p4, p5) --[[ line: 81 ]]
		return p5.sortScore < p4.sortScore
	end), cryoModule.List.filter(p3 or {}, function(p6) --[[ line: 74 ]]
		-- upvalues: t (ref)
		return not t[p6.id]
	end)
end

local function shouldRefetchOnlineFriends(p7, p8, p9) --[[ line: 90 ]]
	-- upvalues: queries (ref), cryoModule (ref), apolloPresenceModule (ref), presenceType (ref)
	local var15 = p7:readQuery({ query = queries.onlineFriendsByUserId, variables = p8 })
	local t = {}
	
	for i, v in (if var15 then var15.onlineFriendsByUserId else {}) or {} do
		t[v.id] = v.presence
	end
	return #cryoModule.List.filter(p9, function(p10) --[[ line: 103 ]]
		-- upvalues: apolloPresenceModule (copy), presenceType (copy), t (ref)
		return apolloPresenceModule.Formatters.formatNumberToPresenceType(p10.userPresenceType) ~= presenceType.Offline and not t[tostring(p10.userId)]
	end) > 0
end

local function bulkUpdateUserPresences(p11, p12) --[[ line: 111 ]]
	-- upvalues: apolloPresenceModule (ref)
	for i, v in p12 do
		apolloPresenceModule.Mutations.createUserPresenceCache(p11, {
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

return function(p13) --[[ line: 126 | named "useFriendsListOrderedByPresence" ]]
	-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (ref), useApolloClient (ref), reactModule (ref), var10 (ref), useSignalState (ref), friendsListDefaultPageSize (ref), apolloFriendsModule (ref), useQuery (ref), queries (ref), cryoModule (ref), friendsCommonPresenceUpdateSignal (ref), bulkUpdateUserPresences (ref), shouldRefetchOnlineFriends (ref), var11 (ref), presenceType (ref), useFriendsListOrderedByIdPresenceImpressionEventsEnabled (ref), usePresenceImpressionEventsModule (ref), dataHydrationModule (ref)
	local var17 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useApolloClient()
	local var18 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function() --[[ line: 137 ]]
		-- upvalues: var10 (copy)
		return var10.GetOnlineFriends()
	end, {}) else nil) else nil
	local pageSize = p13.pageSize or friendsListDefaultPageSize
	local var20 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function() --[[ line: 149 ]]
		-- upvalues: var10 (copy)
		return var10.GetAllFriends()
	end, {}) else nil) else nil
	local var21 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function() --[[ line: 159 ]]
		-- upvalues: var10 (copy)
		return var10.GetAllFriendsStatus()
	end, {}) else nil) else nil
	local t = {
		userId = p13.userId,
		sort = apolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local var25 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.allFriendsByUserId, {
		errorPolicy = "all",
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = cryoModule.Dictionary.join(t, { pageCursor = "", pageLimit = pageSize })
	})
	local var26 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.onlineFriendsByUserId, {
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = t
	})
	local var27 = if fFlagFriendSortedByPresenceSignalsImplementation then if var20 then var20.nextCursor else nil elseif var25.data then var25.data.allFriendsByUserId.nextCursor else nil
	local var28 = if fFlagFriendSortedByPresenceSignalsImplementation then if var20 then var20.friends else nil elseif var25.data then var25.data.allFriendsByUserId.friends else nil
	local var29 = if fFlagFriendSortedByPresenceSignalsImplementation then if var20 then var20.hasMore else nil else nil
	local var30 = if fFlagFriendSortedByPresenceSignalsImplementation then var18 or {} elseif var26.data then var26.data.onlineFriendsByUserId else {}
	local var31 = reactModule.useCallback(function() --[[ line: 210 ]]
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), var29 (ref), var27 (ref), var25 (ref), var10 (copy), pageSize (ref), var24 (ref), var23 (ref)
		if fFlagFriendSortedByPresenceSignalsImplementation then
			if not var29 then return end
		elseif not var27 or var27 == "" or var25.loading then return end
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var10.FetchMoreFriends()
			
			return
		end
		var25:fetchMore({ variables = { pageCursor = var27, pageLimit = pageSize } }):andThen(function(p14) --[[ line: 233 ]]
			-- upvalues: var24 (copy)
			var24.current = p14 and p14.errors
		end)
		var23.current = var27
	end, {
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var27,
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var25.loading,
		if fFlagFriendSortedByPresenceSignalsImplementation then var29 else nil
	})
	
	local var32 = function() --[[ line: 245 ]]
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), var10 (copy), var26 (ref), var25 (ref), var23 (ref), var24 (ref)
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var10.RefetchOnlineFriends()
			var10.RefetchAllFriends()
			
			return
		end
		var26:refetch()
		var25:refetch()
		var23.current = nil
		var24.current = nil
	end
	
	if not fFlagFriendSortedByPresenceSignalsImplementation then
		reactModule.useEffect(function() --[[ line: 258 ]]
			-- upvalues: friendsCommonPresenceUpdateSignal (copy), bulkUpdateUserPresences (copy), var17 (ref), shouldRefetchOnlineFriends (copy), t (ref), fFlagFriendSortedByPresenceSignalsImplementation (copy), var10 (copy), var26 (ref)
			friendsCommonPresenceUpdateSignal.Event:Connect(function(p15) --[[ line: 259 ]]
				-- upvalues: bulkUpdateUserPresences (copy), var17 (copy), shouldRefetchOnlineFriends (copy), t (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), var10 (copy), var26 (copy)
				bulkUpdateUserPresences(var17, p15)
				
				if shouldRefetchOnlineFriends(var17, t, p15) then
					if fFlagFriendSortedByPresenceSignalsImplementation then
						var10._fetchOnlineFriendsAsync()
						
						return
					end
					var26:refetch()
				end
			end)
			
			return function() --[[ line: 270 ]]
				-- upvalues: friendsCommonPresenceUpdateSignal (copy)
				friendsCommonPresenceUpdateSignal:Destroy()
			end
		end, {})
	end
	local var33, var34 = reactModule.useMemo(function() --[[ line: 276 ]]
		-- upvalues: var11 (copy), var30 (ref), cryoModule (copy), presenceType (copy), var28 (ref)
		return var11(cryoModule.List.map(var30, function(p16) --[[ line: 51 ]]
			-- upvalues: presenceType (copy), cryoModule (copy)
			return if p16.presence and p16.presence.userPresenceType == presenceType.InGame and p16.presence.universeId == "" then cryoModule.Dictionary.join(p16, {
				presence = cryoModule.Dictionary.join(p16.presence, { userPresenceType = presenceType.Online })
			}) else p16
		end), var28)
	end, { var30, var28 })
	
	if useFriendsListOrderedByIdPresenceImpressionEventsEnabled then
		usePresenceImpressionEventsModule(var30)
	end
	local loading
	local var35 = not var27 or var27 == ""
	
	if fFlagFriendSortedByPresenceSignalsImplementation then
		loading = false
		
		if var20 == nil then
			local _ = var21 == dataHydrationModule.DataStatus.NotReady
		end
	else
		loading = var25.loading
	end
	return {
		onlineFriends = var33,
		offlineFriends = var34,
		fetchMoreFriends = var31,
		refreshFriendsData = var32,
		isEndOfList = if fFlagFriendSortedByPresenceSignalsImplementation then not var29 else var35,
		isLoading = loading
	}
end
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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableUseSortScoresForFriendsCarouselLoad = sharedFlagsModule.FFlagEnableUseSortScoresForFriendsCarouselLoad
local fFlagFriendSortedByPresenceSignalsImplementation = sharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local usePresenceImpressionEventsModule = require(script.Parent.usePresenceImpressionEvents)
local useFriendsListOrderedByIdPresenceImpressionEventsEnabled = game:DefineFastFlag("UseFriendsListOrderedByIdPresenceImpressionEventsEnabled", false)
local var11 = if fFlagFriendSortedByPresenceSignalsImplementation then dataHydrationModule.Friends.FriendsStore.get() else nil

local _ = function(p0) --[[ line: 51 ]]
	-- upvalues: cryoModule (ref), presenceType (ref)
	return cryoModule.List.map(p0, function(p1) --[[ line: 52 ]]
		-- upvalues: presenceType (copy), cryoModule (copy)
		return if p1.presence and p1.presence.userPresenceType == presenceType.InGame and p1.presence.universeId == "" then cryoModule.Dictionary.join(p1, {
			presence = cryoModule.Dictionary.join(p1.presence, { userPresenceType = presenceType.Online })
		}) else p1
	end)
end

local var12 = function(p2, p3) --[[ line: 65 ]]
	-- upvalues: cryoModule (ref), fFlagEnableUseSortScoresForFriendsCarouselLoad (ref), presenceType (ref)
	local t = {}
	
	for i, v in p2 do
		t[v.id] = v.presence
	end
	local var20
	local var16 = cryoModule.List.filter(p3 or {}, function(p4) --[[ line: 75 ]]
		-- upvalues: t (ref)
		return not t[p4.id]
	end)
	local _ = nil
	
	if fFlagEnableUseSortScoresForFriendsCarouselLoad then
		var20 = cryoModule.List.sort(p2, function(p5, p6) --[[ line: 83 ]]
			return p6.sortScore < p5.sortScore
		end)
	else
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		for i_1, v_1 in p2 do
			local var21 = if v_1.presence then v_1.presence.userPresenceType else presenceType.Offline
			
			if var21 == presenceType.InGame then
				table.insert(t_1, v_1)
			elseif var21 == presenceType.InStudio then
				table.insert(t_2, v_1)
			else
				table.insert(t_3, v_1)
			end
		end
		var20 = cryoModule.List.join(t_1, t_3, t_2)
	end
	return var20, var16
end

local function shouldRefetchOnlineFriends(p7, p8, p9) --[[ line: 108 ]]
	-- upvalues: queries (ref), cryoModule (ref), apolloPresenceModule (ref), presenceType (ref)
	local var22 = p7:readQuery({ query = queries.onlineFriendsByUserId, variables = p8 })
	local t = {}
	
	for i, v in (if var22 then var22.onlineFriendsByUserId else {}) or {} do
		t[v.id] = v.presence
	end
	return #cryoModule.List.filter(p9, function(p10) --[[ line: 121 ]]
		-- upvalues: apolloPresenceModule (copy), presenceType (copy), t (ref)
		return apolloPresenceModule.Formatters.formatNumberToPresenceType(p10.userPresenceType) ~= presenceType.Offline and not t[tostring(p10.userId)]
	end) > 0
end

local function bulkUpdateUserPresences(p11, p12) --[[ line: 129 ]]
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

return function(p13) --[[ line: 144 | named "useFriendsListOrderedByPresence" ]]
	-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (ref), useApolloClient (ref), reactModule (ref), var11 (ref), useSignalState (ref), friendsListDefaultPageSize (ref), apolloFriendsModule (ref), useQuery (ref), queries (ref), cryoModule (ref), friendsCommonPresenceUpdateSignal (ref), bulkUpdateUserPresences (ref), shouldRefetchOnlineFriends (ref), var12 (ref), presenceType (ref), useFriendsListOrderedByIdPresenceImpressionEventsEnabled (ref), usePresenceImpressionEventsModule (ref), dataHydrationModule (ref)
	local var24 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useApolloClient()
	local var25 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function() --[[ line: 155 ]]
		-- upvalues: var11 (copy)
		return var11.GetOnlineFriends()
	end, {}) else nil) else nil
	local pageSize = p13.pageSize or friendsListDefaultPageSize
	local var27 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function() --[[ line: 167 ]]
		-- upvalues: var11 (copy)
		return var11.GetAllFriends()
	end, {}) else nil) else nil
	local var28 = if fFlagFriendSortedByPresenceSignalsImplementation then useSignalState(if fFlagFriendSortedByPresenceSignalsImplementation then reactModule.useMemo(function() --[[ line: 177 ]]
		-- upvalues: var11 (copy)
		return var11.GetAllFriendsStatus()
	end, {}) else nil) else nil
	local t = {
		userId = p13.userId,
		sort = apolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useRef(nil)
	local var32 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.allFriendsByUserId, {
		errorPolicy = "all",
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = cryoModule.Dictionary.join(t, { pageCursor = "", pageLimit = pageSize })
	})
	local var33 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.onlineFriendsByUserId, {
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = t
	})
	local var34 = if fFlagFriendSortedByPresenceSignalsImplementation then if var27 then var27.nextCursor else nil elseif var32.data then var32.data.allFriendsByUserId.nextCursor else nil
	local var35 = if fFlagFriendSortedByPresenceSignalsImplementation then if var27 then var27.friends else nil elseif var32.data then var32.data.allFriendsByUserId.friends else nil
	local var36 = if fFlagFriendSortedByPresenceSignalsImplementation then if var27 then var27.hasMore else nil else nil
	local var37 = if fFlagFriendSortedByPresenceSignalsImplementation then var25 or {} elseif var33.data then var33.data.onlineFriendsByUserId else {}
	local var38 = reactModule.useCallback(function() --[[ line: 228 ]]
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), var36 (ref), var34 (ref), var32 (ref), var11 (copy), pageSize (ref), var31 (ref), var30 (ref)
		if fFlagFriendSortedByPresenceSignalsImplementation then
			if not var36 then return end
		elseif not var34 or var34 == "" or var32.loading then return end
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var11.FetchMoreFriends()
			
			return
		end
		var32:fetchMore({ variables = { pageCursor = var34, pageLimit = pageSize } }):andThen(function(p14) --[[ line: 251 ]]
			-- upvalues: var31 (copy)
			var31.current = p14 and p14.errors
		end)
		var30.current = var34
	end, {
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var34,
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var32.loading,
		if fFlagFriendSortedByPresenceSignalsImplementation then var36 else nil
	})
	
	local var39 = function() --[[ line: 263 ]]
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), var11 (copy), var33 (ref), var32 (ref), var30 (ref), var31 (ref)
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var11.RefetchOnlineFriends()
			var11.RefetchAllFriends()
			
			return
		end
		var33:refetch()
		var32:refetch()
		var30.current = nil
		var31.current = nil
	end
	
	if not fFlagFriendSortedByPresenceSignalsImplementation then
		reactModule.useEffect(function() --[[ line: 276 ]]
			-- upvalues: friendsCommonPresenceUpdateSignal (copy), bulkUpdateUserPresences (copy), var24 (ref), shouldRefetchOnlineFriends (copy), t (ref), fFlagFriendSortedByPresenceSignalsImplementation (copy), var11 (copy), var33 (ref)
			friendsCommonPresenceUpdateSignal.Event:Connect(function(p15) --[[ line: 277 ]]
				-- upvalues: bulkUpdateUserPresences (copy), var24 (copy), shouldRefetchOnlineFriends (copy), t (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), var11 (copy), var33 (copy)
				bulkUpdateUserPresences(var24, p15)
				
				if shouldRefetchOnlineFriends(var24, t, p15) then
					if fFlagFriendSortedByPresenceSignalsImplementation then
						var11._fetchOnlineFriendsAsync()
						
						return
					end
					var33:refetch()
				end
			end)
			
			return function() --[[ line: 288 ]]
				-- upvalues: friendsCommonPresenceUpdateSignal (copy)
				friendsCommonPresenceUpdateSignal:Destroy()
			end
		end, {})
	end
	local var40, var41 = reactModule.useMemo(function() --[[ line: 294 ]]
		-- upvalues: var12 (copy), var37 (ref), cryoModule (copy), presenceType (copy), var35 (ref)
		return var12(cryoModule.List.map(var37, function(p16) --[[ line: 52 ]]
			-- upvalues: presenceType (copy), cryoModule (copy)
			return if p16.presence and p16.presence.userPresenceType == presenceType.InGame and p16.presence.universeId == "" then cryoModule.Dictionary.join(p16, {
				presence = cryoModule.Dictionary.join(p16.presence, { userPresenceType = presenceType.Online })
			}) else p16
		end), var35)
	end, { var37, var35 })
	
	if useFriendsListOrderedByIdPresenceImpressionEventsEnabled then
		usePresenceImpressionEventsModule(var37)
	end
	local loading
	local var42 = not var34 or var34 == ""
	
	if fFlagFriendSortedByPresenceSignalsImplementation then
		loading = false
		
		if var27 == nil then
			local _ = var28 == dataHydrationModule.DataStatus.NotReady
		end
	else
		loading = var32.loading
	end
	return {
		onlineFriends = var40,
		offlineFriends = var41,
		fetchMoreFriends = var38,
		refreshFriendsData = var39,
		isEndOfList = if fFlagFriendSortedByPresenceSignalsImplementation then not var36 else var42,
		isLoading = loading
	}
end
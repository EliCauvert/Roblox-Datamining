local FriendsCommon = script:FindFirstAncestor("FriendsCommon")
local Parent = FriendsCommon.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ApolloClientModule = require(Parent.ApolloClient)
local UseQueryFunction = ApolloClientModule.useQuery
local UseApolloClientFunction = ApolloClientModule.useApolloClient
local Queries = require(Parent.ApolloLocalState).queries
local ApolloFriendsModule = require(Parent.ApolloFriends)
local ApolloPresenceModule = require(Parent.ApolloPresence)
local PresenceType = require(Parent.GraphQLServer).types.PresenceType
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DataHydrationModule = require(Parent.DataHydration)
local FriendsCommonPresenceUpdateSignal = require(FriendsCommon.Signals).FriendsCommonPresenceUpdateSignal
local FriendsListDefaultPageSize = game:DefineFastInt("FriendsListDefaultPageSize", 12)
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local UsePresenceImpressionEventsModule = require(script.Parent.usePresenceImpressionEvents)
local UseFriendsListOrderedByIdPresenceImpressionEventsEnabled = game:DefineFastFlag("UseFriendsListOrderedByIdPresenceImpressionEventsEnabled", false)
local GetResult = DataHydrationModule.Friends.FriendsStore.get()

local function _(p1) --[[ Line: 48 ]]
	-- upvalues: CryoModule (copy), PresenceType (copy)
	return CryoModule.List.map(p1, function(p2) --[[ Line: 49 ]]
		-- upvalues: PresenceType (upval), CryoModule (upval)
		return if p2.presence and p2.presence.userPresenceType == PresenceType.InGame and p2.presence.universeId == "" then CryoModule.Dictionary.join(p2, {
			presence = CryoModule.Dictionary.join(p2.presence, { userPresenceType = PresenceType.Online })
		}) else p2
	end)
end

local function v17(MapResult, Friends) --[[ Line: 62 ]]
	-- upvalues: CryoModule (copy)
	local Presences = {}
	
	for _, value in MapResult do
		Presences[value.id] = value.presence
	end
	return CryoModule.List.sort(MapResult, function(p1, p2): boolean --[[ Line: 79 ]]
		return p2.sortScore < p1.sortScore
	end), (CryoModule.List.filter(Friends or {}, function(p1): boolean --[[ Line: 72 ]]
		-- upvalues: Presences (copy)
		return not Presences[p1.id]
	end))
end

local function shouldRefetchOnlineFriends(p1, Variables, p2): boolean --[[ Line: 88 ]]
	-- upvalues: Queries (copy), CryoModule (copy), ApolloPresenceModule (copy), PresenceType (copy)
	local Query = p1:readQuery({
		query = Queries.onlineFriendsByUserId,
		variables = Variables
	})
	local Presences = {}
	local OnlineFriendsByUserId = (if Query then Query.onlineFriendsByUserId else {}) or {}
	for _, value in OnlineFriendsByUserId do
		Presences[value.id] = value.presence
	end
	return #CryoModule.List.filter(p2, function(p3): boolean --[[ Line: 101 ]]
		-- upvalues: ApolloPresenceModule (upval), PresenceType (upval), Presences (copy)
		return ApolloPresenceModule.Formatters.formatNumberToPresenceType(p3.userPresenceType) ~= PresenceType.Offline and not Presences[tostring(p3.userId)]
	end) > 0
end

local function bulkUpdateUserPresences(p3, List) --[[ Line: 109 ]]
	-- upvalues: ApolloPresenceModule (copy)
	for _, value in List do
		ApolloPresenceModule.Mutations.createUserPresenceCache(p3, {
			id = value.userId,
			userPresenceNumber = value.userPresenceType,
			lastLocation = value.lastLocation,
			lastOnline = value.lastOnline,
			gameId = value.gameId,
			placeId = value.placeId,
			rootPlaceId = value.rootPlaceId,
			universeId = value.universeId
		})
	end
end

return function(p4) --[[ Line: 124 | Named "useFriendsListOrderedByPresence" ]]
	-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (copy), UseApolloClientFunction (copy), ReactModule (copy), GetResult (copy), UseSignalStateFunction (copy), FriendsListDefaultPageSize (copy), ApolloFriendsModule (copy), UseQueryFunction (copy), Queries (copy), CryoModule (copy), FriendsCommonPresenceUpdateSignal (copy), bulkUpdateUserPresences (copy), shouldRefetchOnlineFriends (copy), v17 (copy), PresenceType (copy), UseFriendsListOrderedByIdPresenceImpressionEventsEnabled (copy), UsePresenceImpressionEventsModule (copy), DataHydrationModule (copy)
	local UseApolloClientResult = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseApolloClientFunction()
	local UseMemoResult = if FFlagFriendSortedByPresenceSignalsImplementation then ReactModule.useMemo(function() --[[ Line: 135 ]]
		-- upvalues: GetResult (upval)
		return GetResult.GetOnlineFriends()
	end, {}) else nil
	local UseSignalStateResult = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateFunction(UseMemoResult) else nil
	local PageSize = p4.pageSize or FriendsListDefaultPageSize
	local UseMemoResult1 = if FFlagFriendSortedByPresenceSignalsImplementation then ReactModule.useMemo(function() --[[ Line: 147 ]]
		-- upvalues: GetResult (upval)
		return GetResult.GetAllFriends()
	end, {}) else nil
	local UseSignalStateResult1 = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateFunction(UseMemoResult1) else nil
	local UseMemoResult2 = if FFlagFriendSortedByPresenceSignalsImplementation then ReactModule.useMemo(function() --[[ Line: 157 ]]
		-- upvalues: GetResult (upval)
		return GetResult.GetAllFriendsStatus()
	end, {}) else nil
	local UseSignalStateResult2 = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateFunction(UseMemoResult2) else nil
	local Variables = {
		userId = p4.userId,
		sort = ApolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseQueryResult = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseQueryFunction(Queries.allFriendsByUserId, {
		errorPolicy = "all",
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = CryoModule.Dictionary.join(Variables, { pageCursor = "", pageLimit = PageSize })
	})
	local UseQueryResult1 = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseQueryFunction(Queries.onlineFriendsByUserId, {
		skip = false,
		notifyOnNetworkStatusChange = true,
		variables = Variables
	})
	local NextCursor = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateResult1 and UseSignalStateResult1.nextCursor or nil elseif UseQueryResult.data then UseQueryResult.data.allFriendsByUserId.nextCursor else nil
	local Friends = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateResult1 and UseSignalStateResult1.friends or nil elseif UseQueryResult.data then UseQueryResult.data.allFriendsByUserId.friends else nil
	local HasMore = FFlagFriendSortedByPresenceSignalsImplementation and (UseSignalStateResult1 and UseSignalStateResult1.hasMore) or nil
	local UseSignalStateResult3 = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateResult or {} else UseQueryResult1.data and UseQueryResult1.data.onlineFriendsByUserId or {}
	local UseResult = ReactModule.useCallback(function() --[[ Line: 208 ]]
		-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (upval), HasMore (copy), NextCursor (copy), UseQueryResult (copy), GetResult (upval), PageSize (copy), UseRefResult1 (copy), UseRefResult (copy)
		if FFlagFriendSortedByPresenceSignalsImplementation then
			if not HasMore then return end
		elseif not NextCursor or NextCursor == "" or UseQueryResult.loading then return end
		if FFlagFriendSortedByPresenceSignalsImplementation then
			GetResult.FetchMoreFriends()
			
			return
		else
			UseQueryResult:fetchMore({
				variables = { pageCursor = NextCursor, pageLimit = PageSize }
			}):andThen(function(Result) --[[ Line: 231 ]]
				-- upvalues: UseRefResult1 (upval)
				UseRefResult1.current = Result and Result.errors
			end)
			UseRefResult.current = NextCursor
		end
	end, {
		if FFlagFriendSortedByPresenceSignalsImplementation then nil else NextCursor,
		if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseQueryResult.loading,
		if FFlagFriendSortedByPresenceSignalsImplementation then HasMore else nil
	})
	
	local function RefreshFriendsData() --[[ Line: 243 ]]
		-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (upval), GetResult (upval), UseQueryResult1 (copy), UseQueryResult (copy), UseRefResult (copy), UseRefResult1 (copy)
		if FFlagFriendSortedByPresenceSignalsImplementation then
			GetResult.RefetchOnlineFriends()
			GetResult.RefetchAllFriends()
			
			return
		else
			UseQueryResult1:refetch()
			UseQueryResult:refetch()
			UseRefResult.current = nil
			UseRefResult1.current = nil
		end
	end
	
	if not FFlagFriendSortedByPresenceSignalsImplementation then
		ReactModule.useEffect(function() --[[ Line: 256 ]]
			-- upvalues: FriendsCommonPresenceUpdateSignal (upval), bulkUpdateUserPresences (upval), UseApolloClientResult (copy), shouldRefetchOnlineFriends (upval), Variables (copy), FFlagFriendSortedByPresenceSignalsImplementation (upval), GetResult (upval), UseQueryResult1 (copy)
			FriendsCommonPresenceUpdateSignal.Event:Connect(function(p5) --[[ Line: 257 ]]
				-- upvalues: bulkUpdateUserPresences (upval), UseApolloClientResult (upval), shouldRefetchOnlineFriends (upval), Variables (upval), FFlagFriendSortedByPresenceSignalsImplementation (upval), GetResult (upval), UseQueryResult1 (upval)
				bulkUpdateUserPresences(UseApolloClientResult, p5)
				
				if shouldRefetchOnlineFriends(UseApolloClientResult, Variables, p5) then
					if FFlagFriendSortedByPresenceSignalsImplementation then
						GetResult._fetchOnlineFriendsAsync()
						
						return
					end
					UseQueryResult1:refetch()
				end
			end)
			
			return function() --[[ Line: 268 ]]
				-- upvalues: FriendsCommonPresenceUpdateSignal (upval)
				FriendsCommonPresenceUpdateSignal:Destroy()
			end
		end, {})
	end
	local UseMemoResult3, UseMemoResult21 = ReactModule.useMemo(function() --[[ Line: 274 ]]
		-- upvalues: v17 (upval), UseSignalStateResult3 (copy), CryoModule (upval), PresenceType (upval), Friends (copy)
		return v17(CryoModule.List.map(UseSignalStateResult3, function(p5) --[[ Line: 49 ]]
			-- upvalues: PresenceType (upval), CryoModule (upval)
			return if p5.presence and p5.presence.userPresenceType == PresenceType.InGame and p5.presence.universeId == "" then CryoModule.Dictionary.join(p5, {
				presence = CryoModule.Dictionary.join(p5.presence, { userPresenceType = PresenceType.Online })
			}) else p5
		end), Friends)
	end, { UseSignalStateResult3, Friends })
	
	if UseFriendsListOrderedByIdPresenceImpressionEventsEnabled then
		UsePresenceImpressionEventsModule(UseSignalStateResult3)
	end
	local NoNextCursor: boolean = not NextCursor or NextCursor == ""
	
	return {
		onlineFriends = UseMemoResult3,
		offlineFriends = UseMemoResult21,
		fetchMoreFriends = UseResult,
		refreshFriendsData = RefreshFriendsData,
		isEndOfList = if FFlagFriendSortedByPresenceSignalsImplementation then not HasMore else NoNextCursor,
		isLoading = if FFlagFriendSortedByPresenceSignalsImplementation then UseSignalStateResult1 == nil and UseSignalStateResult2 == DataHydrationModule.DataStatus.NotReady else UseQueryResult.loading
	}
end
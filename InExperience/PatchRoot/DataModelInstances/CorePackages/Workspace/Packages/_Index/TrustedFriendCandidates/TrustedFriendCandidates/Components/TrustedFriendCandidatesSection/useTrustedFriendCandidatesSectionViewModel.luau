local TrustedFriendCandidates = script:FindFirstAncestor("TrustedFriendCandidates")
local Parent = TrustedFriendCandidates.Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EventNamesModule = require(TrustedFriendCandidates.Analytics.EventNames)
local TrustedFriendCandidateRowModule = require(TrustedFriendCandidates.Components.TrustedFriendCandidateRow)
local ReadCandidateProfileInsightModule = require(TrustedFriendCandidates.Components.TrustedFriendCandidateRow.readCandidateProfileInsight)
local FireAnalyticsEventModule = require(TrustedFriendCandidates.Analytics.fireAnalyticsEvent)
local UseFireRowSeenEventModule = require(TrustedFriendCandidates.Analytics.useFireRowSeenEvent)
local _ = require(script.Parent.TrustedFriendCandidatesSectionView)
local TrustedConnectionsStore = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore
local FFlagFriendsLandingRefreshKeepsFilter = require(Parent.SharedFlags).FFlagFriendsLandingRefreshKeepsFilter
local User = require(Parent.UserList).Enums.EntityType.User

return function(p1)
	-- upvalues: ReactModule (copy), TrustedConnectionsStore (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), User (copy), AppCommonLibModule (copy), UseFireRowSeenEventModule (copy), FireAnalyticsEventModule (copy), EventNamesModule (copy), FFlagFriendsLandingRefreshKeepsFilter (copy), ReadCandidateProfileInsightModule (copy), TrustedFriendCandidateRowModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: TrustedConnectionsStore (upval)
		return TrustedConnectionsStore.get().getTrustedFriendCandidates({ forceFetch = true })
	end, {}).data)
	local UseLocalizationResult = UseLocalizationFunction({ title = "Feature.Friends.Title.AddMoreTrustedFriends" })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), User (upval)
		local List = {}
		
		if UseSignalStateResult then
			for _, candidate in UseSignalStateResult.candidates do
				table.insert(List, { id = candidate.id, type = User })
			end
		end
		return List
	end, { UseSignalStateResult })
	local HasMore = if UseSignalStateResult then UseSignalStateResult.hasMore else false
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(AppCommonLibModule.Signal.new())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current:fire()
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function(): number
		return os.clock()
	end, { UseMemoResult })
	local UseFireRowSeenEventModuleResult = UseFireRowSeenEventModule()
	local OnRowAnalyticsInfo = UseFireRowSeenEventModuleResult.onRowAnalyticsInfo
	local SendImpressionsFunction = UseFireRowSeenEventModuleResult.sendImpressions
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult2 (copy), FireAnalyticsEventModule (upval), EventNamesModule (upval), SendImpressionsFunction (copy)
		if not UseRefResult2.current then
			UseRefResult2.current = true
			FireAnalyticsEventModule(EventNamesModule.SectionSeen)
		end
		SendImpressionsFunction(p2)
	end, { SendImpressionsFunction })
	local RefreshSignal = p1.refreshSignal
	ReactModule.useEffect(function()
		-- upvalues: RefreshSignal (copy), FFlagFriendsLandingRefreshKeepsFilter (upval), TrustedConnectionsStore (upval), UseMemoResult (copy), ReadCandidateProfileInsightModule (upval)
		if not RefreshSignal then return end
		local Connection = RefreshSignal:connect(if FFlagFriendsLandingRefreshKeepsFilter then function()
			-- upvalues: TrustedConnectionsStore (upval), UseMemoResult (upval), ReadCandidateProfileInsightModule (upval)
			TrustedConnectionsStore.get().refetchTrustedFriendCandidates()
			
			for _, value in UseMemoResult do
				ReadCandidateProfileInsightModule(value.id)
			end
		end else TrustedConnectionsStore.get().refetchTrustedFriendCandidates)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {
		RefreshSignal,
		if FFlagFriendsLandingRefreshKeepsFilter then UseMemoResult else nil
	})
	local OnAddPress = p1.onAddPress
	local OnAcceptPress = p1.onAcceptPress
	
	return {
		isVisible = #UseMemoResult > 0,
		title = UseLocalizationResult.title,
		entities = UseMemoResult,
		hasMore = HasMore,
		onLoadMore = TrustedConnectionsStore.get().loadMoreTrustedFriendCandidates,
		renderRow = ReactModule.useCallback(function(CreateRow, Entity, AbsolutePosition)
			-- upvalues: ReactModule (upval), TrustedFriendCandidateRowModule (upval), OnRowAnalyticsInfo (copy), OnAddPress (copy), OnAcceptPress (copy)
			return ReactModule.createElement(TrustedFriendCandidateRowModule, {
				impressionsTag = "TRUSTED_FRIEND_CANDIDATES_ROW_IMPRESSIONS",
				createRow = CreateRow,
				entity = Entity,
				absolutePosition = AbsolutePosition,
				onAnalyticsInfo = OnRowAnalyticsInfo,
				onAddPress = OnAddPress,
				onAcceptPress = OnAcceptPress
			})
		end, { OnAddPress, OnAcceptPress, OnRowAnalyticsInfo }),
		onRowSelected = p1.onRowSelected,
		layoutOrder = p1.layoutOrder,
		containerRef = UseRefResult,
		onLayoutChanged = UseResult,
		impressions = {
			impressionsTag = "TRUSTED_FRIEND_CANDIDATES_ROW_IMPRESSIONS",
			pageContext = p1.pageContext,
			dataUpdatedTimestamp = UseMemoResult1,
			sendImpressions = UseResult1,
			scrollViewPositionChangedSignal = UseRefResult1.current
		}
	}
end
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Logger = require(Parent.Loggers).Logger
local GetPrivatePlaytestersStoreFunction = require(Parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local FriendsStore = require(Parent.DataHydration.Friends).FriendsStore
local SearchFriendsAsyncModule = require(script.Parent.searchFriendsAsync)
local UseUserPickerModule = require(BuildExperience.Components.UserPicker.useUserPicker)
local _ = require(BuildExperience.Components.UserPicker.UserPickerTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local UseBuildPageImpressionModule = require(BuildExperience.Telemetry.useBuildPageImpression)
local FFlagBuildExperiencePageImpressionsModule = require(BuildExperience.Flags.FFlagBuildExperiencePageImpressions)
local _ = require(script.Parent.PrivateInvitesPickerView)
local FFlagBuildExperiencePlaytesterAddTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperiencePlaytesterAddTelemetry)
local config = {
	[1] = "invalid_universe",
	[2] = "unauthorized",
	[48] = "invalid_request",
	[49] = "limit_exceeded",
	[50] = "update_failed",
	[51] = "safety_check"
}

local function getAddFailureParameters(p1, Count)
	-- upvalues: config (copy)
	local v1 = if type(p1) == "table" then p1 else nil
	local Number = if v1 == nil then nil else tonumber(v1.responseCode)
	local Response = if v1 == nil or type(v1.response) ~= "table" then nil else v1.response
	local Number1 = if Response == nil then nil else tonumber(Response.statusCode)
	local config1 = {
		count = tostring(Count),
		reason = if Number == nil then "unknown" else config[Number] or "unknown"
	}
	
	if Number ~= nil then
		config1.errorCode = tostring(Number)
	end
	if Number1 ~= nil then
		config1.httpStatus = tostring(Number1)
	end
	return config1
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), SendBuildExperienceEventModule (copy), FFlagBuildExperiencePageImpressionsModule (copy), UseBuildPageImpressionModule (copy), GetPrivatePlaytestersStoreFunction (copy), SignalsReactModule (copy), FriendsStore (copy), SearchFriendsAsyncModule (copy), FFlagBuildExperiencePlaytesterAddTelemetryModule (copy), getAddFailureParameters (copy), Logger (copy), UseUserPickerModule (copy)
	local UniverseId = p1.universeId
	local UseLocalizationResult = UseLocalizationFunction({
		addPlaytester = LocalizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER,
		addPlaytesters = LocalizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS,
		allFriendsAdded = LocalizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED,
		friendsLoadError = LocalizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR,
		noFriends = LocalizationStringsModule.PRIVATE_INVITES_NO_FRIENDS,
		searchPlaceholder = LocalizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER
	})
	local AddPlaytester = UseLocalizationResult.addPlaytester
	local AddPlaytesters = UseLocalizationResult.addPlaytesters
	local AllFriendsAdded = UseLocalizationResult.allFriendsAdded
	local FriendsLoadError = UseLocalizationResult.friendsLoadError
	local NoFriends = UseLocalizationResult.noFriends
	local SearchPlaceholder = UseLocalizationResult.searchPlaceholder
	local OnInvitesSentFunction = p1.onInvitesSent
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({ navigateOnDismiss = false, userIds = {} })
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), SendBuildExperienceEventModule (upval), UniverseId (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			SendBuildExperienceEventModule("PLAYTEST_PICKER_IMPRESSION", { universeId = UniverseId })
			
			return
		end
	end, { UniverseId })
	
	if FFlagBuildExperiencePageImpressionsModule then
		UseBuildPageImpressionModule("invite-picker", { universeId = UniverseId })
	end
	local PrivatePlaytestersStore = GetPrivatePlaytestersStoreFunction(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PrivatePlaytestersStore (copy), UniverseId (copy)
		return PrivatePlaytestersStore.getAndFetchInvitedPlayers(UniverseId)
	end, { PrivatePlaytestersStore, UniverseId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.players)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local Largest: number = if UseSignalStateResult1 == "Ready" then math.max(0, PrivatePlaytestersStore.MAX_INVITES - #UseSignalStateResult) else 0
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy)
		local t = {}
		
		for _, value in UseSignalStateResult do
			t[value] = true
		end
		return t
	end, { UseSignalStateResult })
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: FriendsStore (upval)
		return FriendsStore.get()
	end, {})
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult11 (copy)
		return UseMemoResult11.GetAllFriends()
	end, { UseMemoResult11 })))
	local UseSignalStateResult3 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult11 (copy)
		return UseMemoResult11.GetAllFriendsStatus()
	end, { UseMemoResult11 })))
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult2 (copy)
		local List = {}
		
		if UseSignalStateResult2 ~= nil then
			for _, friend in UseSignalStateResult2.friends do
				local Number: number? = tonumber(friend.id)
				
				if Number ~= nil then
					table.insert(List, Number)
				end
			end
		end
		return List
	end, { UseSignalStateResult2 })
	local IsNotReady = UseSignalStateResult3 == "NotReady"
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult11 (copy)
		UseMemoResult11.FetchMoreFriends()
	end, { UseMemoResult11 })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: SearchFriendsAsyncModule (upval)
		return SearchFriendsAsyncModule(p2, p3, 20)
	end, {})
	local UseRefResult1 = if FFlagBuildExperiencePlaytesterAddTelemetryModule then ReactModule.useRef({
		searched = false,
		addAttempts = 0,
		addFailures = 0,
		addedCount = 0,
		dismissReported = false
	}) else nil
	local UseResult2 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: FFlagBuildExperiencePlaytesterAddTelemetryModule (upval), UseRefResult1 (copy), PrivatePlaytestersStore (copy), UniverseId (copy), SendBuildExperienceEventModule (upval), UseStateResult2_1 (copy), OnInvitesSentFunction (copy), getAddFailureParameters (upval), Logger (upval), UseStateResult2 (copy)
		if FFlagBuildExperiencePlaytesterAddTelemetryModule and UseRefResult1 ~= nil then
			local Current = UseRefResult1.current
			Current.addAttempts += 1
		end
		return PrivatePlaytestersStore.sendInvites(UniverseId, p2, p3):andThen(function(Result)
			-- upvalues: FFlagBuildExperiencePlaytesterAddTelemetryModule (upval), UseRefResult1 (upval), SendBuildExperienceEventModule (upval), UniverseId (upval), p2 (copy), UseStateResult2_1 (upval), OnInvitesSentFunction (upval)
			local Added = Result.added
			
			if FFlagBuildExperiencePlaytesterAddTelemetryModule and UseRefResult1 ~= nil then
				local Current = UseRefResult1.current
				Current.addedCount += #Added
			end
			local Rejected = Result.rejected
			SendBuildExperienceEventModule("PLAYTESTERS_ADDED", { universeId = UniverseId }, {
				count = tostring(#Added),
				rejectedCount = if FFlagBuildExperiencePlaytesterAddTelemetryModule then tostring(#Rejected) else nil,
				requestedCount = if FFlagBuildExperiencePlaytesterAddTelemetryModule then tostring(#p2) else nil
			})
			
			if #Added == 0 then
				if #Rejected > 0 then
					UseStateResult2_1({ navigateOnDismiss = false, userIds = Rejected })
					
					return
				else
					OnInvitesSentFunction()
					
					return
				end
			elseif #Rejected > 0 then
				UseStateResult2_1({ navigateOnDismiss = true, userIds = Rejected })
				
				return
			else
				OnInvitesSentFunction()
			end
		end):catch(function(Err)
			-- upvalues: FFlagBuildExperiencePlaytesterAddTelemetryModule (upval), UseRefResult1 (upval), SendBuildExperienceEventModule (upval), UniverseId (upval), getAddFailureParameters (upval), p2 (copy), Logger (upval), UseStateResult2 (upval)
			if FFlagBuildExperiencePlaytesterAddTelemetryModule and UseRefResult1 ~= nil then
				local Current = UseRefResult1.current
				Current.addFailures += 1
			end
			SendBuildExperienceEventModule("PLAYTESTERS_ADD_FAILED", { universeId = UniverseId }, if FFlagBuildExperiencePlaytesterAddTelemetryModule then getAddFailureParameters(Err, #p2) else { count = tostring(#p2) })
			Logger:warning("PrivateInvitesPicker: add playtesters failed for universe {}: {}", UniverseId, Err)
			UseStateResult2(true)
		end)
	end, {
		PrivatePlaytestersStore,
		UniverseId,
		OnInvitesSentFunction
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), OnInvitesSentFunction (copy)
		local NavigateOnDismiss = UseStateResult1.navigateOnDismiss
		UseStateResult2_1({ navigateOnDismiss = false, userIds = {} })
		
		if NavigateOnDismiss then
			OnInvitesSentFunction()
		end
	end, { UseStateResult1, OnInvitesSentFunction })
	local UseUserPickerModuleResult = UseUserPickerModule((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), IsNotReady (copy), UseResult (copy), UseResult1 (copy), UseResult2 (copy), Largest (copy), UseMemoResult1 (copy)
		return {
			browseIds = UseMemoResult2,
			browseIsLoading = IsNotReady,
			loadMoreBrowse = UseResult,
			onSearch = UseResult1,
			onSubmit = UseResult2,
			selectionLimit = Largest,
			excludeUserIds = UseMemoResult1
		}
	end, {
		UseMemoResult2, IsNotReady, UseResult, UseResult1, UseResult2, Largest,
		UseMemoResult1
	})))
	local HasFoundAt = if FFlagBuildExperiencePlaytesterAddTelemetryModule then string.find(UseUserPickerModuleResult.searchText, "%S") ~= nil else nil
	
	if FFlagBuildExperiencePlaytesterAddTelemetryModule then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (copy), HasFoundAt (copy)
			if UseRefResult1 ~= nil and HasFoundAt then
				UseRefResult1.current.searched = true
			end
		end, { HasFoundAt })
	end
	local OnCloseFunction = p1.onClose
	local SelectedCount = UseUserPickerModuleResult.selectedCount
	local CountUserIds = if FFlagBuildExperiencePlaytesterAddTelemetryModule then #UseUserPickerModuleResult.userIds else nil
	local UseResult5 = if FFlagBuildExperiencePlaytesterAddTelemetryModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseMemoResult2 (copy), UseMemoResult1 (copy), UseSignalStateResult3 (copy), IsNotReady (copy), UseSignalStateResult1 (copy), SendBuildExperienceEventModule (upval), UniverseId (copy), UseSignalStateResult (copy), SelectedCount (copy), HasFoundAt (copy), CountUserIds (copy), OnCloseFunction (copy)
		local Current = if UseRefResult1 == nil then nil else UseRefResult1.current
		
		if Current ~= nil and not Current.dismissReported then
			Current.dismissReported = true
			local Count = 0
			
			for _, value in UseMemoResult2 do
				if not UseMemoResult1[value] then
					Count += 1
				end
			end
			SendBuildExperienceEventModule("PLAYTEST_PICKER_DISMISSED", { universeId = UniverseId }, {
				friendsLoaded = tostring(#UseMemoResult2),
				availableCount = tostring(Count),
				invitedCount = tostring(#UseSignalStateResult),
				selectedCount = tostring(SelectedCount),
				emptyState = if UseSignalStateResult3 == "Failed" then "load_error" elseif IsNotReady then "loading" elseif UseSignalStateResult1 == "Failed" then "invited_load_error" elseif UseSignalStateResult1 == "Ready" then if #UseMemoResult2 == 0 then "no_friends" elseif Count == 0 then "all_added" else "none" else "invited_loading",
				searched = if Current.searched then "true" else "false",
				searchActive = if HasFoundAt then "true" else "false",
				visibleCount = tostring(CountUserIds),
				addAttempts = tostring(Current.addAttempts),
				addFailures = tostring(Current.addFailures),
				addedCount = tostring(Current.addedCount)
			})
		end
		OnCloseFunction()
	end, {
		UseMemoResult2, UseMemoResult1, UseSignalStateResult3, IsNotReady,
		UseSignalStateResult1, UseSignalStateResult, SelectedCount, HasFoundAt,
		CountUserIds, UniverseId, OnCloseFunction
	}) else nil
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end, {})
	local LoadMoreFunction = UseUserPickerModuleResult.loadMore
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), LoadMoreFunction (copy)
		if UseStateResult4 == nil then return end
		local function maybeLoadMore()
			-- upvalues: UseStateResult4 (copy), LoadMoreFunction (upval)
			local YDelta = UseStateResult4.AbsoluteCanvasSize.Y - (UseStateResult4.CanvasPosition.Y + UseStateResult4.AbsoluteWindowSize.Y)
			
			if UseStateResult4.AbsoluteCanvasSize.Y > 0 and YDelta <= 240 then
				LoadMoreFunction()
			end
		end
		
		local Connection = UseStateResult4:GetPropertyChangedSignal("CanvasPosition"):Connect(maybeLoadMore)
		local Connection1 = UseStateResult4:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(maybeLoadMore)
		local Connection2 = UseStateResult4:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(maybeLoadMore)
		local YDelta = UseStateResult4.AbsoluteCanvasSize.Y - (UseStateResult4.CanvasPosition.Y + UseStateResult4.AbsoluteWindowSize.Y)
		
		if UseStateResult4.AbsoluteCanvasSize.Y > 0 and YDelta <= 240 then
			LoadMoreFunction()
		end
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { UseStateResult4, LoadMoreFunction })
	
	return {
		isOpen = UseStateResult3,
		onClose = if FFlagBuildExperiencePlaytesterAddTelemetryModule and UseResult5 ~= nil then UseResult5 else p1.onClose,
		onRequestClose = UseResult6,
		scrollingFrameRef = UseResult7,
		searchText = UseUserPickerModuleResult.searchText,
		setSearchText = UseUserPickerModuleResult.setSearchText,
		searchPlaceholder = SearchPlaceholder,
		userIds = UseUserPickerModuleResult.userIds,
		isLoading = UseUserPickerModuleResult.isLoading,
		emptyText = if UseSignalStateResult3 == "Failed" then FriendsLoadError elseif #UseMemoResult2 > 0 then AllFriendsAdded else NoFriends,
		isSelected = UseUserPickerModuleResult.isSelected,
		canSelect = UseUserPickerModuleResult.canSelect,
		toggleSelected = UseUserPickerModuleResult.toggleSelected,
		hasSelection = UseUserPickerModuleResult.hasSelection,
		submit = UseUserPickerModuleResult.submit,
		isSubmitting = UseUserPickerModuleResult.isSubmitting,
		sendButtonText = if UseUserPickerModuleResult.selectedCount > 1 then AddPlaytesters else AddPlaytester,
		hasAddError = UseStateResult,
		onDismissAddError = UseResult3,
		rejectedInviteUserIds = UseStateResult1.userIds,
		onDismissRejectedInvite = UseResult4,
		testId = p1.testId
	}
end
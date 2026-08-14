local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local friendsStore = require(parent.DataHydration.Friends).FriendsStore
local searchFriendsAsyncModule = require(script.Parent.searchFriendsAsync)
local useUserPickerModule = require(buildExperience.Components.UserPicker.useUserPicker)
local _ = require(buildExperience.Components.UserPicker.UserPickerTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(script.Parent.PrivateInvitesPickerView)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p0) --[[ line: 41 | named "usePrivateInvitesPickerViewModel" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), friendsStore (ref), searchFriendsAsyncModule (ref), useUserPickerModule (ref)
	local PRIVATE_INVITES_ADD_PLAYTESTER, PRIVATE_INVITES_ADD_PLAYTESTERS, PRIVATE_INVITES_ALL_FRIENDS_ADDED, PRIVATE_INVITES_FRIENDS_LOAD_ERROR, PRIVATE_INVITES_NO_FRIENDS, PRIVATE_INVITES_SEARCH_PLACEHOLDER
	local var8 = if fFlagBuildLocalization then useLocalization({
		addPlaytester = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER,
		addPlaytesters = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS,
		allFriendsAdded = localizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED,
		friendsLoadError = localizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR,
		noFriends = localizationStringsModule.PRIVATE_INVITES_NO_FRIENDS,
		searchPlaceholder = localizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		PRIVATE_INVITES_ADD_PLAYTESTER = var8.addPlaytester
		PRIVATE_INVITES_ADD_PLAYTESTERS = var8.addPlaytesters
		PRIVATE_INVITES_ALL_FRIENDS_ADDED = var8.allFriendsAdded
		PRIVATE_INVITES_FRIENDS_LOAD_ERROR = var8.friendsLoadError
		PRIVATE_INVITES_NO_FRIENDS = var8.noFriends
		PRIVATE_INVITES_SEARCH_PLACEHOLDER = var8.searchPlaceholder
	else
		PRIVATE_INVITES_ADD_PLAYTESTER = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER
		PRIVATE_INVITES_ADD_PLAYTESTERS = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS
		PRIVATE_INVITES_ALL_FRIENDS_ADDED = localizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED
		PRIVATE_INVITES_FRIENDS_LOAD_ERROR = localizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR
		PRIVATE_INVITES_NO_FRIENDS = localizationStringsModule.PRIVATE_INVITES_NO_FRIENDS
		PRIVATE_INVITES_SEARCH_PLACEHOLDER = localizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER
	end
	local universeId = p0.universeId
	local onInvitesSent = p0.onInvitesSent
	local var9 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: var9 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var9.current then
			return
		end
		var9.current = true
		sendBuildExperienceEventModule("PLAYTEST_PICKER_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var10 = getPrivatePlaytestersStore(false)
	local var11 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: var10 (ref), universeId (ref)
		return var10.getAndFetchInvitedPlayers(universeId)
	end, { var10, universeId })
	local var12 = signalsReactModule.useSignalState(var11.players)
	local var13 = if signalsReactModule.useSignalState(var11.status) == "Ready" then math.max(0, var10.MAX_INVITES - #var12) else 0
	local var14 = reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: var12 (ref)
		local t = {}
		
		for i, v in var12 do
			t[v] = true
		end
		return t
	end, { var12 })
	local var15 = reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: friendsStore (copy)
		return friendsStore.get()
	end, {})
	local var16 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 113 ]]
		-- upvalues: var15 (ref)
		return var15.GetAllFriends()
	end, { var15 }))
	local var17 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: var15 (ref)
		return var15.GetAllFriendsStatus()
	end, { var15 }))
	local var18 = reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: var16 (ref)
		local t = {}
		
		if var16 ~= nil then
			for i, v in var16.friends do
				local var32 = tonumber(v.id)
				
				if var32 ~= nil then
					table.insert(t, var32)
				end
			end
		end
		return t
	end, { var16 })
	local isNotReady = var17 == "NotReady"
	local var20 = reactModule.useCallback(function() --[[ line: 136 ]]
		-- upvalues: var15 (ref)
		var15.FetchMoreFriends()
	end, { var15 })
	local var21 = reactModule.useCallback(function(p1, p2) --[[ line: 142 ]]
		-- upvalues: searchFriendsAsyncModule (copy)
		return searchFriendsAsyncModule(p1, p2, 20)
	end, {})
	local var22 = reactModule.useCallback(function(p3, p4) --[[ line: 146 ]]
		-- upvalues: var10 (ref), universeId (ref), sendBuildExperienceEventModule (copy), onInvitesSent (ref)
		return var10.sendInvites(universeId, p3, p4):andThen(function() --[[ line: 149 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p3 (ref), onInvitesSent (copy)
			sendBuildExperienceEventModule("PLAYTESTERS_ADDED", { universeId = universeId }, { count = tostring(#p3) })
			onInvitesSent()
		end):catch(function(p5) --[[ line: 155 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p3 (ref)
			sendBuildExperienceEventModule("PLAYTESTERS_ADD_FAILED", { universeId = universeId }, { count = tostring(#p3) })
			error(p5)
		end)
	end, { var10, universeId, onInvitesSent })
	local var23 = useUserPickerModule(reactModule.useMemo(function() --[[ line: 166 ]]
		-- upvalues: var18 (ref), isNotReady (ref), var20 (ref), var21 (ref), var22 (ref), var13 (ref), var14 (ref)
		return {
			browseIds = var18,
			browseIsLoading = isNotReady,
			loadMoreBrowse = var20,
			onSearch = var21,
			onSubmit = var22,
			selectionLimit = var13,
			excludeUserIds = var14
		}
	end, {
		var18, isNotReady, var20, var21, var22, var13, var14
	}))
	local var24, var25 = reactModule.useState(true)
	local var26 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var25 (ref)
		var25(false)
	end, {})
	local var27, var28 = reactModule.useState(nil)
	local var29 = reactModule.useCallback(function(p6) --[[ line: 202 ]]
		-- upvalues: var28 (ref)
		var28(p6)
	end, {})
	local loadMore = var23.loadMore
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: var27 (ref), loadMore (ref)
		if var27 == nil then return end
		local function maybeLoadMore() --[[ line: 211 ]]
			-- upvalues: var27 (ref), loadMore (copy)
			if var27.AbsoluteCanvasSize.Y > 0 and var27.AbsoluteCanvasSize.Y - (var27.CanvasPosition.Y + var27.AbsoluteWindowSize.Y) <= 240 then
				loadMore()
			end
		end
		
		local var34 = var27:GetPropertyChangedSignal("CanvasPosition"):Connect(maybeLoadMore)
		local var35 = var27:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(maybeLoadMore)
		local var36 = var27:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(maybeLoadMore)
		
		if var27.AbsoluteCanvasSize.Y > 0 and var27.AbsoluteCanvasSize.Y - (var27.CanvasPosition.Y + var27.AbsoluteWindowSize.Y) <= 240 then
			loadMore()
		end
		return function() --[[ line: 222 ]]
			-- upvalues: var34 (ref), var35 (ref), var36 (ref)
			var34:Disconnect()
			var35:Disconnect()
			var36:Disconnect()
		end
	end, { var27, loadMore })
	
	return {
		isOpen = var24,
		onClose = p0.onClose,
		onRequestClose = var26,
		scrollingFrameRef = var29,
		searchText = var23.searchText,
		setSearchText = var23.setSearchText,
		searchPlaceholder = PRIVATE_INVITES_SEARCH_PLACEHOLDER,
		userIds = var23.userIds,
		isLoading = var23.isLoading,
		emptyText = if var17 == "Failed" then PRIVATE_INVITES_FRIENDS_LOAD_ERROR elseif #var18 > 0 then PRIVATE_INVITES_ALL_FRIENDS_ADDED else PRIVATE_INVITES_NO_FRIENDS,
		isSelected = var23.isSelected,
		canSelect = var23.canSelect,
		toggleSelected = var23.toggleSelected,
		hasSelection = var23.hasSelection,
		submit = var23.submit,
		isSubmitting = var23.isSubmitting,
		sendButtonText = if var23.selectedCount > 1 then PRIVATE_INVITES_ADD_PLAYTESTERS else PRIVATE_INVITES_ADD_PLAYTESTER,
		testId = p0.testId
	}
end
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

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), friendsStore (ref), searchFriendsAsyncModule (ref), useUserPickerModule (ref)
	local PRIVATE_INVITES_ADD_PLAYTESTER, PRIVATE_INVITES_ADD_PLAYTESTERS, PRIVATE_INVITES_ALL_FRIENDS_ADDED, PRIVATE_INVITES_FRIENDS_LOAD_ERROR, PRIVATE_INVITES_NO_FRIENDS, PRIVATE_INVITES_SEARCH_PLACEHOLDER
	local var1 = if fFlagBuildLocalization then useLocalization({
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
		PRIVATE_INVITES_ADD_PLAYTESTER = var1.addPlaytester
		PRIVATE_INVITES_ADD_PLAYTESTERS = var1.addPlaytesters
		PRIVATE_INVITES_ALL_FRIENDS_ADDED = var1.allFriendsAdded
		PRIVATE_INVITES_FRIENDS_LOAD_ERROR = var1.friendsLoadError
		PRIVATE_INVITES_NO_FRIENDS = var1.noFriends
		PRIVATE_INVITES_SEARCH_PLACEHOLDER = var1.searchPlaceholder
	else
		PRIVATE_INVITES_ADD_PLAYTESTER = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER
		PRIVATE_INVITES_ADD_PLAYTESTERS = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS
		PRIVATE_INVITES_ALL_FRIENDS_ADDED = localizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED
		PRIVATE_INVITES_FRIENDS_LOAD_ERROR = localizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR
		PRIVATE_INVITES_NO_FRIENDS = localizationStringsModule.PRIVATE_INVITES_NO_FRIENDS
		PRIVATE_INVITES_SEARCH_PLACEHOLDER = localizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER
	end
	local universeId = p1.universeId
	local onInvitesSent = p1.onInvitesSent
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var2.current then
			return
		end
		var2.current = true
		sendBuildExperienceEventModule("PLAYTEST_PICKER_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var3 = getPrivatePlaytestersStore(false)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), universeId (ref)
		return var3.getAndFetchInvitedPlayers(universeId)
	end, { var3, universeId })
	local var5 = signalsReactModule.useSignalState(var4.players)
	local var6 = if signalsReactModule.useSignalState(var4.status) == "Ready" then math.max(0, var3.MAX_INVITES - #var5) else 0
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		local t = {}
		
		for i, v in var5 do
			t[v] = true
		end
		return t
	end, { var5 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: friendsStore (copy)
		return friendsStore.get()
	end, {})
	local var9 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return var8.GetAllFriends()
	end, { var8 }))
	local var10 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return var8.GetAllFriendsStatus()
	end, { var8 }))
	local var11 = reactModule.useMemo(function()
		-- upvalues: var9 (ref)
		local t = {}
		
		if var9 ~= nil then
			for i, v in var9.friends do
				local var12 = tonumber(v.id)
				
				if var12 ~= nil then
					table.insert(t, var12)
				end
			end
		end
		return t
	end, { var9 })
	local isNotReady = var10 == "NotReady"
	local var13 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8.FetchMoreFriends()
	end, { var8 })
	local var14 = reactModule.useCallback(function(p2, p3)
		-- upvalues: searchFriendsAsyncModule (copy)
		return searchFriendsAsyncModule(p2, p3, 20)
	end, {})
	local var15 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref), universeId (ref), sendBuildExperienceEventModule (copy), onInvitesSent (ref)
		return var3.sendInvites(universeId, p2, p3):andThen(function()
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p2 (ref), onInvitesSent (copy)
			sendBuildExperienceEventModule("PLAYTESTERS_ADDED", { universeId = universeId }, { count = tostring(#p2) })
			onInvitesSent()
		end):catch(function(p4)
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p2 (ref)
			sendBuildExperienceEventModule("PLAYTESTERS_ADD_FAILED", { universeId = universeId }, { count = tostring(#p2) })
			error(p4)
		end)
	end, { var3, universeId, onInvitesSent })
	local var16 = useUserPickerModule(reactModule.useMemo(function()
		-- upvalues: var11 (ref), isNotReady (ref), var13 (ref), var14 (ref), var15 (ref), var6 (ref), var7 (ref)
		return {
			browseIds = var11,
			browseIsLoading = isNotReady,
			loadMoreBrowse = var13,
			onSearch = var14,
			onSubmit = var15,
			selectionLimit = var6,
			excludeUserIds = var7
		}
	end, {
		var11, isNotReady, var13, var14, var15, var6, var7
	}))
	local var17, var18 = reactModule.useState(true)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		var18(false)
	end, {})
	local var20, var21 = reactModule.useState(nil)
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref)
		var21(p2)
	end, {})
	local loadMore = var16.loadMore
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), loadMore (ref)
		if var20 == nil then return end
		local function maybeLoadMore()
			-- upvalues: var20 (ref), loadMore (copy)
			if var20.AbsoluteCanvasSize.Y > 0 and var20.AbsoluteCanvasSize.Y - (var20.CanvasPosition.Y + var20.AbsoluteWindowSize.Y) <= 240 then
				loadMore()
			end
		end
		
		local var23 = var20:GetPropertyChangedSignal("CanvasPosition"):Connect(maybeLoadMore)
		local var24 = var20:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(maybeLoadMore)
		local var25 = var20:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(maybeLoadMore)
		
		if var20.AbsoluteCanvasSize.Y > 0 and var20.AbsoluteCanvasSize.Y - (var20.CanvasPosition.Y + var20.AbsoluteWindowSize.Y) <= 240 then
			loadMore()
		end
		return function()
			-- upvalues: var23 (ref), var24 (ref), var25 (ref)
			var23:Disconnect()
			var24:Disconnect()
			var25:Disconnect()
		end
	end, { var20, loadMore })
	
	return {
		isOpen = var17,
		onClose = p1.onClose,
		onRequestClose = var19,
		scrollingFrameRef = var22,
		searchText = var16.searchText,
		setSearchText = var16.setSearchText,
		searchPlaceholder = PRIVATE_INVITES_SEARCH_PLACEHOLDER,
		userIds = var16.userIds,
		isLoading = var16.isLoading,
		emptyText = if var10 == "Failed" then PRIVATE_INVITES_FRIENDS_LOAD_ERROR elseif #var11 > 0 then PRIVATE_INVITES_ALL_FRIENDS_ADDED else PRIVATE_INVITES_NO_FRIENDS,
		isSelected = var16.isSelected,
		canSelect = var16.canSelect,
		toggleSelected = var16.toggleSelected,
		hasSelection = var16.hasSelection,
		submit = var16.submit,
		isSubmitting = var16.isSubmitting,
		sendButtonText = if var16.selectedCount > 1 then PRIVATE_INVITES_ADD_PLAYTESTERS else PRIVATE_INVITES_ADD_PLAYTESTER,
		testId = p1.testId
	}
end
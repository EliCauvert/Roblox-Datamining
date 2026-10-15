local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local logger = require(parent.Loggers).Logger
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local friendsStore = require(parent.DataHydration.Friends).FriendsStore
local searchFriendsAsyncModule = require(script.Parent.searchFriendsAsync)
local useUserPickerModule = require(buildExperience.Components.UserPicker.useUserPicker)
local _ = require(buildExperience.Components.UserPicker.UserPickerTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(script.Parent.PrivateInvitesPickerView)

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), friendsStore (ref), searchFriendsAsyncModule (ref), logger (ref), useUserPickerModule (ref)
	local universeId = p1.universeId
	local var1 = useLocalization({
		addPlaytester = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER,
		addPlaytesters = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS,
		allFriendsAdded = localizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED,
		friendsLoadError = localizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR,
		noFriends = localizationStringsModule.PRIVATE_INVITES_NO_FRIENDS,
		searchPlaceholder = localizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER
	})
	local addPlaytester = var1.addPlaytester
	local addPlaytesters = var1.addPlaytesters
	local allFriendsAdded = var1.allFriendsAdded
	local friendsLoadError = var1.friendsLoadError
	local noFriends = var1.noFriends
	local searchPlaceholder = var1.searchPlaceholder
	local onInvitesSent = p1.onInvitesSent
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState({ navigateOnDismiss = false, userIds = {} })
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var6.current then
			return
		end
		var6.current = true
		sendBuildExperienceEventModule("PLAYTEST_PICKER_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var7 = getPrivatePlaytestersStore(false)
	local var8 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), universeId (ref)
		return var7.getAndFetchInvitedPlayers(universeId)
	end, { var7, universeId })
	local var9 = signalsReactModule.useSignalState(var8.players)
	local var10 = if signalsReactModule.useSignalState(var8.status) == "Ready" then math.max(0, var7.MAX_INVITES - #var9) else 0
	local var11 = reactModule.useMemo(function()
		-- upvalues: var9 (ref)
		local t = {}
		
		for i, v in var9 do
			t[v] = true
		end
		return t
	end, { var9 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: friendsStore (copy)
		return friendsStore.get()
	end, {})
	local var13 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var12 (ref)
		return var12.GetAllFriends()
	end, { var12 }))
	local var14 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var12 (ref)
		return var12.GetAllFriendsStatus()
	end, { var12 }))
	local var15 = reactModule.useMemo(function()
		-- upvalues: var13 (ref)
		local t = {}
		
		if var13 ~= nil then
			for i, v in var13.friends do
				local var16 = tonumber(v.id)
				
				if var16 ~= nil then
					table.insert(t, var16)
				end
			end
		end
		return t
	end, { var13 })
	local isNotReady = var14 == "NotReady"
	local var17 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12.FetchMoreFriends()
	end, { var12 })
	local var18 = reactModule.useCallback(function(p2, p3)
		-- upvalues: searchFriendsAsyncModule (copy)
		return searchFriendsAsyncModule(p2, p3, 20)
	end, {})
	local var19 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var7 (ref), universeId (ref), sendBuildExperienceEventModule (copy), var5 (ref), onInvitesSent (ref), logger (copy), var3 (ref)
		return var7.sendInvites(universeId, p2, p3):andThen(function(p4)
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), var5 (copy), onInvitesSent (copy)
			local added = p4.added
			local rejected = p4.rejected
			sendBuildExperienceEventModule("PLAYTESTERS_ADDED", { universeId = universeId }, { count = tostring(#added) })
			
			if #added == 0 then
				if #rejected > 0 then
					var5({ navigateOnDismiss = false, userIds = rejected })
					
					return
				end
				onInvitesSent()
				
				return
			elseif #rejected > 0 then
				var5({ navigateOnDismiss = true, userIds = rejected })
				
				return
			end
			onInvitesSent()
		end):catch(function(p4)
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p2 (ref), logger (copy), var3 (copy)
			sendBuildExperienceEventModule("PLAYTESTERS_ADD_FAILED", { universeId = universeId }, { count = tostring(#p2) })
			logger:warning("PrivateInvitesPicker: add playtesters failed for universe {}: {}", universeId, p4)
			var3(true)
		end)
	end, { var7, universeId, onInvitesSent })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var5 (ref), onInvitesSent (ref)
		local navigateOnDismiss = var4.navigateOnDismiss
		var5({ navigateOnDismiss = false, userIds = {} })
		
		if navigateOnDismiss then
			onInvitesSent()
		end
	end, { var4, onInvitesSent })
	local var22 = useUserPickerModule(reactModule.useMemo(function()
		-- upvalues: var15 (ref), isNotReady (ref), var17 (ref), var18 (ref), var19 (ref), var10 (ref), var11 (ref)
		return {
			browseIds = var15,
			browseIsLoading = isNotReady,
			loadMoreBrowse = var17,
			onSearch = var18,
			onSubmit = var19,
			selectionLimit = var10,
			excludeUserIds = var11
		}
	end, {
		var15, isNotReady, var17, var18, var19, var10, var11
	}))
	local var23, var24 = reactModule.useState(true)
	local var25 = reactModule.useCallback(function()
		-- upvalues: var24 (ref)
		var24(false)
	end, {})
	local var26, var27 = reactModule.useState(nil)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref)
		var27(p2)
	end, {})
	local loadMore = var22.loadMore
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), loadMore (ref)
		if var26 == nil then return end
		local function maybeLoadMore()
			-- upvalues: var26 (ref), loadMore (copy)
			if var26.AbsoluteCanvasSize.Y > 0 and var26.AbsoluteCanvasSize.Y - (var26.CanvasPosition.Y + var26.AbsoluteWindowSize.Y) <= 240 then
				loadMore()
			end
		end
		
		local var29 = var26:GetPropertyChangedSignal("CanvasPosition"):Connect(maybeLoadMore)
		local var30 = var26:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(maybeLoadMore)
		local var31 = var26:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(maybeLoadMore)
		
		if var26.AbsoluteCanvasSize.Y > 0 and var26.AbsoluteCanvasSize.Y - (var26.CanvasPosition.Y + var26.AbsoluteWindowSize.Y) <= 240 then
			loadMore()
		end
		return function()
			-- upvalues: var29 (ref), var30 (ref), var31 (ref)
			var29:Disconnect()
			var30:Disconnect()
			var31:Disconnect()
		end
	end, { var26, loadMore })
	
	return {
		isOpen = var23,
		onClose = p1.onClose,
		onRequestClose = var25,
		scrollingFrameRef = var28,
		searchText = var22.searchText,
		setSearchText = var22.setSearchText,
		searchPlaceholder = searchPlaceholder,
		userIds = var22.userIds,
		isLoading = var22.isLoading,
		emptyText = if var14 == "Failed" then friendsLoadError elseif #var15 > 0 then allFriendsAdded else noFriends,
		isSelected = var22.isSelected,
		canSelect = var22.canSelect,
		toggleSelected = var22.toggleSelected,
		hasSelection = var22.hasSelection,
		submit = var22.submit,
		isSubmitting = var22.isSubmitting,
		sendButtonText = if var22.selectedCount > 1 then addPlaytesters else addPlaytester,
		hasAddError = var2,
		onDismissAddError = var20,
		rejectedInviteUserIds = var4.userIds,
		onDismissRejectedInvite = var21,
		testId = p1.testId
	}
end
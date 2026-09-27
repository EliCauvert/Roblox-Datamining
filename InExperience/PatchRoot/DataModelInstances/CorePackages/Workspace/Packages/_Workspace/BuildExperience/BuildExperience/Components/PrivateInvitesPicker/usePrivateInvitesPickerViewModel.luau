local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local logger = require(parent.Loggers).Logger
local getExternalChatMessageSenderStoreModule = require(parent.AppChat.GetExternalChatMessageSenderStore)
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local friendsStore = require(parent.DataHydration.Friends).FriendsStore
local searchFriendsAsyncModule = require(script.Parent.searchFriendsAsync)
local useUserPickerModule = require(buildExperience.Components.UserPicker.useUserPicker)
local _ = require(buildExperience.Components.UserPicker.UserPickerTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local gameInfoUtilsModule = require(buildExperience.utils.GameInfoUtils)
local sendPlaytesterInviteMessagesModule = require(buildExperience.utils.sendPlaytesterInviteMessages)
local sharePrivateExperienceModule = require(buildExperience.utils.sharePrivateExperience)
local _ = require(script.Parent.PrivateInvitesPickerView)

return function(p1)
	-- upvalues: playersService (ref), gameInfoUtilsModule (ref), useLocalization (ref), localizationStringsModule (ref), signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), friendsStore (ref), searchFriendsAsyncModule (ref), sendPlaytesterInviteMessagesModule (ref), logger (ref), sharePrivateExperienceModule (ref), useUserPickerModule (ref)
	local universeId = p1.universeId
	local localPlayer = playersService.LocalPlayer
	local gameInfoName = gameInfoUtilsModule.getGameInfoName(gameInfoUtilsModule.useGameInfo(universeId))
	local var1 = useLocalization({
		addPlaytester = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER,
		addPlaytesters = localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS,
		allFriendsAdded = localizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED,
		friendsLoadError = localizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR,
		noFriends = localizationStringsModule.PRIVATE_INVITES_NO_FRIENDS,
		searchPlaceholder = localizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER,
		inviteMessage = {
			localizationStringsModule.PRIVATE_INVITES_INVITE_MESSAGE,
			username = if localPlayer ~= nil then "" else localPlayer.DisplayName,
			experienceName = gameInfoName or ""
		}
	})
	local addPlaytester = var1.addPlaytester
	local addPlaytesters = var1.addPlaytesters
	local allFriendsAdded = var1.allFriendsAdded
	local friendsLoadError = var1.friendsLoadError
	local noFriends = var1.noFriends
	local searchPlaceholder = var1.searchPlaceholder
	local var2 = if gameInfoName ~= nil then nil else var1.inviteMessage
	local onInvitesSent = p1.onInvitesSent
	local var3 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var4, var5 = reactModule.useState({})
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState({ navigateOnDismiss = false, userIds = {} })
	local var10 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var10.current then
			return
		end
		var10.current = true
		sendBuildExperienceEventModule("PLAYTEST_PICKER_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var11 = getPrivatePlaytestersStore(false)
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), universeId (ref)
		return var11.getAndFetchInvitedPlayers(universeId)
	end, { var11, universeId })
	local var13 = signalsReactModule.useSignalState(var12.players)
	local var14 = if signalsReactModule.useSignalState(var12.status) == "Ready" then math.max(0, var11.MAX_INVITES - #var13) else 0
	local var15 = reactModule.useMemo(function()
		-- upvalues: var13 (ref)
		local t = {}
		
		for i, v in var13 do
			t[v] = true
		end
		return t
	end, { var13 })
	local var16 = reactModule.useMemo(function()
		-- upvalues: friendsStore (copy)
		return friendsStore.get()
	end, {})
	local var17 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var16 (ref)
		return var16.GetAllFriends()
	end, { var16 }))
	local var18 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var16 (ref)
		return var16.GetAllFriendsStatus()
	end, { var16 }))
	local var19 = reactModule.useMemo(function()
		-- upvalues: var17 (ref)
		local t = {}
		
		if var17 ~= nil then
			for i, v in var17.friends do
				local var20 = tonumber(v.id)
				
				if var20 ~= nil then
					table.insert(t, var20)
				end
			end
		end
		return t
	end, { var17 })
	local isNotReady = var18 == "NotReady"
	local var21 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16.FetchMoreFriends()
	end, { var16 })
	local var22 = reactModule.useCallback(function(p2, p3)
		-- upvalues: searchFriendsAsyncModule (copy)
		return searchFriendsAsyncModule(p2, p3, 20)
	end, {})
	local var23 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var11 (ref), universeId (ref), sendBuildExperienceEventModule (copy), var9 (ref), onInvitesSent (ref), sendPlaytesterInviteMessagesModule (copy), var3 (ref), var2 (ref), var5 (ref), logger (copy), var7 (ref)
		return var11.sendInvites(universeId, p2, p3):andThen(function(p4)
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), var9 (copy), onInvitesSent (copy), sendPlaytesterInviteMessagesModule (copy), var3 (copy), var2 (copy), var5 (copy)
			local added = p4.added
			local rejected = p4.rejected
			sendBuildExperienceEventModule("PLAYTESTERS_ADDED", { universeId = universeId }, { count = tostring(#added) })
			
			if #added ~= 0 then
				return sendPlaytesterInviteMessagesModule(var3, universeId, added, var2):andThen(function(p5)
					-- upvalues: rejected (ref), var9 (copy), var5 (copy), onInvitesSent (copy)
					if #rejected > 0 then
						var9({ navigateOnDismiss = true, userIds = rejected })
						
						return
					elseif #p5 > 0 then
						var5(p5)
						
						return
					end
					onInvitesSent()
				end)
			elseif #rejected > 0 then
				var9({ navigateOnDismiss = false, userIds = rejected })
				
				return
			end
			onInvitesSent()
		end):catch(function(p4)
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p2 (ref), logger (copy), var7 (copy)
			sendBuildExperienceEventModule("PLAYTESTERS_ADD_FAILED", { universeId = universeId }, { count = tostring(#p2) })
			logger:warning("PrivateInvitesPicker: add playtesters failed for universe {}: {}", universeId, p4)
			var7(true)
		end)
	end, {
		var11,
		universeId,
		onInvitesSent,
		var2,
		var3
	})
	local var24 = reactModule.useCallback(function()
		-- upvalues: sharePrivateExperienceModule (copy), universeId (ref), logger (copy), var5 (ref), onInvitesSent (ref)
		sharePrivateExperienceModule(universeId):catch(function(p2)
			-- upvalues: logger (copy), universeId (copy)
			logger:warning("PrivateInvitesPicker: share fallback failed for universe {}: {}", universeId, p2)
		end)
		var5({})
		onInvitesSent()
	end, { universeId, onInvitesSent })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), onInvitesSent (ref)
		var5({})
		onInvitesSent()
	end, { onInvitesSent })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var9 (ref), onInvitesSent (ref)
		local navigateOnDismiss = var8.navigateOnDismiss
		var9({ navigateOnDismiss = false, userIds = {} })
		
		if navigateOnDismiss then
			onInvitesSent()
		end
	end, { var8, onInvitesSent })
	local var28 = useUserPickerModule(reactModule.useMemo(function()
		-- upvalues: var19 (ref), isNotReady (ref), var21 (ref), var22 (ref), var23 (ref), var14 (ref), var15 (ref)
		return {
			browseIds = var19,
			browseIsLoading = isNotReady,
			loadMoreBrowse = var21,
			onSearch = var22,
			onSubmit = var23,
			selectionLimit = var14,
			excludeUserIds = var15
		}
	end, {
		var19, isNotReady, var21, var22, var23, var14, var15
	}))
	local var29, var30 = reactModule.useState(true)
	local var31 = reactModule.useCallback(function()
		-- upvalues: var30 (ref)
		var30(false)
	end, {})
	local var32, var33 = reactModule.useState(nil)
	local var34 = reactModule.useCallback(function(p2)
		-- upvalues: var33 (ref)
		var33(p2)
	end, {})
	local loadMore = var28.loadMore
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), loadMore (ref)
		if var32 == nil then return end
		local function maybeLoadMore()
			-- upvalues: var32 (ref), loadMore (copy)
			if var32.AbsoluteCanvasSize.Y > 0 and var32.AbsoluteCanvasSize.Y - (var32.CanvasPosition.Y + var32.AbsoluteWindowSize.Y) <= 240 then
				loadMore()
			end
		end
		
		local var35 = var32:GetPropertyChangedSignal("CanvasPosition"):Connect(maybeLoadMore)
		local var36 = var32:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(maybeLoadMore)
		local var37 = var32:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(maybeLoadMore)
		
		if var32.AbsoluteCanvasSize.Y > 0 and var32.AbsoluteCanvasSize.Y - (var32.CanvasPosition.Y + var32.AbsoluteWindowSize.Y) <= 240 then
			loadMore()
		end
		return function()
			-- upvalues: var35 (ref), var36 (ref), var37 (ref)
			var35:Disconnect()
			var36:Disconnect()
			var37:Disconnect()
		end
	end, { var32, loadMore })
	
	return {
		isOpen = var29,
		onClose = p1.onClose,
		onRequestClose = var31,
		scrollingFrameRef = var34,
		searchText = var28.searchText,
		setSearchText = var28.setSearchText,
		searchPlaceholder = searchPlaceholder,
		userIds = var28.userIds,
		isLoading = var28.isLoading,
		emptyText = if var18 == "Failed" then friendsLoadError elseif #var19 > 0 then allFriendsAdded else noFriends,
		isSelected = var28.isSelected,
		canSelect = var28.canSelect,
		toggleSelected = var28.toggleSelected,
		hasSelection = var28.hasSelection,
		submit = var28.submit,
		isSubmitting = var28.isSubmitting,
		sendButtonText = if var28.selectedCount > 1 then addPlaytesters else addPlaytester,
		failedInviteUserIds = var4,
		onShareFailedInvites = var24,
		onDismissFailedInvites = var25,
		hasAddError = var6,
		onDismissAddError = var26,
		rejectedInviteUserIds = var8.userIds,
		onDismissRejectedInvite = var27,
		testId = p1.testId
	}
end
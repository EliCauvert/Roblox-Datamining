local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local friendsStore = require(parent.DataHydration.Friends).FriendsStore
local searchFriendsAsyncModule = require(script.Parent.searchFriendsAsync)
local useUserPickerModule = require(buildExperience.Components.UserPicker.useUserPicker)
local _ = require(buildExperience.Components.UserPicker.UserPickerTypes)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(script.Parent.PrivateInvitesPickerView)

return function(p0) --[[ line: 37 | named "usePrivateInvitesPickerViewModel" ]]
	-- upvalues: reactModule (ref), sendBuildExperienceEventModule (ref), getPrivatePlaytestersStore (ref), signalsReactModule (ref), friendsStore (ref), searchFriendsAsyncModule (ref), useUserPickerModule (ref), localizationStringsModule (ref)
	local universeId = p0.universeId
	local onInvitesSent = p0.onInvitesSent
	local var7 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var7 (ref), sendBuildExperienceEventModule (copy), universeId (ref)
		if var7.current then
			return
		end
		var7.current = true
		sendBuildExperienceEventModule("PLAYTEST_PICKER_IMPRESSION", { universeId = universeId })
	end, { universeId })
	local var8 = getPrivatePlaytestersStore(false)
	local var9 = reactModule.useMemo(function() --[[ line: 52 ]]
		-- upvalues: var8 (ref), universeId (ref)
		return var8.getAndFetchInvitedPlayers(universeId)
	end, { var8, universeId })
	local var10 = signalsReactModule.useSignalState(var9.players)
	local var11 = if signalsReactModule.useSignalState(var9.status) == "Ready" then math.max(0, var8.MAX_INVITES - #var10) else 0
	local var12 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: var10 (ref)
		local t = {}
		
		for i, v in var10 do
			t[v] = true
		end
		return t
	end, { var10 })
	local var13 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: friendsStore (copy)
		return friendsStore.get()
	end, {})
	local var14 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var13 (ref)
		return var13.GetAllFriends()
	end, { var13 }))
	local var15 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 81 ]]
		-- upvalues: var13 (ref)
		return var13.GetAllFriendsStatus()
	end, { var13 }))
	local var16 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: var14 (ref)
		local t = {}
		
		if var14 ~= nil then
			for i, v in var14.friends do
				local var30 = tonumber(v.id)
				
				if var30 ~= nil then
					table.insert(t, var30)
				end
			end
		end
		return t
	end, { var14 })
	local isNotReady = var15 == "NotReady"
	local var18 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var13 (ref)
		var13.FetchMoreFriends()
	end, { var13 })
	local var19 = reactModule.useCallback(function(p1, p2) --[[ line: 107 ]]
		-- upvalues: searchFriendsAsyncModule (copy)
		return searchFriendsAsyncModule(p1, p2, 20)
	end, {})
	local var20 = reactModule.useCallback(function(p3, p4) --[[ line: 111 ]]
		-- upvalues: var8 (ref), universeId (ref), sendBuildExperienceEventModule (copy), onInvitesSent (ref)
		return var8.sendInvites(universeId, p3, p4):andThen(function() --[[ line: 114 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p3 (ref), onInvitesSent (copy)
			sendBuildExperienceEventModule("PLAYTESTERS_ADDED", { universeId = universeId }, { count = tostring(#p3) })
			onInvitesSent()
		end):catch(function(p5) --[[ line: 120 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), universeId (copy), p3 (ref)
			sendBuildExperienceEventModule("PLAYTESTERS_ADD_FAILED", { universeId = universeId }, { count = tostring(#p3) })
			error(p5)
		end)
	end, { var8, universeId, onInvitesSent })
	local var21 = useUserPickerModule(reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: var16 (ref), isNotReady (ref), var18 (ref), var19 (ref), var20 (ref), var11 (ref), var12 (ref)
		return {
			browseIds = var16,
			browseIsLoading = isNotReady,
			loadMoreBrowse = var18,
			onSearch = var19,
			onSubmit = var20,
			selectionLimit = var11,
			excludeUserIds = var12
		}
	end, {
		var16, isNotReady, var18, var19, var20, var11, var12
	}))
	local var22, var23 = reactModule.useState(true)
	local var24 = reactModule.useCallback(function() --[[ line: 158 ]]
		-- upvalues: var23 (ref)
		var23(false)
	end, {})
	local var25, var26 = reactModule.useState(nil)
	local var27 = reactModule.useCallback(function(p6) --[[ line: 167 ]]
		-- upvalues: var26 (ref)
		var26(p6)
	end, {})
	local loadMore = var21.loadMore
	reactModule.useEffect(function() --[[ line: 171 ]]
		-- upvalues: var25 (ref), loadMore (ref)
		if var25 == nil then return end
		local function maybeLoadMore() --[[ line: 176 ]]
			-- upvalues: var25 (ref), loadMore (copy)
			if var25.AbsoluteCanvasSize.Y > 0 and var25.AbsoluteCanvasSize.Y - (var25.CanvasPosition.Y + var25.AbsoluteWindowSize.Y) <= 240 then
				loadMore()
			end
		end
		
		local var32 = var25:GetPropertyChangedSignal("CanvasPosition"):Connect(maybeLoadMore)
		local var33 = var25:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(maybeLoadMore)
		local var34 = var25:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(maybeLoadMore)
		
		if var25.AbsoluteCanvasSize.Y > 0 and var25.AbsoluteCanvasSize.Y - (var25.CanvasPosition.Y + var25.AbsoluteWindowSize.Y) <= 240 then
			loadMore()
		end
		return function() --[[ line: 187 ]]
			-- upvalues: var32 (ref), var33 (ref), var34 (ref)
			var32:Disconnect()
			var33:Disconnect()
			var34:Disconnect()
		end
	end, { var25, loadMore })
	
	return {
		isOpen = var22,
		onClose = p0.onClose,
		onRequestClose = var24,
		scrollingFrameRef = var27,
		searchText = var21.searchText,
		setSearchText = var21.setSearchText,
		searchPlaceholder = localizationStringsModule.PRIVATE_INVITES_SEARCH_PLACEHOLDER,
		userIds = var21.userIds,
		isLoading = var21.isLoading,
		emptyText = if var15 == "Failed" then localizationStringsModule.PRIVATE_INVITES_FRIENDS_LOAD_ERROR elseif #var16 > 0 then localizationStringsModule.PRIVATE_INVITES_ALL_FRIENDS_ADDED else localizationStringsModule.PRIVATE_INVITES_NO_FRIENDS,
		isSelected = var21.isSelected,
		canSelect = var21.canSelect,
		toggleSelected = var21.toggleSelected,
		hasSelection = var21.hasSelection,
		submit = var21.submit,
		isSubmitting = var21.isSubmitting,
		sendButtonText = if var21.selectedCount > 1 then localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTERS else localizationStringsModule.PRIVATE_INVITES_ADD_PLAYTESTER,
		testId = p0.testId
	}
end
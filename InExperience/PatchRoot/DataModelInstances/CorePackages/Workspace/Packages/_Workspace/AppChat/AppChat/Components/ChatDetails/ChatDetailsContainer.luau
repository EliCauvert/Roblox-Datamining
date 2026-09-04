local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local promiseModule = require(parent.Promise)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local userProfilesModule = require(parent.UserProfiles)
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useIsGroupChatEnabledModule = require(appChat.Hooks.useIsGroupChatEnabled)
local useState = reactModule.useState
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local userProfilesCombinedNameAndUsernameByUserIds = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local luaAppNavigationContextModule = require(appChat.LuaAppNavigationContext)
local useNavigation = require(parent.Navigation).useNavigation
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local useChatPlacementContext = chatPlacementContextModule.useChatPlacementContext
local isPlacementInExperience = chatPlacementContextModule.isPlacementInExperience
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local selectChatUserEntryModelListModule = require(script.Parent.Selectors.selectChatUserEntryModelList)
local participantDialogContainerModule = require(script.Parent.ParticipantDialog.ParticipantDialogContainer)
local chatDetailsPageModule = require(script.Parent.ChatDetailsPage)
local genericDialogTypeModule = require(script.Parent.Dialogs.GenericDialogType)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatDetailsTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local chatDetailsTelemetryEventsModule = require(appChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local chatConversationTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local chatDetailsTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local getFFlagAppChatParticipantDialogFoundationMenuModule = require(appChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagHideConversationTypeInfoIfNoWebViewModule = require(appChat.Flags.FFlagHideConversationTypeInfoIfNoWebView)
local t = {
	topBarHeight = 0,
	wideMode = false,
	participants = nil,
	isGroupConversation = nil,
	isGroupOwner = nil,
	conversationId = nil,
	conversation = nil,
	navigateBack = function() end,
	navigateToEditChatMembers = function() end,
	navigateToDialog = function() end,
	navigateToToast = function() end,
	navigateToConversation = function() end,
	navigateToChatLanding = function() end
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), useStyle (ref), useLocalization (ref), getFFlagIsSquadEnabled (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), luaAppNavigationContextModule (ref), useDispatch (ref), useState (ref), useNavigation (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledModule (ref), useEffect (ref), useSelector (ref), getDeepValueModule (ref), conversationModule (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesCombinedNameAndUsernameByUserIds (ref), useTelemetryModule (ref), chatDetailsTelemetryLayerModule (ref), selectChatUserEntryModelListModule (ref), getConversationTitleModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), promiseModule (ref), genericDialogTypeModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), chatDetailsTelemetryEventsModule (ref), useCallback (ref), fFlagHideConversationTypeInfoIfNoWebViewModule (ref), useAppPolicy (ref), useChatPlacementContext (ref), isPlacementInExperience (ref), chatConversationTelemetryStateModule (ref), chatDetailsTelemetryStateModule (ref), useEffectOnMount (ref), chatDetailsPageModule (ref), participantDialogContainerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1 or {})
	local var2 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var3 = useStyle()
	local var4 = useLocalization({
		generalText = "Feature.Chat.Label.General",
		titleNotSetText = "Feature.Chat.Label.NotSet",
		membersText = "Feature.Chat.Label.Members",
		leaveGroupText = "Feature.Chat.Heading.LeaveGroup",
		onlinePresenceText = "Common.Presence.Label.Online",
		offlinePresenceText = "Common.Presence.Label.Offline",
		networkErrorToastText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		conversationTypeHeaderText = "Feature.Chat.Label.ExpandedChatFeatures",
		enabledText = "Feature.Chat.Label.Available",
		disabledText = "Feature.Chat.Label.Unavailable",
		createUnfilteredChatText = "Feature.Chat.Label.CreateUnfilteredChat",
		createUnfilteredChatSubtitleText = "Feature.Chat.Description.CreateUnfilteredChatCell",
		pageHeaderText = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.Details" else "Feature.Chat.Label.ChatDetails",
		addFriendsText = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
		chatGroupText = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.GroupName" else "Feature.Chat.Label.ChatGroupName",
		tooManyPeopleText = {
			if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddConnectionsPartyLimit" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsLimit" else "Feature.Chat.Message.AddConnectionsLimit",
			friendNum = 5,
			connectionsNum = 5
		}
	})
	local var5 = reactModule.useContext(luaAppNavigationContextModule)
	local var6 = useDispatch()
	local var7, var8 = useState(false)
	local var9 = nil
	local var10 = nil
	local var11 = nil
	local var12 = nil
	
	if var2 then
		local var13, var14 = useState(nil)
		var9 = var13
		var10 = var14
		local var15, var16 = useState(nil)
		var11 = var15
		var12 = var16
	end
	local var17 = useNavigation()
	local var18 = useIsGroupChatEnabledModule()
	local var19 = useIsChatEnabledModule()
	useEffect(function()
		-- upvalues: var19 (ref), var1 (ref)
		if not var19 then
			var1.navigateToChatLanding()
		end
	end, { var19, var1.navigateToChatLanding })
	local var20 = useSelector(function(p2)
		-- upvalues: getDeepValueModule (copy), var1 (ref), conversationModule (copy)
		return getDeepValueModule(p2, `ChatAppReducer.Conversations.{var1.conversationId or ""}`) or conversationModule.empty()
	end)
	local var21 = useSelector(function(p2)
		-- upvalues: getDeepValueModule (copy), var1 (ref)
		return getDeepValueModule(p2, `ChatAppReducer.ParticipantMetadata.{var1.conversationId or ""}`)
	end)
	local source = var20 and var20.source
	useEffect(function()
		-- upvalues: source (ref), var6 (ref), appChatNetworkingModule (copy), var1 (ref)
		if source == "channels" then
			var6(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var1.conversationId })):catch(function()
				warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var1.conversationId, var1.participants, source })
	local var22 = useUserProfilesFetch({
		userIds = var20.participants,
		query = userProfilesCombinedNameAndUsernameByUserIds
	})
	local var23 = useTelemetryModule(chatDetailsTelemetryLayerModule.Context)
	local var24 = nil
	local var25 = nil
	local var26 = nil
	local titleNotSetText = nil
	local var27 = nil
	local var28 = nil
	local var29 = nil
	
	if var20 then
		var24 = useSelector(function(p2)
			-- upvalues: selectChatUserEntryModelListModule (copy), var20 (ref), var22 (ref)
			return selectChatUserEntryModelListModule(p2, var20.participants, if var22 and var22.data then var22.data.userProfiles else nil)
		end)
		var26 = var20.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		var25 = useSelector(function(p2)
			-- upvalues: var26 (write), var20 (ref)
			return var26 and var20.initiator == p2.LocalUserId
		end)
		titleNotSetText = getConversationTitleModule(var20)
		
		if var21 then
			for i, v in var24 do
				var24[i] = cryoModule.Dictionary.join(v, { metadata = var21[i] })
			end
		end
		var28 = useIsUserPendingModule(var20)
		var27 = var26 and var28
		
		if var27 then
			var18 = false
		end
		var29 = var20.moderationType == conversationChannelsModule.ModerationType.TrustedComms
	end
	local var30 = if var24 then #var24 else 0
	local var31 = if var29 then var4.enabledText else var4.disabledText
	
	if var20.isDefaultTitle then
		titleNotSetText = var4.titleNotSetText
	end
	local _ = function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.new(function(p3, p4)
			-- upvalues: p2 (ref)
			if #p2.participants > 5 then
				p4()
				
				return
			end
			p3()
		end)
	end
	
	local var32 = function()
		-- upvalues: var1 (ref), genericDialogTypeModule (copy)
		var1.navigateToDialog(genericDialogTypeModule.EditChatGroupNameDialog, { conversationId = var1.conversationId })
	end
	
	local var33 = function()
		-- upvalues: getFFlagAppChatEnableRootedNavigationModule (copy), var17 (ref), var1 (ref), genericDialogTypeModule (copy), var23 (ref), chatDetailsTelemetryEventsModule (copy)
		var1.navigateToDialog(genericDialogTypeModule.LeaveGroupDialog, {
			conversationId = var1.conversationId,
			isRooted = if getFFlagAppChatEnableRootedNavigationModule() and var17 then var17.getParam("isRooted", false) else false
		})
		var23.emit(chatDetailsTelemetryEventsModule.ChatDetailsLeaveGroupBtnClicked, {})
	end
	
	local var34 = useCallback(function()
		-- upvalues: var17 (ref), var5 (ref)
		if var17 then
			var5.navigateToUnfilteredThreadsLearnMore(var17.navigate)
			
			return
		end
		var5.navigateToUnfilteredThreadsLearnMore()
	end, { var5, var17 })
	local var35 = useCallback(function()
		-- upvalues: var23 (ref), chatDetailsTelemetryEventsModule (copy), var8 (ref), var6 (ref), appChatNetworkingModule (copy), var1 (ref), var4 (ref)
		var23.emit(chatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellClicked, {})
		var8(true)
		var6(appChatNetworkingModule.rodux.DuplicateConversation.API(var1.conversationId, "trusted_comms")):andThen(function(p2)
			-- upvalues: var1 (copy), var4 (copy)
			local responseBody = p2.responseBody
			local id = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))
			
			if id then
				var1.navigateToConversation(id)
				
				return
			end
			var1.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var4.networkErrorToastText }
				}
			})
		end):catch(function()
			-- upvalues: var1 (copy), var4 (copy)
			var1.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var4.networkErrorToastText }
				}
			})
		end):finally(function()
			-- upvalues: var8 (copy)
			var8(false)
		end)
	end, {
		var6, var8, var1.navigateToToast, var1.navigateToConversation,
		var1.conversationId, var30, var25, var23
	})
	
	local var36 = function()
		-- upvalues: var10 (write), var12 (write)
		if var10 and var12 then
			var10(nil)
			var12(nil)
		end
	end
	
	local var37 = function(p2, p3)
		-- upvalues: var2 (ref), var10 (write), var12 (write), var9 (write), var1 (ref), genericDialogTypeModule (copy), var28 (write), var26 (write), var25 (write)
		local var38 = tostring(p2)
		
		if not var2 or not var10 or not var12 then
			var1.navigateToDialog(genericDialogTypeModule.ParticipantDialog, {
				conversationId = var1.conversationId,
				participantId = var38,
				showRemoveUserButton = not var28 and (var26 and var25)
			})
			
			return
		elseif var9 == var38 then
			if var10 and var12 then
				var10(nil)
				var12(nil)
				
				return
			end
		else
			var10(var38)
			var12(p3)
		end
	end
	
	local var38 = function(p2)
		-- upvalues: var1 (ref)
		var1.navigateToToast({ toastProps = { toastContent = { toastTitle = p2 } } })
	end
	
	local var39 = function(p2)
		-- upvalues: var20 (ref), promiseModule (copy), var1 (ref), var38 (ref), var23 (ref), chatDetailsTelemetryEventsModule (copy)
		promiseModule.new(function(p3, p4)
			-- upvalues: var20 (ref)
			if #var20.participants > 5 then
				p4()
				
				return
			end
			p3()
		end):andThen(function()
			-- upvalues: var1 (copy), var20 (copy)
			var1.navigateToEditChatMembers(var20)
		end, function()
			-- upvalues: var38 (copy), p2 (ref)
			var38(p2)
		end)
		var23.emit(chatDetailsTelemetryEventsModule.ChatDetailsAddFriendsBtnClicked, {})
	end
	
	local var40 = if fFlagHideConversationTypeInfoIfNoWebViewModule then useAppPolicy(function(p2)
		return p2.getWebViewSupport()
	end) or isPlacementInExperience(useChatPlacementContext().chatPlacement) else nil
	local var41 = if var20 then var20.moderationType else cryoModule.None
	local var42 = if var20 then var20.userPendingStatus else cryoModule.None
	local var43 = chatConversationTelemetryStateModule.useMergeState()
	useEffect(function()
		-- upvalues: var43 (ref), var1 (ref), var41 (ref), var42 (ref)
		var43({
			conversationId = var1.conversationId,
			moderationType = var41,
			userPendingStatus = var42
		})
	end, { var1.conversationId, var41, var42 })
	local var44 = chatDetailsTelemetryStateModule.useMergeState()
	useEffect(function()
		-- upvalues: var44 (ref), var20 (ref), var25 (write)
		var44({
			participantsCount = #var20.participants,
			isGroupOwner = var25
		})
	end, { #var20.participants, var25 })
	useEffectOnMount(function()
		-- upvalues: var23 (ref), chatDetailsTelemetryEventsModule (copy), var26 (write)
		var23.emit(chatDetailsTelemetryEventsModule.ScreenRendered, { isGroupConversation = var26 })
	end)
	local var45 = cryoModule.Dictionary.join({
		shouldShowCreateUnfilteredChat = false,
		LayoutOrder = 2,
		navigateBack = var1.navigateBack,
		onGroupNameEntryCellActivated = var32,
		onLeaveGroupCellActivated = var33,
		onParticipantCellActivated = var37,
		onAddFriendsCellActivated = function()
			-- upvalues: var39 (ref), var4 (ref)
			return var39(var4.tooManyPeopleText)
		end,
		onConversationTypeIconActivated = var34,
		onCreateUnfilteredChatCellActivated = var35,
		conversationTitle = titleNotSetText,
		conversation = var20,
		conversationId = var1.conversationId,
		participants = var24,
		isGroupConversation = var26,
		wideMode = var1.wideMode,
		shouldHideGroupChatFunctionality = var27,
		shouldShowAddFriends = var18,
		shouldShowConversationTypeInfo = if fFlagHideConversationTypeInfoIfNoWebViewModule then var40 else nil,
		conversationTypeText = var31,
		isCreateUnfilteredChatLoading = var7,
		topBarHeight = var1.topBarHeight,
		style = var3
	}, var4)
	
	if var2 then
		var45.activeParticipantId = var9
	end
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ChatDetailsPage = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Content = reactModule.createElement(chatDetailsPageModule, var45)
		}),
		ParticipantDialog = if var2 and var9 ~= nil then reactModule.createElement(participantDialogContainerModule, {
			anchorRef = var11,
			conversationId = var1.conversationId,
			isWideMode = var1.wideMode,
			navigateToDialog = var1.navigateToDialog,
			onDismiss = var36,
			participantId = var9,
			showRemoveUserButton = not var28 and (var26 and var25)
		}) else nil
	})
end
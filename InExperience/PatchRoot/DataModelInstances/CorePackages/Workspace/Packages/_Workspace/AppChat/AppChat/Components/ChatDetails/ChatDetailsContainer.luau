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
local fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule = require(appChat.Flags.FFlagAppChatAlwaysDisplayUserCardsInChatDetails)
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
	navigateBack = function() --[[ line: 68 ]] end,
	navigateToEditChatMembers = function() --[[ line: 69 ]] end,
	navigateToDialog = function() --[[ line: 70 ]] end,
	navigateToToast = function() --[[ line: 71 ]] end,
	navigateToConversation = function() --[[ line: 72 ]] end,
	navigateToChatLanding = function() --[[ line: 73 ]] end
}

return function(p0) --[[ line: 76 ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), useStyle (ref), useLocalization (ref), getFFlagIsSquadEnabled (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), luaAppNavigationContextModule (ref), useDispatch (ref), useState (ref), useNavigation (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledModule (ref), useEffect (ref), useSelector (ref), getDeepValueModule (ref), conversationModule (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesCombinedNameAndUsernameByUserIds (ref), useTelemetryModule (ref), chatDetailsTelemetryLayerModule (ref), fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule (ref), selectChatUserEntryModelListModule (ref), getConversationTitleModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), promiseModule (ref), genericDialogTypeModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), chatDetailsTelemetryEventsModule (ref), useCallback (ref), fFlagHideConversationTypeInfoIfNoWebViewModule (ref), useAppPolicy (ref), useChatPlacementContext (ref), isPlacementInExperience (ref), chatConversationTelemetryStateModule (ref), chatDetailsTelemetryStateModule (ref), useEffectOnMount (ref), chatDetailsPageModule (ref), participantDialogContainerModule (ref)
	local var30 = cryoModule.Dictionary.join(t, p0 or {})
	local var31 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var32 = useStyle()
	local var33 = useLocalization({
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
	local var34 = reactModule.useContext(luaAppNavigationContextModule)
	local var35 = useDispatch()
	local var36, var37 = useState(false)
	local var38 = nil
	local var39 = nil
	local var40 = nil
	local var41 = nil
	
	if var31 then
		local var42, var43 = useState(nil)
		var38 = var42
		var39 = var43
		local var44, var45 = useState(nil)
		var40 = var44
		var41 = var45
	end
	local var46 = useNavigation()
	local var47 = useIsGroupChatEnabledModule()
	local var48 = useIsChatEnabledModule()
	useEffect(function() --[[ line: 129 ]]
		-- upvalues: var48 (ref), var30 (ref)
		if not var48 then
			var30.navigateToChatLanding()
		end
	end, { var48, var30.navigateToChatLanding })
	local var49 = useSelector(function(p1) --[[ line: 135 ]]
		-- upvalues: getDeepValueModule (copy), var30 (ref), conversationModule (copy)
		return getDeepValueModule(p1, `ChatAppReducer.Conversations.{var30.conversationId or ""}`) or conversationModule.empty()
	end)
	local var50 = useSelector(function(p2) --[[ line: 139 ]]
		-- upvalues: getDeepValueModule (copy), var30 (ref)
		return getDeepValueModule(p2, `ChatAppReducer.ParticipantMetadata.{var30.conversationId or ""}`)
	end)
	local source = var49 and var49.source
	useEffect(function() --[[ line: 144 ]]
		-- upvalues: source (ref), var35 (ref), appChatNetworkingModule (copy), var30 (ref)
		if source == "channels" then
			var35(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var30.conversationId })):catch(function() --[[ line: 150 ]]
				warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var30.conversationId, var30.participants, source })
	local var52 = useUserProfilesFetch({
		userIds = var49.participants,
		query = userProfilesCombinedNameAndUsernameByUserIds
	})
	local var53 = useTelemetryModule(chatDetailsTelemetryLayerModule.Context)
	local var54 = nil
	local var55 = nil
	local var56 = nil
	local titleNotSetText = nil
	local var57 = nil
	local var58 = nil
	local var59 = nil
	
	if var49 then
		var54 = useSelector(function(p3) --[[ line: 169 ]]
			-- upvalues: fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule (copy), selectChatUserEntryModelListModule (copy), var49 (ref), var52 (ref)
			return if fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule then selectChatUserEntryModelListModule(p3, var49.participants, if var52 and var52.data then var52.data.userProfiles else nil) elseif var52.data then selectChatUserEntryModelListModule(p3, var49.participants, var52.data.userProfiles) else {}
		end)
		var56 = var49.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		var55 = useSelector(function(p4) --[[ line: 189 ]]
			-- upvalues: var56 (write), var49 (ref)
			return var56 and var49.initiator == p4.LocalUserId
		end)
		titleNotSetText = getConversationTitleModule(var49)
		
		if var50 then
			for i, v in var54 do
				var54[i] = cryoModule.Dictionary.join(v, { metadata = var50[i] })
			end
		end
		var58 = useIsUserPendingModule(var49)
		var57 = var56 and var58
		
		if var57 then
			var47 = false
		end
		var59 = var49.moderationType == conversationChannelsModule.ModerationType.TrustedComms
	end
	local var60 = if var54 then #var54 else 0
	local var61 = if var59 then var33.enabledText else var33.disabledText
	
	if var49.isDefaultTitle then
		titleNotSetText = var33.titleNotSetText
	end
	local _ = function(p5) --[[ line: 216 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.new(function(p6, p7) --[[ line: 217 ]]
			-- upvalues: p5 (ref)
			if #p5.participants > 5 then
				p7()
				
				return
			end
			p6()
		end)
	end
	
	local var62 = function() --[[ line: 227 ]]
		-- upvalues: var30 (ref), genericDialogTypeModule (copy)
		var30.navigateToDialog(genericDialogTypeModule.EditChatGroupNameDialog, { conversationId = var30.conversationId })
	end
	
	local var63 = function() --[[ line: 232 ]]
		-- upvalues: getFFlagAppChatEnableRootedNavigationModule (copy), var46 (ref), var30 (ref), genericDialogTypeModule (copy), var53 (ref), chatDetailsTelemetryEventsModule (copy)
		var30.navigateToDialog(genericDialogTypeModule.LeaveGroupDialog, {
			conversationId = var30.conversationId,
			isRooted = if getFFlagAppChatEnableRootedNavigationModule() and var46 then var46.getParam("isRooted", false) else false
		})
		var53.emit(chatDetailsTelemetryEventsModule.ChatDetailsLeaveGroupBtnClicked, {})
	end
	
	local var64 = useCallback(function() --[[ line: 243 ]]
		-- upvalues: var46 (ref), var34 (ref)
		if var46 then
			var34.navigateToUnfilteredThreadsLearnMore(var46.navigate)
			
			return
		end
		var34.navigateToUnfilteredThreadsLearnMore()
	end, { var34, var46 })
	local var65 = useCallback(function() --[[ line: 251 ]]
		-- upvalues: var53 (ref), chatDetailsTelemetryEventsModule (copy), var37 (ref), var35 (ref), appChatNetworkingModule (copy), var30 (ref), var33 (ref)
		var53.emit(chatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellClicked, {})
		var37(true)
		var35(appChatNetworkingModule.rodux.DuplicateConversation.API(var30.conversationId, "trusted_comms")):andThen(function(p8) --[[ line: 255 ]]
			-- upvalues: var30 (copy), var33 (copy)
			local responseBody = p8.responseBody
			local id = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))
			
			if id then
				var30.navigateToConversation(id)
				
				return
			end
			var30.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var33.networkErrorToastText }
				}
			})
		end):catch(function() --[[ line: 273 ]]
			-- upvalues: var30 (copy), var33 (copy)
			var30.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var33.networkErrorToastText }
				}
			})
		end):finally(function() --[[ line: 282 ]]
			-- upvalues: var37 (copy)
			var37(false)
		end)
	end, {
		var35, var37, var30.navigateToToast, var30.navigateToConversation,
		var30.conversationId, var60, var55, var53
	})
	
	local var66 = function() --[[ line: 298 ]]
		-- upvalues: var39 (write), var41 (write)
		if var39 and var41 then
			var39(nil)
			var41(nil)
		end
	end
	
	local var67 = function(p9, p10) --[[ line: 305 ]]
		-- upvalues: var31 (ref), var39 (write), var41 (write), var38 (write), var30 (ref), genericDialogTypeModule (copy), var58 (write), var56 (write), var55 (write)
		local var77 = tostring(p9)
		
		if not var31 or not var39 or not var41 then
			var30.navigateToDialog(genericDialogTypeModule.ParticipantDialog, {
				conversationId = var30.conversationId,
				participantId = var77,
				showRemoveUserButton = not var58 and (var56 and var55)
			})
			
			return
		elseif var38 == var77 then
			if var39 and var41 then
				var39(nil)
				var41(nil)
				
				return
			end
		else
			var39(var77)
			var41(p10)
		end
	end
	
	local var68 = function(p11) --[[ line: 325 ]]
		-- upvalues: var30 (ref)
		var30.navigateToToast({ toastProps = { toastContent = { toastTitle = p11 } } })
	end
	
	local var69 = function(p12) --[[ line: 335 ]]
		-- upvalues: var49 (ref), promiseModule (copy), var30 (ref), var68 (ref), var53 (ref), chatDetailsTelemetryEventsModule (copy)
		promiseModule.new(function(p13, p14) --[[ line: 217 ]]
			-- upvalues: var49 (ref)
			if #var49.participants > 5 then
				p14()
				
				return
			end
			p13()
		end):andThen(function() --[[ line: 336 ]]
			-- upvalues: var30 (copy), var49 (copy)
			var30.navigateToEditChatMembers(var49)
		end, function() --[[ line: 339 ]]
			-- upvalues: var68 (copy), p12 (ref)
			var68(p12)
		end)
		var53.emit(chatDetailsTelemetryEventsModule.ChatDetailsAddFriendsBtnClicked, {})
	end
	
	local var70 = if fFlagHideConversationTypeInfoIfNoWebViewModule then useAppPolicy(function(p15) --[[ line: 348 ]]
		return p15.getWebViewSupport()
	end) or isPlacementInExperience(useChatPlacementContext().chatPlacement) else nil
	local var71 = if var49 then var49.moderationType else cryoModule.None
	local var72 = if var49 then var49.userPendingStatus else cryoModule.None
	local var73 = chatConversationTelemetryStateModule.useMergeState()
	useEffect(function() --[[ line: 359 ]]
		-- upvalues: var73 (ref), var30 (ref), var71 (ref), var72 (ref)
		var73({
			conversationId = var30.conversationId,
			moderationType = var71,
			userPendingStatus = var72
		})
	end, { var30.conversationId, var71, var72 })
	local var74 = chatDetailsTelemetryStateModule.useMergeState()
	useEffect(function() --[[ line: 367 ]]
		-- upvalues: var74 (ref), var49 (ref), var55 (write)
		var74({
			participantsCount = #var49.participants,
			isGroupOwner = var55
		})
	end, { #var49.participants, var55 })
	useEffectOnMount(function() --[[ line: 374 ]]
		-- upvalues: var53 (ref), chatDetailsTelemetryEventsModule (copy), var56 (write)
		var53.emit(chatDetailsTelemetryEventsModule.ScreenRendered, { isGroupConversation = var56 })
	end)
	local var75 = cryoModule.Dictionary.join({
		shouldShowCreateUnfilteredChat = false,
		LayoutOrder = 2,
		navigateBack = var30.navigateBack,
		onGroupNameEntryCellActivated = var62,
		onLeaveGroupCellActivated = var63,
		onParticipantCellActivated = var67,
		onAddFriendsCellActivated = function() --[[ line: 385 ]]
			-- upvalues: var69 (ref), var33 (ref)
			return var69(var33.tooManyPeopleText)
		end,
		onConversationTypeIconActivated = var64,
		onCreateUnfilteredChatCellActivated = var65,
		conversationTitle = titleNotSetText,
		conversation = var49,
		conversationId = var30.conversationId,
		participants = var54,
		isGroupConversation = var56,
		wideMode = var30.wideMode,
		shouldHideGroupChatFunctionality = var57,
		shouldShowAddFriends = var47,
		shouldShowConversationTypeInfo = if fFlagHideConversationTypeInfoIfNoWebViewModule then var70 else nil,
		conversationTypeText = var61,
		isCreateUnfilteredChatLoading = var36,
		topBarHeight = var30.topBarHeight,
		style = var32
	}, var33)
	
	if var31 then
		var75.activeParticipantId = var38
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
			Content = reactModule.createElement(chatDetailsPageModule, var75)
		}),
		ParticipantDialog = if var31 and var38 ~= nil then reactModule.createElement(participantDialogContainerModule, {
			anchorRef = var40,
			conversationId = var30.conversationId,
			isWideMode = var30.wideMode,
			navigateToDialog = var30.navigateToDialog,
			onDismiss = var66,
			participantId = var38,
			showRemoveUserButton = not var58 and (var56 and var55)
		}) else nil
	})
end
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
local t = {
	topBarHeight = 0,
	wideMode = false,
	participants = nil,
	isGroupConversation = nil,
	isGroupOwner = nil,
	conversationId = nil,
	conversation = nil,
	navigateBack = function() --[[ line: 63 ]] end,
	navigateToEditChatMembers = function() --[[ line: 64 ]] end,
	navigateToDialog = function() --[[ line: 65 ]] end,
	navigateToToast = function() --[[ line: 66 ]] end,
	navigateToConversation = function() --[[ line: 67 ]] end,
	navigateToChatLanding = function() --[[ line: 68 ]] end
}

return function(p0) --[[ line: 71 ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), useStyle (ref), useLocalization (ref), getFFlagIsSquadEnabled (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), luaAppNavigationContextModule (ref), useDispatch (ref), useState (ref), useNavigation (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledModule (ref), useEffect (ref), useSelector (ref), getDeepValueModule (ref), conversationModule (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesCombinedNameAndUsernameByUserIds (ref), useTelemetryModule (ref), chatDetailsTelemetryLayerModule (ref), fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule (ref), selectChatUserEntryModelListModule (ref), getConversationTitleModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), promiseModule (ref), genericDialogTypeModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), chatDetailsTelemetryEventsModule (ref), useCallback (ref), chatConversationTelemetryStateModule (ref), chatDetailsTelemetryStateModule (ref), useEffectOnMount (ref), chatDetailsPageModule (ref), participantDialogContainerModule (ref)
	local var28 = cryoModule.Dictionary.join(t, p0 or {})
	local var29 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var30 = useStyle()
	local var31 = useLocalization({
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
	local var32 = reactModule.useContext(luaAppNavigationContextModule)
	local var33 = useDispatch()
	local var34, var35 = useState(false)
	local var36 = nil
	local var37 = nil
	local var38 = nil
	local var39 = nil
	
	if var29 then
		local var40, var41 = useState(nil)
		var36 = var40
		var37 = var41
		local var42, var43 = useState(nil)
		var38 = var42
		var39 = var43
	end
	local var44 = useNavigation()
	local var45 = useIsGroupChatEnabledModule()
	local var46 = useIsChatEnabledModule()
	useEffect(function() --[[ line: 124 ]]
		-- upvalues: var46 (ref), var28 (ref)
		if not var46 then
			var28.navigateToChatLanding()
		end
	end, { var46, var28.navigateToChatLanding })
	local var47 = useSelector(function(p1) --[[ line: 130 ]]
		-- upvalues: getDeepValueModule (copy), var28 (ref), conversationModule (copy)
		return getDeepValueModule(p1, `ChatAppReducer.Conversations.{var28.conversationId or ""}`) or conversationModule.empty()
	end)
	local var48 = useSelector(function(p2) --[[ line: 134 ]]
		-- upvalues: getDeepValueModule (copy), var28 (ref)
		return getDeepValueModule(p2, `ChatAppReducer.ParticipantMetadata.{var28.conversationId or ""}`)
	end)
	local source = var47 and var47.source
	useEffect(function() --[[ line: 139 ]]
		-- upvalues: source (ref), var33 (ref), appChatNetworkingModule (copy), var28 (ref)
		if source == "channels" then
			var33(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var28.conversationId })):catch(function() --[[ line: 145 ]]
				warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var28.conversationId, var28.participants, source })
	local var50 = useUserProfilesFetch({
		userIds = var47.participants,
		query = userProfilesCombinedNameAndUsernameByUserIds
	})
	local var51 = useTelemetryModule(chatDetailsTelemetryLayerModule.Context)
	local var52 = nil
	local var53 = nil
	local var54 = nil
	local titleNotSetText = nil
	local var55 = nil
	local var56 = nil
	local var57 = nil
	
	if var47 then
		var52 = useSelector(function(p3) --[[ line: 164 ]]
			-- upvalues: fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule (copy), selectChatUserEntryModelListModule (copy), var47 (ref), var50 (ref)
			return if fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule then selectChatUserEntryModelListModule(p3, var47.participants, if var50 and var50.data then var50.data.userProfiles else nil) elseif var50.data then selectChatUserEntryModelListModule(p3, var47.participants, var50.data.userProfiles) else {}
		end)
		var54 = var47.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		var53 = useSelector(function(p4) --[[ line: 184 ]]
			-- upvalues: var54 (write), var47 (ref)
			return var54 and var47.initiator == p4.LocalUserId
		end)
		titleNotSetText = getConversationTitleModule(var47)
		
		if var48 then
			for i, v in var52 do
				var52[i] = cryoModule.Dictionary.join(v, { metadata = var48[i] })
			end
		end
		var56 = useIsUserPendingModule(var47)
		var55 = var54 and var56
		
		if var55 then
			var45 = false
		end
		var57 = var47.moderationType == conversationChannelsModule.ModerationType.TrustedComms
	end
	local var58 = if var52 then #var52 else 0
	local var59 = if var57 then var31.enabledText else var31.disabledText
	
	if var47.isDefaultTitle then
		titleNotSetText = var31.titleNotSetText
	end
	local _ = function(p5) --[[ line: 211 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.new(function(p6, p7) --[[ line: 212 ]]
			-- upvalues: p5 (ref)
			if #p5.participants > 5 then
				p7()
				
				return
			end
			p6()
		end)
	end
	
	local var60 = function() --[[ line: 222 ]]
		-- upvalues: var28 (ref), genericDialogTypeModule (copy)
		var28.navigateToDialog(genericDialogTypeModule.EditChatGroupNameDialog, { conversationId = var28.conversationId })
	end
	
	local var61 = function() --[[ line: 227 ]]
		-- upvalues: getFFlagAppChatEnableRootedNavigationModule (copy), var44 (ref), var28 (ref), genericDialogTypeModule (copy), var51 (ref), chatDetailsTelemetryEventsModule (copy)
		var28.navigateToDialog(genericDialogTypeModule.LeaveGroupDialog, {
			conversationId = var28.conversationId,
			isRooted = if getFFlagAppChatEnableRootedNavigationModule() and var44 then var44.getParam("isRooted", false) else false
		})
		var51.emit(chatDetailsTelemetryEventsModule.ChatDetailsLeaveGroupBtnClicked, {})
	end
	
	local var62 = useCallback(function() --[[ line: 238 ]]
		-- upvalues: var44 (ref), var32 (ref)
		if var44 then
			var32.navigateToUnfilteredThreadsLearnMore(var44.navigate)
			
			return
		end
		var32.navigateToUnfilteredThreadsLearnMore()
	end, { var32, var44 })
	local var63 = useCallback(function() --[[ line: 246 ]]
		-- upvalues: var51 (ref), chatDetailsTelemetryEventsModule (copy), var35 (ref), var33 (ref), appChatNetworkingModule (copy), var28 (ref), var31 (ref)
		var51.emit(chatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellClicked, {})
		var35(true)
		var33(appChatNetworkingModule.rodux.DuplicateConversation.API(var28.conversationId, "trusted_comms")):andThen(function(p8) --[[ line: 250 ]]
			-- upvalues: var28 (copy), var31 (copy)
			local responseBody = p8.responseBody
			local id = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))
			
			if id then
				var28.navigateToConversation(id)
				
				return
			end
			var28.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var31.networkErrorToastText }
				}
			})
		end):catch(function() --[[ line: 268 ]]
			-- upvalues: var28 (copy), var31 (copy)
			var28.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var31.networkErrorToastText }
				}
			})
		end):finally(function() --[[ line: 277 ]]
			-- upvalues: var35 (copy)
			var35(false)
		end)
	end, {
		var33, var35, var28.navigateToToast, var28.navigateToConversation,
		var28.conversationId, var58, var53, var51
	})
	
	local var64 = function() --[[ line: 293 ]]
		-- upvalues: var37 (write), var39 (write)
		if var37 and var39 then
			var37(nil)
			var39(nil)
		end
	end
	
	local var65 = function(p9, p10) --[[ line: 300 ]]
		-- upvalues: var29 (ref), var37 (write), var39 (write), var36 (write), var28 (ref), genericDialogTypeModule (copy), var56 (write), var54 (write), var53 (write)
		local var74 = tostring(p9)
		
		if not var29 or not var37 or not var39 then
			var28.navigateToDialog(genericDialogTypeModule.ParticipantDialog, {
				conversationId = var28.conversationId,
				participantId = var74,
				showRemoveUserButton = not var56 and (var54 and var53)
			})
			
			return
		elseif var36 == var74 then
			if var37 and var39 then
				var37(nil)
				var39(nil)
				
				return
			end
		else
			var37(var74)
			var39(p10)
		end
	end
	
	local var66 = function(p11) --[[ line: 320 ]]
		-- upvalues: var28 (ref)
		var28.navigateToToast({ toastProps = { toastContent = { toastTitle = p11 } } })
	end
	
	local var67 = function(p12) --[[ line: 330 ]]
		-- upvalues: var47 (ref), promiseModule (copy), var28 (ref), var66 (ref), var51 (ref), chatDetailsTelemetryEventsModule (copy)
		promiseModule.new(function(p13, p14) --[[ line: 212 ]]
			-- upvalues: var47 (ref)
			if #var47.participants > 5 then
				p14()
				
				return
			end
			p13()
		end):andThen(function() --[[ line: 331 ]]
			-- upvalues: var28 (copy), var47 (copy)
			var28.navigateToEditChatMembers(var47)
		end, function() --[[ line: 334 ]]
			-- upvalues: var66 (copy), p12 (ref)
			var66(p12)
		end)
		var51.emit(chatDetailsTelemetryEventsModule.ChatDetailsAddFriendsBtnClicked, {})
	end
	
	local var68 = if var47 then var47.moderationType else cryoModule.None
	local var69 = if var47 then var47.userPendingStatus else cryoModule.None
	local var70 = chatConversationTelemetryStateModule.useMergeState()
	useEffect(function() --[[ line: 344 ]]
		-- upvalues: var70 (ref), var28 (ref), var68 (ref), var69 (ref)
		var70({
			conversationId = var28.conversationId,
			moderationType = var68,
			userPendingStatus = var69
		})
	end, { var28.conversationId, var68, var69 })
	local var71 = chatDetailsTelemetryStateModule.useMergeState()
	useEffect(function() --[[ line: 352 ]]
		-- upvalues: var71 (ref), var47 (ref), var53 (write)
		var71({
			participantsCount = #var47.participants,
			isGroupOwner = var53
		})
	end, { #var47.participants, var53 })
	useEffectOnMount(function() --[[ line: 359 ]]
		-- upvalues: var51 (ref), chatDetailsTelemetryEventsModule (copy), var54 (write)
		var51.emit(chatDetailsTelemetryEventsModule.ScreenRendered, { isGroupConversation = var54 })
	end)
	local var72 = cryoModule.Dictionary.join({
		shouldShowCreateUnfilteredChat = false,
		LayoutOrder = 2,
		navigateBack = var28.navigateBack,
		onGroupNameEntryCellActivated = var60,
		onLeaveGroupCellActivated = var61,
		onParticipantCellActivated = var65,
		onAddFriendsCellActivated = function() --[[ line: 370 ]]
			-- upvalues: var67 (ref), var31 (ref)
			return var67(var31.tooManyPeopleText)
		end,
		onConversationTypeIconActivated = var62,
		onCreateUnfilteredChatCellActivated = var63,
		conversationTitle = titleNotSetText,
		conversation = var47,
		conversationId = var28.conversationId,
		participants = var52,
		isGroupConversation = var54,
		wideMode = var28.wideMode,
		shouldHideGroupChatFunctionality = var55,
		shouldShowAddFriends = var45,
		conversationTypeText = var59,
		isCreateUnfilteredChatLoading = var34,
		topBarHeight = var28.topBarHeight,
		style = var30
	}, var31)
	
	if var29 then
		var72.activeParticipantId = var36
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
			Content = reactModule.createElement(chatDetailsPageModule, var72)
		}),
		ParticipantDialog = if var29 and var36 ~= nil then reactModule.createElement(participantDialogContainerModule, {
			anchorRef = var38,
			conversationId = var28.conversationId,
			isWideMode = var28.wideMode,
			navigateToDialog = var28.navigateToDialog,
			onDismiss = var64,
			participantId = var36,
			showRemoveUserButton = not var56 and (var54 and var53)
		}) else nil
	})
end
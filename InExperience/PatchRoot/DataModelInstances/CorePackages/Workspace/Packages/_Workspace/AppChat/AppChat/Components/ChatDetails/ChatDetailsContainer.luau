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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local t = {
	topBarHeight = 0,
	wideMode = false,
	participants = nil,
	isGroupConversation = nil,
	isGroupOwner = nil,
	conversationId = nil,
	conversation = nil,
	navigateBack = function() --[[ line: 62 ]] end,
	navigateToEditChatMembers = function() --[[ line: 63 ]] end,
	navigateToDialog = function() --[[ line: 64 ]] end,
	navigateToToast = function() --[[ line: 65 ]] end,
	navigateToConversation = function() --[[ line: 66 ]] end,
	navigateToChatLanding = function() --[[ line: 67 ]] end
}

return function(p0) --[[ line: 70 ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), useStyle (ref), useLocalization (ref), getFFlagIsSquadEnabled (ref), fFlagConnectionsToFriendsRename (ref), reactModule (ref), luaAppNavigationContextModule (ref), useDispatch (ref), useState (ref), useNavigation (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledModule (ref), useEffect (ref), useSelector (ref), getDeepValueModule (ref), conversationModule (ref), appChatNetworkingModule (ref), useUserProfilesFetch (ref), userProfilesCombinedNameAndUsernameByUserIds (ref), useTelemetryModule (ref), chatDetailsTelemetryLayerModule (ref), fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule (ref), selectChatUserEntryModelListModule (ref), getConversationTitleModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), promiseModule (ref), genericDialogTypeModule (ref), chatDetailsTelemetryEventsModule (ref), useCallback (ref), chatConversationTelemetryStateModule (ref), chatDetailsTelemetryStateModule (ref), useEffectOnMount (ref), chatDetailsPageModule (ref), participantDialogContainerModule (ref)
	local var27 = cryoModule.Dictionary.join(t, p0 or {})
	local var28 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var29 = useStyle()
	local var30 = useLocalization({
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
	local var31 = reactModule.useContext(luaAppNavigationContextModule)
	local var32 = useDispatch()
	local var33, var34 = useState(false)
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	
	if var28 then
		local var39, var40 = useState(nil)
		var35 = var39
		var36 = var40
		local var41, var42 = useState(nil)
		var37 = var41
		var38 = var42
	end
	local var43 = useNavigation()
	local var44 = useIsGroupChatEnabledModule()
	local var45 = useIsChatEnabledModule()
	useEffect(function() --[[ line: 123 ]]
		-- upvalues: var45 (ref), var27 (ref)
		if not var45 then
			var27.navigateToChatLanding()
		end
	end, { var45, var27.navigateToChatLanding })
	local var46 = useSelector(function(p1) --[[ line: 129 ]]
		-- upvalues: getDeepValueModule (copy), var27 (ref), conversationModule (copy)
		return getDeepValueModule(p1, `ChatAppReducer.Conversations.{var27.conversationId or ""}`) or conversationModule.empty()
	end)
	local var47 = useSelector(function(p2) --[[ line: 133 ]]
		-- upvalues: getDeepValueModule (copy), var27 (ref)
		return getDeepValueModule(p2, `ChatAppReducer.ParticipantMetadata.{var27.conversationId or ""}`)
	end)
	local source = var46 and var46.source
	useEffect(function() --[[ line: 138 ]]
		-- upvalues: source (ref), var32 (ref), appChatNetworkingModule (copy), var27 (ref)
		if source == "channels" then
			var32(appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ var27.conversationId })):catch(function() --[[ line: 144 ]]
				warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, { var27.conversationId, var27.participants, source })
	local var49 = useUserProfilesFetch({
		userIds = var46.participants,
		query = userProfilesCombinedNameAndUsernameByUserIds
	})
	local var50 = useTelemetryModule(chatDetailsTelemetryLayerModule.Context)
	local var51 = nil
	local var52 = nil
	local var53 = nil
	local titleNotSetText = nil
	local var54 = nil
	local var55 = nil
	local var56 = nil
	
	if var46 then
		var51 = useSelector(function(p3) --[[ line: 163 ]]
			-- upvalues: fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule (copy), selectChatUserEntryModelListModule (copy), var46 (ref), var49 (ref)
			return if fFlagAppChatAlwaysDisplayUserCardsInChatDetailsModule then selectChatUserEntryModelListModule(p3, var46.participants, if var49 and var49.data then var49.data.userProfiles else nil) elseif var49.data then selectChatUserEntryModelListModule(p3, var46.participants, var49.data.userProfiles) else {}
		end)
		var53 = var46.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		var52 = useSelector(function(p4) --[[ line: 183 ]]
			-- upvalues: var53 (write), var46 (ref)
			return var53 and var46.initiator == p4.LocalUserId
		end)
		titleNotSetText = getConversationTitleModule(var46)
		
		if var47 then
			for i, v in var51 do
				var51[i] = cryoModule.Dictionary.join(v, { metadata = var47[i] })
			end
		end
		var55 = useIsUserPendingModule(var46)
		var54 = var53 and var55
		
		if var54 then
			var44 = false
		end
		var56 = var46.moderationType == conversationChannelsModule.ModerationType.TrustedComms
	end
	local var57 = if var51 then #var51 else 0
	local var58 = if var56 then var30.enabledText else var30.disabledText
	
	if var46.isDefaultTitle then
		titleNotSetText = var30.titleNotSetText
	end
	local _ = function(p5) --[[ line: 210 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.new(function(p6, p7) --[[ line: 211 ]]
			-- upvalues: p5 (ref)
			if #p5.participants > 5 then
				p7()
				
				return
			end
			p6()
		end)
	end
	
	local var59 = function() --[[ line: 221 ]]
		-- upvalues: var27 (ref), genericDialogTypeModule (copy)
		var27.navigateToDialog(genericDialogTypeModule.EditChatGroupNameDialog, { conversationId = var27.conversationId })
	end
	
	local var60 = function() --[[ line: 226 ]]
		-- upvalues: var27 (ref), genericDialogTypeModule (copy), var50 (ref), chatDetailsTelemetryEventsModule (copy)
		var27.navigateToDialog(genericDialogTypeModule.LeaveGroupDialog, { conversationId = var27.conversationId })
		var50.emit(chatDetailsTelemetryEventsModule.ChatDetailsLeaveGroupBtnClicked, {})
	end
	
	local var61 = useCallback(function() --[[ line: 232 ]]
		-- upvalues: var43 (ref), var31 (ref)
		if var43 then
			var31.navigateToUnfilteredThreadsLearnMore(var43.navigate)
			
			return
		end
		var31.navigateToUnfilteredThreadsLearnMore()
	end, { var31, var43 })
	local var62 = useCallback(function() --[[ line: 240 ]]
		-- upvalues: var50 (ref), chatDetailsTelemetryEventsModule (copy), var34 (ref), var32 (ref), appChatNetworkingModule (copy), var27 (ref), var30 (ref)
		var50.emit(chatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellClicked, {})
		var34(true)
		var32(appChatNetworkingModule.rodux.DuplicateConversation.API(var27.conversationId, "trusted_comms")):andThen(function(p8) --[[ line: 244 ]]
			-- upvalues: var27 (copy), var30 (copy)
			local responseBody = p8.responseBody
			local id = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))
			
			if id then
				var27.navigateToConversation(id)
				
				return
			end
			var27.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var30.networkErrorToastText }
				}
			})
		end):catch(function() --[[ line: 262 ]]
			-- upvalues: var27 (copy), var30 (copy)
			var27.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = var30.networkErrorToastText }
				}
			})
		end):finally(function() --[[ line: 271 ]]
			-- upvalues: var34 (copy)
			var34(false)
		end)
	end, {
		var32, var34, var27.navigateToToast, var27.navigateToConversation,
		var27.conversationId, var57, var52, var50
	})
	
	local var63 = function() --[[ line: 287 ]]
		-- upvalues: var36 (write), var38 (write)
		if var36 and var38 then
			var36(nil)
			var38(nil)
		end
	end
	
	local var64 = function(p9, p10) --[[ line: 294 ]]
		-- upvalues: var28 (ref), var36 (write), var38 (write), var35 (write), var27 (ref), genericDialogTypeModule (copy), var55 (write), var53 (write), var52 (write)
		local var73 = tostring(p9)
		
		if not var28 or not var36 or not var38 then
			var27.navigateToDialog(genericDialogTypeModule.ParticipantDialog, {
				conversationId = var27.conversationId,
				participantId = var73,
				showRemoveUserButton = not var55 and (var53 and var52)
			})
			
			return
		elseif var35 == var73 then
			if var36 and var38 then
				var36(nil)
				var38(nil)
				
				return
			end
		else
			var36(var73)
			var38(p10)
		end
	end
	
	local var65 = function(p11) --[[ line: 314 ]]
		-- upvalues: var27 (ref)
		var27.navigateToToast({ toastProps = { toastContent = { toastTitle = p11 } } })
	end
	
	local var66 = function(p12) --[[ line: 324 ]]
		-- upvalues: var46 (ref), promiseModule (copy), var27 (ref), var65 (ref), var50 (ref), chatDetailsTelemetryEventsModule (copy)
		promiseModule.new(function(p13, p14) --[[ line: 211 ]]
			-- upvalues: var46 (ref)
			if #var46.participants > 5 then
				p14()
				
				return
			end
			p13()
		end):andThen(function() --[[ line: 325 ]]
			-- upvalues: var27 (copy), var46 (copy)
			var27.navigateToEditChatMembers(var46)
		end, function() --[[ line: 328 ]]
			-- upvalues: var65 (copy), p12 (ref)
			var65(p12)
		end)
		var50.emit(chatDetailsTelemetryEventsModule.ChatDetailsAddFriendsBtnClicked, {})
	end
	
	local var67 = if var46 then var46.moderationType else cryoModule.None
	local var68 = if var46 then var46.userPendingStatus else cryoModule.None
	local var69 = chatConversationTelemetryStateModule.useMergeState()
	useEffect(function() --[[ line: 338 ]]
		-- upvalues: var69 (ref), var27 (ref), var67 (ref), var68 (ref)
		var69({
			conversationId = var27.conversationId,
			moderationType = var67,
			userPendingStatus = var68
		})
	end, { var27.conversationId, var67, var68 })
	local var70 = chatDetailsTelemetryStateModule.useMergeState()
	useEffect(function() --[[ line: 346 ]]
		-- upvalues: var70 (ref), var46 (ref), var52 (write)
		var70({
			participantsCount = #var46.participants,
			isGroupOwner = var52
		})
	end, { #var46.participants, var52 })
	useEffectOnMount(function() --[[ line: 353 ]]
		-- upvalues: var50 (ref), chatDetailsTelemetryEventsModule (copy), var53 (write)
		var50.emit(chatDetailsTelemetryEventsModule.ScreenRendered, { isGroupConversation = var53 })
	end)
	local var71 = cryoModule.Dictionary.join({
		shouldShowCreateUnfilteredChat = false,
		LayoutOrder = 2,
		navigateBack = var27.navigateBack,
		onGroupNameEntryCellActivated = var59,
		onLeaveGroupCellActivated = var60,
		onParticipantCellActivated = var64,
		onAddFriendsCellActivated = function() --[[ line: 364 ]]
			-- upvalues: var66 (ref), var30 (ref)
			return var66(var30.tooManyPeopleText)
		end,
		onConversationTypeIconActivated = var61,
		onCreateUnfilteredChatCellActivated = var62,
		conversationTitle = titleNotSetText,
		conversation = var46,
		conversationId = var27.conversationId,
		participants = var51,
		isGroupConversation = var53,
		wideMode = var27.wideMode,
		shouldHideGroupChatFunctionality = var54,
		shouldShowAddFriends = var44,
		conversationTypeText = var58,
		isCreateUnfilteredChatLoading = var33,
		topBarHeight = var27.topBarHeight,
		style = var29
	}, var30)
	
	if var28 then
		var71.activeParticipantId = var35
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
			Content = reactModule.createElement(chatDetailsPageModule, var71)
		}),
		ParticipantDialog = if var28 and var35 ~= nil then reactModule.createElement(participantDialogContainerModule, {
			anchorRef = var37,
			conversationId = var27.conversationId,
			isWideMode = var27.wideMode,
			navigateToDialog = var27.navigateToDialog,
			onDismiss = var63,
			participantId = var35,
			showRemoveUserButton = not var55 and (var53 and var52)
		}) else nil
	})
end
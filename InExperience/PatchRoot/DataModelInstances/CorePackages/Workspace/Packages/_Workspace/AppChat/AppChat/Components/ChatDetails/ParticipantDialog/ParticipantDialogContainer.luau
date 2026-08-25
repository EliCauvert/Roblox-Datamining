local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local backHandlerContextModule = require(appChat.Contexts.BackHandlerContext)
local enumScreensModule = require(appChat.EnumScreens)
local _ = require(appChat.types)
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsExternalNavigationAvailableModule = require(appChat.Hooks.useIsExternalNavigationAvailable)
local conversationModule = require(appChat.Models.Conversation)
local cryoModule = require(parent.Cryo)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local useGetFriendshipStatus = require(parent.FriendsHydrationReact).useGetFriendshipStatus
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigation = require(parent.Navigation).useNavigation
local socialCommonModule = require(parent.SocialCommon)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local networkingFriendsModule = require(appChat.Http.NetworkingFriends)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local fFlagDisableBlockAndReport = sharedFlagsModule.FFlagDisableBlockAndReport
local fFlagFriendsChatPlaceholderRenameFix = sharedFlagsModule.FFlagFriendsChatPlaceholderRenameFix
local fFlagAppChatParticipantDialogGamepadFocusModule = require(appChat.Flags.FFlagAppChatParticipantDialogGamepadFocus)
local fFlagEnableChatDetailsOpenChatModule = require(appChat.Flags.FFlagEnableChatDetailsOpenChat)
local fFlagAppChatEnableTrustedFriendEntryPointModule = require(appChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local fFlagAppChatConsolidateTrustedFriendsModalModule = require(appChat.Flags.FFlagAppChatConsolidateTrustedFriendsModal)
local fFlagAppChatTrustedFriendEntryPointAnalyticsModule = require(appChat.Flags.FFlagAppChatTrustedFriendEntryPointAnalytics)
local fFlagAppChatMigrateFriendshipStatusesModule = require(appChat.Flags.FFlagAppChatMigrateFriendshipStatuses)
local memo = reactModule.memo
local genericDialogTypeModule = require(script.Parent.Parent.Dialogs.GenericDialogType)
local chatDetailsTelemetryEventsModule = require(appChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local chatDialogTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local participantDialogModule = require(script.Parent.ParticipantDialog)
local playerContextualMenuWrapperModule = require(script.Parent.PlayerContextualMenuWrapper)
local useTrustedFriendActionModule = require(script.Parent.useTrustedFriendAction)
local connectAnalyticsModule = require(appChat.LegacyAnalytics.connectAnalytics)
local roactChatAnalyticsModule = require(appChat.LegacyAnalytics.RoactChatAnalytics)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrorsModule = require(appChat.Conversations.Thunks.parseCreateConversationErrors)
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local enteredChatFromEntryPoint = require(appChat.Actions).EnteredChatFromEntryPoint
local loggerModule = require(script.Parent.Logger)
local sources = socialLuaAnalyticsModule.Analytics.Enums.Sources
local t = { skipFetch = true }
local t_1 = {
	conversationId = nil,
	participantId = nil,
	anchorRef = nil,
	showRemoveUserButton = false,
	isWideMode = false,
	viewProfileText = "Feature.Chat.Label.ViewProfile",
	chatText = "CommonUI.Features.Label.Chat",
	reportUserText = "Feature.Chat.Action.ReportUser",
	removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
	openBlockingModal = nil,
	analytics = nil,
	navigateToDialog = function() end,
	onDismiss = function() end
}

function ParticipantDialogContainer(p0)
	-- upvalues: cryoModule (ref), t_1 (ref), reactModule (ref), backHandlerContextModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useNavigation (ref), useDispatch (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), t (ref), networkingFriendsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), useTrustedFriendActionModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), loggerModule (ref), genericDialogTypeModule (ref), roactChatAnalyticsModule (ref), chatDetailsTelemetryEventsModule (ref), notificationModalsManagerModule (ref), sources (ref), fFlagAppChatConsolidateTrustedFriendsModalModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogModule (ref)
	local var35 = cryoModule.Dictionary.join(t_1, p0)
	local var36 = reactModule.useContext(backHandlerContextModule)
	local var37 = reactModule.useRef(var35.onDismiss)
	var37.current = var35.onDismiss
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), var36 (ref), var37 (ref)
		if fFlagAppChatParticipantDialogGamepadFocusModule then
			return var36(function()
				-- upvalues: var37 (copy)
				var37.current()
			end)
		end
	end, { var36 })
	local var38 = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then useTelemetryModule(chatDialogTelemetryLayerModule.Context) else nil
	local var39 = useNavigation()
	local var40 = useDispatch()
	local navigateToDialog = var35.navigateToDialog or function() end
	local var42 = useAppPolicyModule(function(p1)
		return p1.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local var43 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var45
		local var44 = useSelector(function(p2)
			-- upvalues: var35 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var35.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		
		if fFlagAppChatMigrateFriendshipStatusesModule then
			local _ = useGetFriendshipStatus(var35.participantId, if var44 then nil else t) == Enum.FriendStatus.Friend
		else
			var45 = useSelector(function(p3)
				-- upvalues: var35 (ref)
				local friends = p3.ChatAppReducer and p3.ChatAppReducer.Friends
				local friendshipStatus = friends and friends.friendshipStatus
				
				return friendshipStatus and friendshipStatus[var35.participantId] == Enum.FriendStatus.Friend
			end)
			reactModule.useEffect(function()
				-- upvalues: var44 (write), var40 (ref), networkingFriendsModule (copy), var35 (ref)
				if var44 then
					var40(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var35.participantId }))
				end
			end, { var35.participantId, var40, var44 })
		end
		var43 = if var44 and var45 then true else false
	end
	local var46 = useLocalization({
		viewProfileText = var35.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var35.chatText else nil,
		reportUserText = var35.reportUserText,
		removeFromGroupText = var35.removeFromGroupText,
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else "",
		networkErrorText = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Toast.NetworkingError.SomethingIsWrong" else ""
	})
	local viewUserProfile = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile]
	local var47 = if fFlagAppChatEnableTrustedFriendEntryPointModule then useTrustedFriendActionModule(var35.participantId) else nil
	local var48 = if var47 then var47.action else nil
	local var49 = if var47 then var47.refetch else function() end
	local var50 = viewUserProfile and var48 ~= nil
	local var51 = if var48 ~= nil then false else var48.isDisabled
	local var52 = if var47 ~= nil then nil else var47.actionText
	local var53 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var35 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4)
					-- upvalues: var35 (copy)
					var35.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { var35.onDismiss })
	local var54 = reactModule.useCallback(function(p5, p6)
		-- upvalues: loggerModule (copy), var35 (ref), navigateToDialog (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p5, p6)
		var35.onDismiss()
		navigateToDialog(genericDialogTypeModule.RemoveUserDialog, { conversationId = p6, participantId = p5 })
	end, { var35.onDismiss, navigateToDialog })
	local var55 = reactModule.useCallback(function(p7, p8)
		-- upvalues: var35 (ref), var39 (ref), enumScreensModule (copy)
		var35.onDismiss()
		var39.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p7, conversationId = p8 })
	end, { var39, var35.onDismiss })
	
	return if viewUserProfile then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var53,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogModule, cryoModule.Dictionary.join(var35, var46, {
			showViewProfileButton = var42,
			showChatButton = var43,
			showTrustedFriendButton = var50,
			trustedFriendText = var52,
			isTrustedFriendButtonDisabled = var51,
			openViewProfile = reactModule.useCallback(function(p11)
				-- upvalues: var39 (ref), enumScreensModule (copy), loggerModule (copy), var35 (ref), roactChatAnalyticsModule (copy)
				local viewUserProfile = var39.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
				
				if not viewUserProfile then
					loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
					
					return
				end
				loggerModule:info("Navigate To UserProfile from {screen}")
				
				if var35.analytics then
					var35.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
				end
				var35.onDismiss()
				viewUserProfile(p11, {})
			end, { var39, var35.analytics, var35.onDismiss }),
			openTrustedFriend = reactModule.useCallback(function()
				-- upvalues: var48 (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (copy), var38 (write), chatDetailsTelemetryEventsModule (copy), var35 (ref), var40 (ref), networkingFriendsModule (copy), var49 (ref), notificationModalsManagerModule (copy), var47 (write), loggerModule (copy), sources (copy), fFlagAppChatConsolidateTrustedFriendsModalModule (copy), var39 (ref), enumScreensModule (copy)
				if var48 == nil then return end
				if var48.actionType == "RemoveTrustedConnection" then
					if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var38 then
						var38.emit(chatDetailsTelemetryEventsModule.ParticipantDialogRemoveTrustedConnectionClicked, {})
					end
					var35.onDismiss()
					var40(networkingFriendsModule.RemoveTC.API(var35.participantId)):andThen(function()
						-- upvalues: var49 (copy), notificationModalsManagerModule (copy), var47 (copy)
						var49()
						notificationModalsManagerModule.SetUIBloxToast({
							sequenceNumber = DateTime.now().UnixTimestamp,
							toastTitle = if var47 then var47.toastText else nil
						})
					end):catch(function(p12)
						-- upvalues: loggerModule (copy), var35 (copy)
						loggerModule:warning("Error removing trusted connection for userId {}: {}", var35.participantId, tostring(p12))
					end)
					
					return
				else
					local modalVariantOverride = var48.modalVariantOverride
					
					if var48.actionType == "AddIncomingTrustedConnection" then
						if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var38 then
							var38.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddIncomingTrustedConnectionClicked, {})
						end
					elseif fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var38 then
						var38.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddTrustedConnectionClicked, { modalVariantOverride = modalVariantOverride })
					end
					var35.onDismiss()
					
					if var48.actionType == "AddIncomingTrustedConnection" then
						local t = {
							userId = var35.participantId,
							source = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then sources.ChatDetails else nil,
							onRequestAccepted = var49
						}
						
						if fFlagAppChatConsolidateTrustedFriendsModalModule then
							var39.navigate(enumScreensModule.TrustedConnectionsUpsell, t)
							
							return
						end
						var39.navigate(enumScreensModule.AppChatTrustedContactsModal, { props = t })
						
						return
					else
						local t = {
							userId = var35.participantId,
							source = sources.ChatDetails,
							modalVariantOverride = modalVariantOverride,
							onRequestSent = var49
						}
						
						if fFlagAppChatConsolidateTrustedFriendsModalModule then
							var39.navigate(enumScreensModule.TrustedConnectionsUpsell, t)
							
							return
						end
						var39.navigate(enumScreensModule.AppChatTrustedContactsModal, { props = t })
					end
				end
			end, {
				var48, var47, var35.participantId, var35.onDismiss, var40, var49, var39,
				if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then var38 else nil
			}),
			openChat = if fFlagEnableChatDetailsOpenChatModule then reactModule.useCallback(function(p13)
				-- upvalues: loggerModule (copy), var40 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var35 (ref), createConversationModule (copy), var39 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var46 (ref)
				loggerModule:info("User activated openChat | userId: {}", p13)
				var40(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
				var35.onDismiss()
				var40(createConversationModule("one_to_one", { tostring(p13) })):andThen(function(p15)
					-- upvalues: var39 (copy), enumScreensModule (copy)
					var39.navigate(enumScreensModule.ChatConversation, { conversationId = p15.id })
				end):catch(function(p14)
					-- upvalues: loggerModule (copy), p13 (ref), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var46 (copy), var39 (copy), enumScreensModule (copy)
					loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p13, tostring(p14))
					var39.navigate(enumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = if parseCreateConversationErrorsModule(p14) == "participant_chat_disabled" then if fFlagFriendsChatPlaceholderRenameFix then var46.chatUnavailableWithUser else "Feature.Chat.Message.PartyUnavailableWithUser" elseif fFlagFriendsChatPlaceholderRenameFix then var46.networkErrorText else "Feature.Toast.NetworkingError.SomethingIsWrong"
							}
						}
					})
				end)
			end, {
				var40,
				var39,
				var35.onDismiss,
				if fFlagFriendsChatPlaceholderRenameFix then var46 else nil
			}) else nil,
			openReportUser = var55,
			openRemoveUserDialog = var54
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var53,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var35.conversationId,
			participantId = var35.participantId,
			onDismiss = var35.onDismiss,
			openRemoveUserDialog = var54,
			removeFromGroupText = var46.removeFromGroupText,
			openReportUser = var55,
			showRemoveUserButton = var35.showRemoveUserButton,
			openBlockingModal = if var35.openBlockingModal then var35.openBlockingModal else reactModule.useCallback(function(p9, p10)
				-- upvalues: var39 (ref), enumScreensModule (copy), var35 (ref), fFlagDisableBlockAndReport (copy)
				local var60 = function()
					-- upvalues: var39 (copy), enumScreensModule (copy), p9 (ref), p10 (ref)
					var39.pop()
					var39.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p9, conversationId = p10 })
				end
				
				var35.onDismiss()
				var39.navigate(enumScreensModule.BlockingModal, {
					navProps = {
						userId = p9,
						openReportUser = var60,
						disableReportOption = fFlagDisableBlockAndReport
					}
				})
			end, { var39, var35.onDismiss })
		})
	})
end

ParticipantDialogContainer = connectAnalyticsModule(function(p16)
	return { analytics = p16 }
end)(ParticipantDialogContainer)

return memo(ParticipantDialogContainer)
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
	navigateToDialog = function() --[[ line: 91 ]] end,
	onDismiss = function() --[[ line: 98 ]] end
}

function ParticipantDialogContainer(p0) --[[ line: 104 ]]
	-- upvalues: cryoModule (ref), t_1 (ref), reactModule (ref), backHandlerContextModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useNavigation (ref), useDispatch (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), t (ref), networkingFriendsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), useTrustedFriendActionModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), loggerModule (ref), genericDialogTypeModule (ref), roactChatAnalyticsModule (ref), chatDetailsTelemetryEventsModule (ref), notificationModalsManagerModule (ref), sources (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogModule (ref)
	local var34 = cryoModule.Dictionary.join(t_1, p0)
	local var35 = reactModule.useContext(backHandlerContextModule)
	local var36 = reactModule.useRef(var34.onDismiss)
	var36.current = var34.onDismiss
	reactModule.useLayoutEffect(function() --[[ line: 109 ]]
		-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), var35 (ref), var36 (ref)
		if fFlagAppChatParticipantDialogGamepadFocusModule then
			return var35(function() --[[ line: 114 ]]
				-- upvalues: var36 (copy)
				var36.current()
			end)
		end
	end, { var35 })
	local var37 = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then useTelemetryModule(chatDialogTelemetryLayerModule.Context) else nil
	local var38 = useNavigation()
	local var39 = useDispatch()
	local navigateToDialog = var34.navigateToDialog or function() --[[ line: 126 ]] end
	local var41 = useAppPolicyModule(function(p1) --[[ line: 128 ]]
		return p1.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local var42 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var44
		local var43 = useSelector(function(p2) --[[ line: 137 ]]
			-- upvalues: var34 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var34.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		
		if fFlagAppChatMigrateFriendshipStatusesModule then
			local _ = useGetFriendshipStatus(var34.participantId, if var43 then nil else t) == Enum.FriendStatus.Friend
		else
			var44 = useSelector(function(p3) --[[ line: 150 ]]
				-- upvalues: var34 (ref)
				local friends = p3.ChatAppReducer and p3.ChatAppReducer.Friends
				local friendshipStatus = friends and friends.friendshipStatus
				
				return friendshipStatus and friendshipStatus[var34.participantId] == Enum.FriendStatus.Friend
			end)
			reactModule.useEffect(function() --[[ line: 156 ]]
				-- upvalues: var43 (write), var39 (ref), networkingFriendsModule (copy), var34 (ref)
				if var43 then
					var39(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var34.participantId }))
				end
			end, { var34.participantId, var39, var43 })
		end
		var42 = if var43 and var44 then true else false
	end
	local var45 = useLocalization({
		viewProfileText = var34.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var34.chatText else nil,
		reportUserText = var34.reportUserText,
		removeFromGroupText = var34.removeFromGroupText,
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else "",
		networkErrorText = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Toast.NetworkingError.SomethingIsWrong" else ""
	})
	local viewUserProfile = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile]
	local var46 = if fFlagAppChatEnableTrustedFriendEntryPointModule then useTrustedFriendActionModule(var34.participantId) else nil
	local var47 = if var46 then var46.action else nil
	local var48 = if var46 then var46.refetch else function() --[[ line: 194 ]] end
	local var49 = viewUserProfile and var47 ~= nil
	local var50 = if var47 ~= nil then false else var47.isDisabled
	local var51 = if var46 ~= nil then nil else var46.actionText
	local var52 = reactModule.useMemo(function() --[[ line: 200 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var34 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4) --[[ line: 203 ]]
					-- upvalues: var34 (copy)
					var34.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { var34.onDismiss })
	local var53 = reactModule.useCallback(function(p5, p6) --[[ line: 211 ]]
		-- upvalues: loggerModule (copy), var34 (ref), navigateToDialog (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p5, p6)
		var34.onDismiss()
		navigateToDialog(genericDialogTypeModule.RemoveUserDialog, { conversationId = p6, participantId = p5 })
	end, { var34.onDismiss, navigateToDialog })
	local var54 = reactModule.useCallback(function(p7, p8) --[[ line: 347 ]]
		-- upvalues: var34 (ref), var38 (ref), enumScreensModule (copy)
		var34.onDismiss()
		var38.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p7, conversationId = p8 })
	end, { var38, var34.onDismiss })
	
	return if viewUserProfile then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var52,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogModule, cryoModule.Dictionary.join(var34, var45, {
			showViewProfileButton = var41,
			showChatButton = var42,
			showTrustedFriendButton = var49,
			trustedFriendText = var51,
			isTrustedFriendButtonDisabled = var50,
			openViewProfile = reactModule.useCallback(function(p11) --[[ line: 220 ]]
				-- upvalues: var38 (ref), enumScreensModule (copy), loggerModule (copy), var34 (ref), roactChatAnalyticsModule (copy)
				local viewUserProfile = var38.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
				
				if not viewUserProfile then
					loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
					
					return
				end
				loggerModule:info("Navigate To UserProfile from {screen}")
				
				if var34.analytics then
					var34.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
				end
				var34.onDismiss()
				viewUserProfile(p11, {})
			end, { var38, var34.analytics, var34.onDismiss }),
			openTrustedFriend = reactModule.useCallback(function() --[[ line: 237 ]]
				-- upvalues: var47 (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (copy), var37 (write), chatDetailsTelemetryEventsModule (copy), var34 (ref), var39 (ref), networkingFriendsModule (copy), var48 (ref), notificationModalsManagerModule (copy), var46 (write), loggerModule (copy), sources (copy), var38 (ref), enumScreensModule (copy)
				if var47 == nil then return end
				if var47.actionType == "RemoveTrustedConnection" then
					if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var37 then
						var37.emit(chatDetailsTelemetryEventsModule.ParticipantDialogRemoveTrustedConnectionClicked, {})
					end
					var34.onDismiss()
					var39(networkingFriendsModule.RemoveTC.API(var34.participantId)):andThen(function() --[[ line: 248 ]]
						-- upvalues: var48 (copy), notificationModalsManagerModule (copy), var46 (copy)
						var48()
						notificationModalsManagerModule.SetUIBloxToast({
							sequenceNumber = DateTime.now().UnixTimestamp,
							toastTitle = if var46 then var46.toastText else nil
						})
					end):catch(function(p12) --[[ line: 255 ]]
						-- upvalues: loggerModule (copy), var34 (copy)
						loggerModule:warning("Error removing trusted connection for userId {}: {}", var34.participantId, tostring(p12))
					end)
					
					return
				else
					local modalVariantOverride = var47.modalVariantOverride
					
					if var47.actionType == "AddIncomingTrustedConnection" then
						if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var37 then
							var37.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddIncomingTrustedConnectionClicked, {})
						end
					elseif fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var37 then
						var37.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddTrustedConnectionClicked, { modalVariantOverride = modalVariantOverride })
					end
					var34.onDismiss()
					
					if var47.actionType == "AddIncomingTrustedConnection" then
						var38.navigate(enumScreensModule.AppChatTrustedContactsModal, {
							props = {
								userId = var34.participantId,
								source = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then sources.ChatDetails else nil,
								onRequestAccepted = var48
							}
						})
						
						return
					end
					var38.navigate(enumScreensModule.AppChatTrustedContactsModal, {
						props = {
							userId = var34.participantId,
							source = sources.ChatDetails,
							modalVariantOverride = modalVariantOverride,
							onRequestSent = var48
						}
					})
				end
			end, {
				var47, var46, var34.participantId, var34.onDismiss, var39, var48, var38,
				if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then var37 else nil
			}),
			openChat = if fFlagEnableChatDetailsOpenChatModule then reactModule.useCallback(function(p13) --[[ line: 311 ]]
				-- upvalues: loggerModule (copy), var39 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var34 (ref), createConversationModule (copy), var38 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var45 (ref)
				loggerModule:info("User activated openChat | userId: {}", p13)
				var39(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
				var34.onDismiss()
				var39(createConversationModule("one_to_one", { tostring(p13) })):andThen(function(p15) --[[ line: 316 ]]
					-- upvalues: var38 (copy), enumScreensModule (copy)
					var38.navigate(enumScreensModule.ChatConversation, { conversationId = p15.id })
				end):catch(function(p14) --[[ line: 321 ]]
					-- upvalues: loggerModule (copy), p13 (ref), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var45 (copy), var38 (copy), enumScreensModule (copy)
					loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p13, tostring(p14))
					var38.navigate(enumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = if parseCreateConversationErrorsModule(p14) == "participant_chat_disabled" then if fFlagFriendsChatPlaceholderRenameFix then var45.chatUnavailableWithUser else "Feature.Chat.Message.PartyUnavailableWithUser" elseif fFlagFriendsChatPlaceholderRenameFix then var45.networkErrorText else "Feature.Toast.NetworkingError.SomethingIsWrong"
							}
						}
					})
				end)
			end, {
				var39,
				var38,
				var34.onDismiss,
				if fFlagFriendsChatPlaceholderRenameFix then var45 else nil
			}) else nil,
			openReportUser = var54,
			openRemoveUserDialog = var53
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var52,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var34.conversationId,
			participantId = var34.participantId,
			onDismiss = var34.onDismiss,
			openRemoveUserDialog = var53,
			removeFromGroupText = var45.removeFromGroupText,
			openReportUser = var54,
			showRemoveUserButton = var34.showRemoveUserButton,
			openBlockingModal = if var34.openBlockingModal then var34.openBlockingModal else reactModule.useCallback(function(p9, p10) --[[ line: 355 ]]
				-- upvalues: var38 (ref), enumScreensModule (copy), var34 (ref), fFlagDisableBlockAndReport (copy)
				local var59 = function() --[[ line: 356 ]]
					-- upvalues: var38 (copy), enumScreensModule (copy), p9 (ref), p10 (ref)
					var38.pop()
					var38.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p9, conversationId = p10 })
				end
				
				var34.onDismiss()
				var38.navigate(enumScreensModule.BlockingModal, {
					navProps = {
						userId = p9,
						openReportUser = var59,
						disableReportOption = fFlagDisableBlockAndReport
					}
				})
			end, { var38, var34.onDismiss })
		})
	})
end

ParticipantDialogContainer = connectAnalyticsModule(function(p16) --[[ line: 420 ]]
	return { analytics = p16 }
end)(ParticipantDialogContainer)

return memo(ParticipantDialogContainer)
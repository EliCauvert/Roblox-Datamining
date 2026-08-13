local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
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
	navigateToDialog = function() --[[ line: 89 ]] end,
	onDismiss = function() --[[ line: 96 ]] end
}

function ParticipantDialogContainer(p0) --[[ line: 102 ]]
	-- upvalues: cryoModule (ref), t_1 (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useNavigation (ref), useDispatch (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), t (ref), reactModule (ref), networkingFriendsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), useTrustedFriendActionModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), loggerModule (ref), genericDialogTypeModule (ref), roactChatAnalyticsModule (ref), chatDetailsTelemetryEventsModule (ref), notificationModalsManagerModule (ref), sources (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogModule (ref)
	local var32 = cryoModule.Dictionary.join(t_1, p0)
	local var33 = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then useTelemetryModule(chatDialogTelemetryLayerModule.Context) else nil
	local var34 = useNavigation()
	local var35 = useDispatch()
	local navigateToDialog = var32.navigateToDialog or function() --[[ line: 111 ]] end
	local var37 = useAppPolicyModule(function(p1) --[[ line: 113 ]]
		return p1.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local var38 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var40
		local var39 = useSelector(function(p2) --[[ line: 122 ]]
			-- upvalues: var32 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var32.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		
		if fFlagAppChatMigrateFriendshipStatusesModule then
			local _ = useGetFriendshipStatus(var32.participantId, if var39 then nil else t) == Enum.FriendStatus.Friend
		else
			var40 = useSelector(function(p3) --[[ line: 135 ]]
				-- upvalues: var32 (ref)
				local friends = p3.ChatAppReducer and p3.ChatAppReducer.Friends
				local friendshipStatus = friends and friends.friendshipStatus
				
				return friendshipStatus and friendshipStatus[var32.participantId] == Enum.FriendStatus.Friend
			end)
			reactModule.useEffect(function() --[[ line: 141 ]]
				-- upvalues: var39 (write), var35 (ref), networkingFriendsModule (copy), var32 (ref)
				if var39 then
					var35(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var32.participantId }))
				end
			end, { var32.participantId, var35, var39 })
		end
		var38 = if var39 and var40 then true else false
	end
	local var41 = useLocalization({
		viewProfileText = var32.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var32.chatText else nil,
		reportUserText = var32.reportUserText,
		removeFromGroupText = var32.removeFromGroupText,
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else "",
		networkErrorText = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Toast.NetworkingError.SomethingIsWrong" else ""
	})
	local viewUserProfile = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile]
	local var42 = if fFlagAppChatEnableTrustedFriendEntryPointModule then useTrustedFriendActionModule(var32.participantId) else nil
	local var43 = if var42 then var42.action else nil
	local var44 = if var42 then var42.refetch else function() --[[ line: 179 ]] end
	local var45 = viewUserProfile and var43 ~= nil
	local var46 = if var43 ~= nil then false else var43.isDisabled
	local var47 = if var42 ~= nil then nil else var42.actionText
	local var48 = reactModule.useMemo(function() --[[ line: 185 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var32 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4) --[[ line: 188 ]]
					-- upvalues: var32 (copy)
					var32.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { var32.onDismiss })
	local var49 = reactModule.useCallback(function(p5, p6) --[[ line: 196 ]]
		-- upvalues: loggerModule (copy), var32 (ref), navigateToDialog (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p5, p6)
		var32.onDismiss()
		navigateToDialog(genericDialogTypeModule.RemoveUserDialog, { conversationId = p6, participantId = p5 })
	end, { var32.onDismiss, navigateToDialog })
	local var50 = reactModule.useCallback(function(p7, p8) --[[ line: 332 ]]
		-- upvalues: var32 (ref), var34 (ref), enumScreensModule (copy)
		var32.onDismiss()
		var34.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p7, conversationId = p8 })
	end, { var34, var32.onDismiss })
	
	return if viewUserProfile then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var48,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogModule, cryoModule.Dictionary.join(var32, var41, {
			showViewProfileButton = var37,
			showChatButton = var38,
			showTrustedFriendButton = var45,
			trustedFriendText = var47,
			isTrustedFriendButtonDisabled = var46,
			openViewProfile = reactModule.useCallback(function(p11) --[[ line: 205 ]]
				-- upvalues: var34 (ref), enumScreensModule (copy), loggerModule (copy), var32 (ref), roactChatAnalyticsModule (copy)
				local viewUserProfile = var34.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
				
				if not viewUserProfile then
					loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
					
					return
				end
				loggerModule:info("Navigate To UserProfile from {screen}")
				
				if var32.analytics then
					var32.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
				end
				var32.onDismiss()
				viewUserProfile(p11, {})
			end, { var34, var32.analytics, var32.onDismiss }),
			openTrustedFriend = reactModule.useCallback(function() --[[ line: 222 ]]
				-- upvalues: var43 (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (copy), var33 (write), chatDetailsTelemetryEventsModule (copy), var32 (ref), var35 (ref), networkingFriendsModule (copy), var44 (ref), notificationModalsManagerModule (copy), var42 (write), loggerModule (copy), sources (copy), var34 (ref), enumScreensModule (copy)
				if var43 == nil then return end
				if var43.actionType == "RemoveTrustedConnection" then
					if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var33 then
						var33.emit(chatDetailsTelemetryEventsModule.ParticipantDialogRemoveTrustedConnectionClicked, {})
					end
					var32.onDismiss()
					var35(networkingFriendsModule.RemoveTC.API(var32.participantId)):andThen(function() --[[ line: 233 ]]
						-- upvalues: var44 (copy), notificationModalsManagerModule (copy), var42 (copy)
						var44()
						notificationModalsManagerModule.SetUIBloxToast({
							sequenceNumber = DateTime.now().UnixTimestamp,
							toastTitle = if var42 then var42.toastText else nil
						})
					end):catch(function(p12) --[[ line: 240 ]]
						-- upvalues: loggerModule (copy), var32 (copy)
						loggerModule:warning("Error removing trusted connection for userId {}: {}", var32.participantId, tostring(p12))
					end)
					
					return
				else
					local modalVariantOverride = var43.modalVariantOverride
					
					if var43.actionType == "AddIncomingTrustedConnection" then
						if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var33 then
							var33.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddIncomingTrustedConnectionClicked, {})
						end
					elseif fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var33 then
						var33.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddTrustedConnectionClicked, { modalVariantOverride = modalVariantOverride })
					end
					var32.onDismiss()
					
					if var43.actionType == "AddIncomingTrustedConnection" then
						var34.navigate(enumScreensModule.AppChatTrustedContactsModal, {
							props = {
								userId = var32.participantId,
								source = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then sources.ChatDetails else nil,
								onRequestAccepted = var44
							}
						})
						
						return
					end
					var34.navigate(enumScreensModule.AppChatTrustedContactsModal, {
						props = {
							userId = var32.participantId,
							source = sources.ChatDetails,
							modalVariantOverride = modalVariantOverride,
							onRequestSent = var44
						}
					})
				end
			end, {
				var43, var42, var32.participantId, var32.onDismiss, var35, var44, var34,
				if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then var33 else nil
			}),
			openChat = if fFlagEnableChatDetailsOpenChatModule then reactModule.useCallback(function(p13) --[[ line: 296 ]]
				-- upvalues: loggerModule (copy), var35 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var32 (ref), createConversationModule (copy), var34 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var41 (ref)
				loggerModule:info("User activated openChat | userId: {}", p13)
				var35(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
				var32.onDismiss()
				var35(createConversationModule("one_to_one", { tostring(p13) })):andThen(function(p15) --[[ line: 301 ]]
					-- upvalues: var34 (copy), enumScreensModule (copy)
					var34.navigate(enumScreensModule.ChatConversation, { conversationId = p15.id })
				end):catch(function(p14) --[[ line: 306 ]]
					-- upvalues: loggerModule (copy), p13 (ref), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var41 (copy), var34 (copy), enumScreensModule (copy)
					loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p13, tostring(p14))
					var34.navigate(enumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = if parseCreateConversationErrorsModule(p14) == "participant_chat_disabled" then if fFlagFriendsChatPlaceholderRenameFix then var41.chatUnavailableWithUser else "Feature.Chat.Message.PartyUnavailableWithUser" elseif fFlagFriendsChatPlaceholderRenameFix then var41.networkErrorText else "Feature.Toast.NetworkingError.SomethingIsWrong"
							}
						}
					})
				end)
			end, {
				var35,
				var34,
				var32.onDismiss,
				if fFlagFriendsChatPlaceholderRenameFix then var41 else nil
			}) else nil,
			openReportUser = var50,
			openRemoveUserDialog = var49
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var48,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var32.conversationId,
			participantId = var32.participantId,
			onDismiss = var32.onDismiss,
			openRemoveUserDialog = var49,
			removeFromGroupText = var41.removeFromGroupText,
			openReportUser = var50,
			showRemoveUserButton = var32.showRemoveUserButton,
			openBlockingModal = if var32.openBlockingModal then var32.openBlockingModal else reactModule.useCallback(function(p9, p10) --[[ line: 340 ]]
				-- upvalues: var34 (ref), enumScreensModule (copy), var32 (ref), fFlagDisableBlockAndReport (copy)
				local var55 = function() --[[ line: 341 ]]
					-- upvalues: var34 (copy), enumScreensModule (copy), p9 (ref), p10 (ref)
					var34.pop()
					var34.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p9, conversationId = p10 })
				end
				
				var32.onDismiss()
				var34.navigate(enumScreensModule.BlockingModal, {
					navProps = {
						userId = p9,
						openReportUser = var55,
						disableReportOption = fFlagDisableBlockAndReport
					}
				})
			end, { var34, var32.onDismiss })
		})
	})
end

ParticipantDialogContainer = connectAnalyticsModule(function(p16) --[[ line: 405 ]]
	return { analytics = p16 }
end)(ParticipantDialogContainer)

return memo(ParticipantDialogContainer)
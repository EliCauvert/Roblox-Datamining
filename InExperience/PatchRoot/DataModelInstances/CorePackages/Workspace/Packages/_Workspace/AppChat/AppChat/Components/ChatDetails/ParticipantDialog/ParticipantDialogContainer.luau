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
local t = {
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
	navigateToDialog = function() --[[ line: 85 ]] end,
	onDismiss = function() --[[ line: 92 ]] end
}

function ParticipantDialogContainer(p0) --[[ line: 98 ]]
	-- upvalues: cryoModule (ref), t (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useNavigation (ref), useDispatch (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), reactModule (ref), networkingFriendsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), useTrustedFriendActionModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), loggerModule (ref), genericDialogTypeModule (ref), roactChatAnalyticsModule (ref), chatDetailsTelemetryEventsModule (ref), notificationModalsManagerModule (ref), sources (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogModule (ref)
	local var30 = cryoModule.Dictionary.join(t, p0)
	local var31 = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then useTelemetryModule(chatDialogTelemetryLayerModule.Context) else nil
	local var32 = useNavigation()
	local var33 = useDispatch()
	local navigateToDialog = var30.navigateToDialog or function() --[[ line: 107 ]] end
	local var35 = useAppPolicyModule(function(p1) --[[ line: 109 ]]
		return p1.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local var36 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var37 = useSelector(function(p2) --[[ line: 118 ]]
			-- upvalues: var30 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var30.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		local var38 = useSelector(function(p3) --[[ line: 124 ]]
			-- upvalues: var30 (ref)
			local friends = p3.ChatAppReducer and p3.ChatAppReducer.Friends
			local friendshipStatus = friends and friends.friendshipStatus
			
			return friendshipStatus and friendshipStatus[var30.participantId] == Enum.FriendStatus.Friend
		end)
		reactModule.useEffect(function() --[[ line: 130 ]]
			-- upvalues: var37 (write), var33 (ref), networkingFriendsModule (copy), var30 (ref)
			if var37 then
				var33(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var30.participantId }))
			end
		end, { var30.participantId, var33, var37 })
		var36 = if var37 and var38 then true else false
	end
	local var39 = useLocalization({
		viewProfileText = var30.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var30.chatText else nil,
		reportUserText = var30.reportUserText,
		removeFromGroupText = var30.removeFromGroupText,
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else "",
		networkErrorText = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Toast.NetworkingError.SomethingIsWrong" else ""
	})
	local viewUserProfile = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile]
	local var40 = if fFlagAppChatEnableTrustedFriendEntryPointModule then useTrustedFriendActionModule(var30.participantId) else nil
	local var41 = if var40 then var40.action else nil
	local var42 = if var40 then var40.refetch else function() --[[ line: 167 ]] end
	local var43 = viewUserProfile and var41 ~= nil
	local var44 = if var41 ~= nil then false else var41.isDisabled
	local var45 = if var40 ~= nil then nil else var40.actionText
	local var46 = reactModule.useMemo(function() --[[ line: 173 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var30 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4) --[[ line: 176 ]]
					-- upvalues: var30 (copy)
					var30.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { var30.onDismiss })
	local var47 = reactModule.useCallback(function(p5, p6) --[[ line: 184 ]]
		-- upvalues: loggerModule (copy), var30 (ref), navigateToDialog (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p5, p6)
		var30.onDismiss()
		navigateToDialog(genericDialogTypeModule.RemoveUserDialog, { conversationId = p6, participantId = p5 })
	end, { var30.onDismiss, navigateToDialog })
	local var48 = reactModule.useCallback(function(p7, p8) --[[ line: 320 ]]
		-- upvalues: var30 (ref), var32 (ref), enumScreensModule (copy)
		var30.onDismiss()
		var32.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p7, conversationId = p8 })
	end, { var32, var30.onDismiss })
	
	return if viewUserProfile then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var46,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogModule, cryoModule.Dictionary.join(var30, var39, {
			showViewProfileButton = var35,
			showChatButton = var36,
			showTrustedFriendButton = var43,
			trustedFriendText = var45,
			isTrustedFriendButtonDisabled = var44,
			openViewProfile = reactModule.useCallback(function(p11) --[[ line: 193 ]]
				-- upvalues: var32 (ref), enumScreensModule (copy), loggerModule (copy), var30 (ref), roactChatAnalyticsModule (copy)
				local viewUserProfile = var32.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
				
				if not viewUserProfile then
					loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
					
					return
				end
				loggerModule:info("Navigate To UserProfile from {screen}")
				
				if var30.analytics then
					var30.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
				end
				var30.onDismiss()
				viewUserProfile(p11, {})
			end, { var32, var30.analytics, var30.onDismiss }),
			openTrustedFriend = reactModule.useCallback(function() --[[ line: 210 ]]
				-- upvalues: var41 (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (copy), var31 (write), chatDetailsTelemetryEventsModule (copy), var30 (ref), var33 (ref), networkingFriendsModule (copy), var42 (ref), notificationModalsManagerModule (copy), var40 (write), loggerModule (copy), sources (copy), var32 (ref), enumScreensModule (copy)
				if var41 == nil then return end
				if var41.actionType == "RemoveTrustedConnection" then
					if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var31 then
						var31.emit(chatDetailsTelemetryEventsModule.ParticipantDialogRemoveTrustedConnectionClicked, {})
					end
					var30.onDismiss()
					var33(networkingFriendsModule.RemoveTC.API(var30.participantId)):andThen(function() --[[ line: 221 ]]
						-- upvalues: var42 (copy), notificationModalsManagerModule (copy), var40 (copy)
						var42()
						notificationModalsManagerModule.SetUIBloxToast({
							sequenceNumber = DateTime.now().UnixTimestamp,
							toastTitle = if var40 then var40.toastText else nil
						})
					end):catch(function(p12) --[[ line: 228 ]]
						-- upvalues: loggerModule (copy), var30 (copy)
						loggerModule:warning("Error removing trusted connection for userId {}: {}", var30.participantId, tostring(p12))
					end)
					
					return
				else
					local modalVariantOverride = var41.modalVariantOverride
					
					if var41.actionType == "AddIncomingTrustedConnection" then
						if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var31 then
							var31.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddIncomingTrustedConnectionClicked, {})
						end
					elseif fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var31 then
						var31.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddTrustedConnectionClicked, { modalVariantOverride = modalVariantOverride })
					end
					var30.onDismiss()
					
					if var41.actionType == "AddIncomingTrustedConnection" then
						var32.navigate(enumScreensModule.AppChatTrustedContactsModal, {
							props = {
								userId = var30.participantId,
								source = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then sources.ChatDetails else nil,
								onRequestAccepted = var42
							}
						})
						
						return
					end
					var32.navigate(enumScreensModule.AppChatTrustedContactsModal, {
						props = {
							userId = var30.participantId,
							source = sources.ChatDetails,
							modalVariantOverride = modalVariantOverride,
							onRequestSent = var42
						}
					})
				end
			end, {
				var41, var40, var30.participantId, var30.onDismiss, var33, var42, var32,
				if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then var31 else nil
			}),
			openChat = if fFlagEnableChatDetailsOpenChatModule then reactModule.useCallback(function(p13) --[[ line: 284 ]]
				-- upvalues: loggerModule (copy), var33 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var30 (ref), createConversationModule (copy), var32 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var39 (ref)
				loggerModule:info("User activated openChat | userId: {}", p13)
				var33(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
				var30.onDismiss()
				var33(createConversationModule("one_to_one", { tostring(p13) })):andThen(function(p15) --[[ line: 289 ]]
					-- upvalues: var32 (copy), enumScreensModule (copy)
					var32.navigate(enumScreensModule.ChatConversation, { conversationId = p15.id })
				end):catch(function(p14) --[[ line: 294 ]]
					-- upvalues: loggerModule (copy), p13 (ref), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var39 (copy), var32 (copy), enumScreensModule (copy)
					loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p13, tostring(p14))
					var32.navigate(enumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = if parseCreateConversationErrorsModule(p14) == "participant_chat_disabled" then if fFlagFriendsChatPlaceholderRenameFix then var39.chatUnavailableWithUser else "Feature.Chat.Message.PartyUnavailableWithUser" elseif fFlagFriendsChatPlaceholderRenameFix then var39.networkErrorText else "Feature.Toast.NetworkingError.SomethingIsWrong"
							}
						}
					})
				end)
			end, {
				var33,
				var32,
				var30.onDismiss,
				if fFlagFriendsChatPlaceholderRenameFix then var39 else nil
			}) else nil,
			openReportUser = var48,
			openRemoveUserDialog = var47
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var46,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var30.conversationId,
			participantId = var30.participantId,
			onDismiss = var30.onDismiss,
			openRemoveUserDialog = var47,
			removeFromGroupText = var39.removeFromGroupText,
			openReportUser = var48,
			showRemoveUserButton = var30.showRemoveUserButton,
			openBlockingModal = if var30.openBlockingModal then var30.openBlockingModal else reactModule.useCallback(function(p9, p10) --[[ line: 328 ]]
				-- upvalues: var32 (ref), enumScreensModule (copy), var30 (ref), fFlagDisableBlockAndReport (copy)
				local var53 = function() --[[ line: 329 ]]
					-- upvalues: var32 (copy), enumScreensModule (copy), p9 (ref), p10 (ref)
					var32.pop()
					var32.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p9, conversationId = p10 })
				end
				
				var30.onDismiss()
				var32.navigate(enumScreensModule.BlockingModal, {
					navProps = {
						userId = p9,
						openReportUser = var53,
						disableReportOption = fFlagDisableBlockAndReport
					}
				})
			end, { var32, var30.onDismiss })
		})
	})
end

ParticipantDialogContainer = connectAnalyticsModule(function(p16) --[[ line: 393 ]]
	return { analytics = p16 }
end)(ParticipantDialogContainer)

return memo(ParticipantDialogContainer)
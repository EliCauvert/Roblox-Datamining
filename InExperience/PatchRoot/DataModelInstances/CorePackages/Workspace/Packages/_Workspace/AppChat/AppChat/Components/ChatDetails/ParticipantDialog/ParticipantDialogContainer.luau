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

function ParticipantDialogContainer(p1)
	-- upvalues: cryoModule (ref), t_1 (ref), reactModule (ref), backHandlerContextModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (ref), useTelemetryModule (ref), chatDialogTelemetryLayerModule (ref), useNavigation (ref), useDispatch (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), t (ref), networkingFriendsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), fFlagAppChatEnableTrustedFriendEntryPointModule (ref), useTrustedFriendActionModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), loggerModule (ref), genericDialogTypeModule (ref), roactChatAnalyticsModule (ref), chatDetailsTelemetryEventsModule (ref), notificationModalsManagerModule (ref), sources (ref), fFlagAppChatConsolidateTrustedFriendsModalModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogModule (ref)
	local var1 = cryoModule.Dictionary.join(t_1, p1)
	local var2 = reactModule.useContext(backHandlerContextModule)
	local var3 = reactModule.useRef(var1.onDismiss)
	var3.current = var1.onDismiss
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagAppChatParticipantDialogGamepadFocusModule (copy), var2 (ref), var3 (ref)
		if fFlagAppChatParticipantDialogGamepadFocusModule then
			return var2(function()
				-- upvalues: var3 (copy)
				var3.current()
			end)
		end
	end, { var2 })
	local var4 = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then useTelemetryModule(chatDialogTelemetryLayerModule.Context) else nil
	local var5 = useNavigation()
	local var6 = useDispatch()
	local navigateToDialog = var1.navigateToDialog or function() end
	local var7 = useAppPolicyModule(function(p2)
		return p2.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local var8 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var9
		local var10 = useSelector(function(p2)
			-- upvalues: var1 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var1.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		
		if fFlagAppChatMigrateFriendshipStatusesModule then
			local _ = useGetFriendshipStatus(var1.participantId, if var10 then nil else t) == Enum.FriendStatus.Friend
		else
			var9 = useSelector(function(p2)
				-- upvalues: var1 (ref)
				local friends = p2.ChatAppReducer and p2.ChatAppReducer.Friends
				local friendshipStatus = friends and friends.friendshipStatus
				
				return friendshipStatus and friendshipStatus[var1.participantId] == Enum.FriendStatus.Friend
			end)
			reactModule.useEffect(function()
				-- upvalues: var10 (write), var6 (ref), networkingFriendsModule (copy), var1 (ref)
				if var10 then
					var6(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var1.participantId }))
				end
			end, { var1.participantId, var6, var10 })
		end
		var8 = if var10 and var9 then true else false
	end
	local var11 = useLocalization({
		viewProfileText = var1.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var1.chatText else nil,
		reportUserText = var1.reportUserText,
		removeFromGroupText = var1.removeFromGroupText,
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else nil,
		networkErrorText = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Toast.NetworkingError.SomethingIsWrong" else nil
	})
	local viewUserProfile = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile]
	local var12 = if fFlagAppChatEnableTrustedFriendEntryPointModule then useTrustedFriendActionModule(var1.participantId) else nil
	local var13 = if var12 then var12.action else nil
	local var14 = if var12 then var12.refetch else function() end
	local var15 = viewUserProfile and var13 ~= nil
	local var16 = if var13 ~= nil then false else var13.isDisabled
	local var17 = if var12 ~= nil then nil else var12.actionText
	local var18 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var1 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: var1 (copy)
					var1.onDismiss()
					p2:cancel()
				end)
			}
		}
	end, { var1.onDismiss })
	local var19 = reactModule.useCallback(function(p2, p3)
		-- upvalues: loggerModule (copy), var1 (ref), navigateToDialog (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p2, p3)
		var1.onDismiss()
		navigateToDialog(genericDialogTypeModule.RemoveUserDialog, { conversationId = p3, participantId = p2 })
	end, { var1.onDismiss, navigateToDialog })
	local var20 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), var5 (ref), enumScreensModule (copy)
		var1.onDismiss()
		var5.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p2, conversationId = p3 })
	end, { var5, var1.onDismiss })
	
	return if viewUserProfile then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var18,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogModule, cryoModule.Dictionary.join(var1, var11, {
			showViewProfileButton = var7,
			showChatButton = var8,
			showTrustedFriendButton = var15,
			trustedFriendText = var17,
			isTrustedFriendButtonDisabled = var16,
			openViewProfile = reactModule.useCallback(function(p2)
				-- upvalues: var5 (ref), enumScreensModule (copy), loggerModule (copy), var1 (ref), roactChatAnalyticsModule (copy)
				local viewUserProfile = var5.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
				
				if not viewUserProfile then
					loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
					
					return
				end
				loggerModule:info("Navigate To UserProfile from {screen}")
				
				if var1.analytics then
					var1.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
				end
				var1.onDismiss()
				viewUserProfile(p2, {})
			end, { var5, var1.analytics, var1.onDismiss }),
			openTrustedFriend = reactModule.useCallback(function()
				-- upvalues: var13 (ref), fFlagAppChatTrustedFriendEntryPointAnalyticsModule (copy), var4 (write), chatDetailsTelemetryEventsModule (copy), var1 (ref), var6 (ref), networkingFriendsModule (copy), var14 (ref), notificationModalsManagerModule (copy), var12 (write), loggerModule (copy), sources (copy), fFlagAppChatConsolidateTrustedFriendsModalModule (copy), var5 (ref), enumScreensModule (copy)
				if var13 == nil then return end
				if var13.actionType == "RemoveTrustedConnection" then
					if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var4 then
						var4.emit(chatDetailsTelemetryEventsModule.ParticipantDialogRemoveTrustedConnectionClicked, {})
					end
					var1.onDismiss()
					var6(networkingFriendsModule.RemoveTC.API(var1.participantId)):andThen(function()
						-- upvalues: var14 (copy), notificationModalsManagerModule (copy), var12 (copy)
						var14()
						notificationModalsManagerModule.SetUIBloxToast({
							sequenceNumber = DateTime.now().UnixTimestamp,
							toastTitle = if var12 then var12.toastText else nil
						})
					end):catch(function(p2)
						-- upvalues: loggerModule (copy), var1 (copy)
						loggerModule:warning("Error removing trusted connection for userId {}: {}", var1.participantId, tostring(p2))
					end)
					
					return
				else
					local modalVariantOverride = var13.modalVariantOverride
					
					if var13.actionType == "AddIncomingTrustedConnection" then
						if fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var4 then
							var4.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddIncomingTrustedConnectionClicked, {})
						end
					elseif fFlagAppChatTrustedFriendEntryPointAnalyticsModule and var4 then
						var4.emit(chatDetailsTelemetryEventsModule.ParticipantDialogAddTrustedConnectionClicked, { modalVariantOverride = modalVariantOverride })
					end
					var1.onDismiss()
					
					if var13.actionType == "AddIncomingTrustedConnection" then
						local t = {
							userId = var1.participantId,
							source = if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then sources.ChatDetails else nil,
							onRequestAccepted = var14
						}
						
						if fFlagAppChatConsolidateTrustedFriendsModalModule then
							var5.navigate(enumScreensModule.TrustedConnectionsUpsell, t)
							
							return
						end
						var5.navigate(enumScreensModule.AppChatTrustedContactsModal, { props = t })
						
						return
					else
						local t = {
							userId = var1.participantId,
							source = sources.ChatDetails,
							modalVariantOverride = modalVariantOverride,
							onRequestSent = var14
						}
						
						if fFlagAppChatConsolidateTrustedFriendsModalModule then
							var5.navigate(enumScreensModule.TrustedConnectionsUpsell, t)
							
							return
						end
						var5.navigate(enumScreensModule.AppChatTrustedContactsModal, { props = t })
					end
				end
			end, {
				var13, var12, var1.participantId, var1.onDismiss, var6, var14, var5,
				if fFlagAppChatTrustedFriendEntryPointAnalyticsModule then var4 else nil
			}),
			openChat = if fFlagEnableChatDetailsOpenChatModule then reactModule.useCallback(function(p2)
				-- upvalues: loggerModule (copy), var6 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), var1 (ref), createConversationModule (copy), var5 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var11 (ref)
				loggerModule:info("User activated openChat | userId: {}", p2)
				var6(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
				var1.onDismiss()
				var6(createConversationModule("one_to_one", { tostring(p2) })):andThen(function(p3)
					-- upvalues: var5 (copy), enumScreensModule (copy)
					var5.navigate(enumScreensModule.ChatConversation, { conversationId = p3.id })
				end):catch(function(p3)
					-- upvalues: loggerModule (copy), p2 (ref), parseCreateConversationErrorsModule (copy), fFlagFriendsChatPlaceholderRenameFix (copy), var11 (copy), var5 (copy), enumScreensModule (copy)
					loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p2, tostring(p3))
					var5.navigate(enumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = if parseCreateConversationErrorsModule(p3) == "participant_chat_disabled" then if fFlagFriendsChatPlaceholderRenameFix then var11.chatUnavailableWithUser else "Feature.Chat.Message.PartyUnavailableWithUser" elseif fFlagFriendsChatPlaceholderRenameFix then var11.networkErrorText else "Feature.Toast.NetworkingError.SomethingIsWrong"
							}
						}
					})
				end)
			end, {
				var6,
				var5,
				var1.onDismiss,
				if fFlagFriendsChatPlaceholderRenameFix then var11 else nil
			}) else nil,
			openReportUser = var20,
			openRemoveUserDialog = var19
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var18,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var1.conversationId,
			participantId = var1.participantId,
			onDismiss = var1.onDismiss,
			openRemoveUserDialog = var19,
			removeFromGroupText = var11.removeFromGroupText,
			openReportUser = var20,
			showRemoveUserButton = var1.showRemoveUserButton,
			openBlockingModal = if var1.openBlockingModal then var1.openBlockingModal else reactModule.useCallback(function(p2, p3)
				-- upvalues: var5 (ref), enumScreensModule (copy), var1 (ref), fFlagDisableBlockAndReport (copy)
				local var21 = function()
					-- upvalues: var5 (copy), enumScreensModule (copy), p2 (ref), p3 (ref)
					var5.pop()
					var5.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p2, conversationId = p3 })
				end
				
				var1.onDismiss()
				var5.navigate(enumScreensModule.BlockingModal, {
					navProps = {
						userId = p2,
						openReportUser = var21,
						disableReportOption = fFlagDisableBlockAndReport
					}
				})
			end, { var5, var1.onDismiss })
		})
	})
end

ParticipantDialogContainer = connectAnalyticsModule(function(p1)
	return { analytics = p1 }
end)(ParticipantDialogContainer)

return memo(ParticipantDialogContainer)
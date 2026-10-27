local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local BackHandlerContextModule = require(AppChat.Contexts.BackHandlerContext)
local EnumScreensModule = require(AppChat.EnumScreens)
local _ = require(AppChat.types)
local UseAppPolicyModule = require(AppChat.Hooks.useAppPolicy)
local UseIsExternalNavigationAvailableModule = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local ConversationModule = require(AppChat.Models.Conversation)
local CryoModule = require(Parent.Cryo)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local UseGetFriendshipStatusFunction = require(Parent.FriendsHydrationReact).useGetFriendshipStatus
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local NetworkingFriendsModule = require(AppChat.Http.NetworkingFriends)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FFlagDisableBlockAndReport = require(Parent.SharedFlags).FFlagDisableBlockAndReport
local FFlagAppChatMigrateFriendshipStatusesModule = require(AppChat.Flags.FFlagAppChatMigrateFriendshipStatuses)
local MemoFunction = ReactModule.memo
local GenericDialogTypeModule = require(script.Parent.Parent.Dialogs.GenericDialogType)
local ParticipantDialogModule = require(script.Parent.ParticipantDialog)
local PlayerContextualMenuWrapperModule = require(script.Parent.PlayerContextualMenuWrapper)
local UseTrustedFriendActionModule = require(script.Parent.useTrustedFriendAction)
local ConnectAnalyticsModule = require(AppChat.LegacyAnalytics.connectAnalytics)
local RoactChatAnalyticsModule = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local ParseCreateConversationErrorsModule = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local ChatEntryPointNames = require(Parent.SocialCommon).Enums.ChatEntryPointNames
local EnteredChatFromEntryPointFunction = require(AppChat.Actions).EnteredChatFromEntryPoint
local LoggerModule = require(script.Parent.Logger)
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local config = { skipFetch = true }
local config1 = {
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
	-- upvalues: CryoModule (copy), config1 (copy), ReactModule (copy), BackHandlerContextModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseAppPolicyModule (copy), UseSelectorFunction (copy), ConversationModule (copy), FFlagAppChatMigrateFriendshipStatusesModule (copy), UseGetFriendshipStatusFunction (copy), config (copy), NetworkingFriendsModule (copy), UseLocalizationFunction (copy), UseIsExternalNavigationAvailableModule (copy), EnumScreensModule (copy), UseTrustedFriendActionModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), LoggerModule (copy), GenericDialogTypeModule (copy), RoactChatAnalyticsModule (copy), NotificationModalsManagerModule (copy), Sources (copy), EnteredChatFromEntryPointFunction (copy), ChatEntryPointNames (copy), CreateConversationModule (copy), ParseCreateConversationErrorsModule (copy), FFlagDisableBlockAndReport (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), PlayerContextualMenuWrapperModule (copy), FocusNavigableSurfaceWrapper (copy), ParticipantDialogModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p1)
	local UseContextResult = ReactModule.useContext(BackHandlerContextModule)
	local UseRefResult = ReactModule.useRef(JoinResult.onDismiss)
	UseRefResult.current = JoinResult.onDismiss
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), UseRefResult (copy)
		return UseContextResult(function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current()
		end)
	end, { UseContextResult })
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local NavigateToDialog = JoinResult.navigateToDialog or function() end
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getChatViewProfileOption()
	end)
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: JoinResult (copy), ConversationModule (upval)
		local Conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
		local Conversation = Conversations and Conversations[JoinResult.conversationId]
		
		return Conversation and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
	end)
	local IsUseGetFriendshipStatusResultMatch = nil
	
	if FFlagAppChatMigrateFriendshipStatusesModule then
		IsUseGetFriendshipStatusResultMatch = UseGetFriendshipStatusFunction(JoinResult.participantId, if UseSelectorResult then nil else config) == Enum.FriendStatus.Friend
	else
		IsUseGetFriendshipStatusResultMatch = UseSelectorFunction(function(p2): boolean
			-- upvalues: JoinResult (copy)
			local Friends = p2.ChatAppReducer and p2.ChatAppReducer.Friends
			local FriendshipStatus = Friends and Friends.friendshipStatus
			
			return FriendshipStatus and FriendshipStatus[JoinResult.participantId] == Enum.FriendStatus.Friend
		end)
		ReactModule.useEffect(function()
			-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), NetworkingFriendsModule (upval), JoinResult (copy)
			if UseSelectorResult then
				UseDispatchResult(NetworkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = JoinResult.participantId }))
			end
		end, {
			JoinResult.participantId,
			UseDispatchResult,
			UseSelectorResult
		})
	end
	local UseLocalizationResult = UseLocalizationFunction({
		chatUnavailableWithUser = "Feature.Chat.Message.ChatUnavailableWithUser",
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		viewProfileText = JoinResult.viewProfileText,
		chatText = JoinResult.chatText,
		reportUserText = JoinResult.reportUserText,
		removeFromGroupText = JoinResult.removeFromGroupText
	})
	local UseIsExternalNavigationAvailableModuleResultEntry = UseIsExternalNavigationAvailableModule({ EnumScreensModule.ViewUserProfile })[EnumScreensModule.ViewUserProfile]
	local UseTrustedFriendActionModuleResult = UseTrustedFriendActionModule(JoinResult.participantId)
	local Action = UseTrustedFriendActionModuleResult.action
	local RefetchFunction = UseTrustedFriendActionModuleResult.refetch
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), JoinResult (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: JoinResult (upval)
					JoinResult.onDismiss()
					p2:cancel()
				end)
			}
		}
	end, { JoinResult.onDismiss })
	local UseResult = ReactModule.useCallback(function(ParticipantId, ConversationId)
		-- upvalues: LoggerModule (upval), JoinResult (copy), NavigateToDialog (copy), GenericDialogTypeModule (upval)
		LoggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", ParticipantId, ConversationId)
		JoinResult.onDismiss()
		NavigateToDialog(GenericDialogTypeModule.RemoveUserDialog, {
			conversationId = ConversationId,
			participantId = ParticipantId
		})
	end, { JoinResult.onDismiss, NavigateToDialog })
	local UseResult1 = ReactModule.useCallback(function(ParticipantId, ConversationId)
		-- upvalues: JoinResult (copy), UseNavigationResult (copy), EnumScreensModule (upval)
		JoinResult.onDismiss()
		UseNavigationResult.navigate(EnumScreensModule.AppChatReportAbuse, {
			participantId = ParticipantId,
			conversationId = ConversationId
		})
	end, { UseNavigationResult, JoinResult.onDismiss })
	local UseResult2 = ReactModule.useCallback(function(ParticipantId, ConversationId)
		-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval), JoinResult (copy), FFlagDisableBlockAndReport (upval)
		local function OpenReportUser()
			-- upvalues: UseNavigationResult (upval), EnumScreensModule (upval), ParticipantId (copy), ConversationId (copy)
			UseNavigationResult.pop()
			UseNavigationResult.navigate(EnumScreensModule.AppChatReportAbuse, {
				participantId = ParticipantId,
				conversationId = ConversationId
			})
		end
		
		JoinResult.onDismiss()
		UseNavigationResult.navigate(EnumScreensModule.BlockingModal, {
			navProps = {
				userId = ParticipantId,
				openReportUser = OpenReportUser,
				disableReportOption = FFlagDisableBlockAndReport
			}
		})
	end, { UseNavigationResult, JoinResult.onDismiss })
	local JoinResult1 = CryoModule.Dictionary.join(JoinResult, UseLocalizationResult, {
		showViewProfileButton = UseAppPolicyModuleResult,
		showChatButton = if UseSelectorResult and IsUseGetFriendshipStatusResultMatch then true else false,
		showTrustedFriendButton = UseIsExternalNavigationAvailableModuleResultEntry and Action ~= nil,
		trustedFriendText = UseTrustedFriendActionModuleResult.actionText,
		isTrustedFriendButtonDisabled = Action ~= nil and Action.isDisabled,
		openViewProfile = ReactModule.useCallback(function(p2)
			-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval), LoggerModule (upval), JoinResult (copy), RoactChatAnalyticsModule (upval)
			local NavigateToLuaAppPagesScreenProp: (any, any) -> () = UseNavigationResult.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.ViewUserProfile]
			
			if not NavigateToLuaAppPagesScreenProp then
				LoggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
				
				return
			end
			LoggerModule:info("Navigate To UserProfile from {screen}")
			
			if JoinResult.analytics then
				JoinResult.analytics:navigate(RoactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
			end
			JoinResult.onDismiss()
			NavigateToLuaAppPagesScreenProp(p2, {})
		end, {
			UseNavigationResult,
			JoinResult.analytics,
			JoinResult.onDismiss
		}),
		openTrustedFriend = ReactModule.useCallback(function()
			-- upvalues: Action (copy), JoinResult (copy), UseDispatchResult (copy), NetworkingFriendsModule (upval), RefetchFunction (copy), NotificationModalsManagerModule (upval), UseTrustedFriendActionModuleResult (copy), LoggerModule (upval), UseNavigationResult (copy), EnumScreensModule (upval), Sources (upval)
			if Action == nil then return end
			if Action.actionType == "RemoveTrustedConnection" then
				JoinResult.onDismiss()
				UseDispatchResult(NetworkingFriendsModule.RemoveTC.API(JoinResult.participantId)):andThen(function()
					-- upvalues: RefetchFunction (upval), NotificationModalsManagerModule (upval), UseTrustedFriendActionModuleResult (upval)
					RefetchFunction()
					NotificationModalsManagerModule.SetUIBloxToast({
						sequenceNumber = DateTime.now().UnixTimestamp,
						toastTitle = UseTrustedFriendActionModuleResult.toastText
					})
				end):catch(function(Err)
					-- upvalues: LoggerModule (upval), JoinResult (upval)
					LoggerModule:warning("Error removing trusted connection for userId {}: {}", JoinResult.participantId, (tostring(Err)))
				end)
				
				return
			end
			local ModalVariantOverride = Action.modalVariantOverride
			JoinResult.onDismiss()
			
			if Action.actionType == "AddIncomingTrustedConnection" then
				UseNavigationResult.navigate(EnumScreensModule.TrustedConnectionsUpsell, {
					userId = JoinResult.participantId,
					onRequestAccepted = RefetchFunction
				})
				
				return
			else
				UseNavigationResult.navigate(EnumScreensModule.TrustedConnectionsUpsell, {
					userId = JoinResult.participantId,
					source = Sources.ChatDetails,
					modalVariantOverride = ModalVariantOverride,
					onRequestSent = RefetchFunction
				})
			end
		end, {
			Action, UseTrustedFriendActionModuleResult, JoinResult.participantId,
			JoinResult.onDismiss, UseDispatchResult, RefetchFunction, UseNavigationResult
		}),
		openChat = ReactModule.useCallback(function(p2)
			-- upvalues: LoggerModule (upval), UseDispatchResult (copy), EnteredChatFromEntryPointFunction (upval), ChatEntryPointNames (upval), JoinResult (copy), CreateConversationModule (upval), UseNavigationResult (copy), EnumScreensModule (upval), ParseCreateConversationErrorsModule (upval), UseLocalizationResult (copy)
			LoggerModule:info("User activated openChat | userId: {}", p2)
			UseDispatchResult(EnteredChatFromEntryPointFunction(ChatEntryPointNames.ChatDetailsParticipantDialog))
			JoinResult.onDismiss()
			UseDispatchResult(CreateConversationModule("one_to_one", { (tostring(p2)) })):andThen(function(Result)
				-- upvalues: UseNavigationResult (upval), EnumScreensModule (upval)
				UseNavigationResult.navigate(EnumScreensModule.ChatConversation, { conversationId = Result.id })
			end):catch(function(Err)
				-- upvalues: LoggerModule (upval), p2 (copy), ParseCreateConversationErrorsModule (upval), UseLocalizationResult (upval), UseNavigationResult (upval), EnumScreensModule (upval)
				LoggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p2, (tostring(Err)))
				UseNavigationResult.navigate(EnumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = {
							toastTitle = if ParseCreateConversationErrorsModule(Err) == "participant_chat_disabled" then UseLocalizationResult.chatUnavailableWithUser else UseLocalizationResult.networkErrorText
						}
					}
				})
			end)
		end, {
			UseDispatchResult,
			UseNavigationResult,
			JoinResult.onDismiss,
			UseLocalizationResult
		}),
		openReportUser = UseResult1,
		openRemoveUserDialog = UseResult
	})
	
	return if UseIsExternalNavigationAvailableModuleResultEntry then ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = UseMemoResult,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		ReactModule.createElement(ParticipantDialogModule, JoinResult1)
	}) else ReactModule.createElement(AppFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = UseMemoResult,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		ReactModule.createElement(PlayerContextualMenuWrapperModule, {
			conversationId = JoinResult.conversationId,
			participantId = JoinResult.participantId,
			onDismiss = JoinResult.onDismiss,
			openRemoveUserDialog = UseResult,
			removeFromGroupText = UseLocalizationResult.removeFromGroupText,
			openReportUser = UseResult1,
			showRemoveUserButton = JoinResult.showRemoveUserButton,
			openBlockingModal = if JoinResult.openBlockingModal then JoinResult.openBlockingModal else UseResult2
		})
	})
end

ParticipantDialogContainer = ConnectAnalyticsModule(function(Analytics)
	return { analytics = Analytics }
end)(ParticipantDialogContainer)

return MemoFunction(ParticipantDialogContainer)
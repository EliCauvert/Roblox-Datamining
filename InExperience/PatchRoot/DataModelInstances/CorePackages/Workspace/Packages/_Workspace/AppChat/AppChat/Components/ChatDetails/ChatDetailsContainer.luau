local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local UserProfilesModule = require(Parent.UserProfiles)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseIsGroupChatEnabledModule = require(AppChat.Hooks.useIsGroupChatEnabled)
local UseStateFunction = ReactModule.useState
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local UserProfilesCombinedNameAndUsernameByUserIds = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local LuaAppNavigationContextModule = require(AppChat.LuaAppNavigationContext)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseChatPlacementContextFunction = ChatPlacementContextModule.useChatPlacementContext
local IsPlacementInExperienceFunction = ChatPlacementContextModule.isPlacementInExperience
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local SelectChatUserEntryModelListModule = require(script.Parent.Selectors.selectChatUserEntryModelList)
local ParticipantDialogContainerModule = require(script.Parent.ParticipantDialog.ParticipantDialogContainer)
local ChatDetailsPageModule = require(script.Parent.ChatDetailsPage)
local GenericDialogTypeModule = require(script.Parent.Dialogs.GenericDialogType)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local ChatDetailsTelemetryEventsModule = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatConversationTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local ChatDetailsTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local config = {
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
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), GetFFlagIsSquadEnabledFunction (copy), ReactModule (copy), LuaAppNavigationContextModule (copy), UseDispatchFunction (copy), UseStateFunction (copy), UseNavigationFunction (copy), UseIsGroupChatEnabledModule (copy), UseIsChatEnabledModule (copy), UseEffectFunction (copy), UseSelectorFunction (copy), GetDeepValueModule (copy), ConversationModule (copy), AppChatNetworkingModule (copy), UseUserProfilesFetchFunction (copy), UserProfilesCombinedNameAndUsernameByUserIds (copy), UseTelemetryModule (copy), ChatDetailsTelemetryLayerModule (copy), SelectChatUserEntryModelListModule (copy), GetConversationTitleModule (copy), UseIsUserPendingModule (copy), ConversationChannelsModule (copy), PromiseModule (copy), GenericDialogTypeModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), ChatDetailsTelemetryEventsModule (copy), UseCallbackFunction (copy), UseAppPolicyFunction (copy), UseChatPlacementContextFunction (copy), IsPlacementInExperienceFunction (copy), ChatConversationTelemetryStateModule (copy), ChatDetailsTelemetryStateModule (copy), UseEffectOnMountFunction (copy), ChatDetailsPageModule (copy), ParticipantDialogContainerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1 or {})
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		generalText = "Feature.Chat.Label.General",
		titleNotSetText = "Feature.Chat.Label.NotSet",
		membersText = "Feature.Chat.Label.Members",
		addFriendsText = "Feature.Chat.Label.AddFriends",
		leaveGroupText = "Feature.Chat.Heading.LeaveGroup",
		onlinePresenceText = "Common.Presence.Label.Online",
		offlinePresenceText = "Common.Presence.Label.Offline",
		networkErrorToastText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		conversationTypeHeaderText = "Feature.Chat.Label.ExpandedChatFeatures",
		enabledText = "Feature.Chat.Label.Available",
		disabledText = "Feature.Chat.Label.Unavailable",
		createUnfilteredChatText = "Feature.Chat.Label.CreateUnfilteredChat",
		createUnfilteredChatSubtitleText = "Feature.Chat.Description.CreateUnfilteredChatCell",
		pageHeaderText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.Details" else "Feature.Chat.Label.ChatDetails",
		chatGroupText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.GroupName" else "Feature.Chat.Label.ChatGroupName",
		tooManyPeopleText = {
			if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddFriendsLimit",
			friendNum = 5,
			connectionsNum = 5
		}
	})
	local UseContextResult = ReactModule.useContext(LuaAppNavigationContextModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(nil)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(nil)
	local UseNavigationResult = UseNavigationFunction()
	local UseIsGroupChatEnabledModuleResult = UseIsGroupChatEnabledModule()
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	UseEffectFunction(function()
		-- upvalues: UseIsChatEnabledModuleResult (copy), JoinResult (copy)
		if not UseIsChatEnabledModuleResult then
			JoinResult.navigateToChatLanding()
		end
	end, {
		UseIsChatEnabledModuleResult,
		JoinResult.navigateToChatLanding
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueModule (upval), JoinResult (copy), ConversationModule (upval)
		return GetDeepValueModule(p2, `ChatAppReducer.Conversations.{JoinResult.conversationId or ""}`) or ConversationModule.empty()
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueModule (upval), JoinResult (copy)
		return GetDeepValueModule(p2, `ChatAppReducer.ParticipantMetadata.{JoinResult.conversationId or ""}`)
	end)
	local Source = UseSelectorResult and UseSelectorResult.source
	UseEffectFunction(function()
		-- upvalues: Source (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), JoinResult (copy)
		if Source == "channels" then
			UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.API({ JoinResult.conversationId })):catch(function()
				warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata")
			end)
			
			return
		end
	end, {
		JoinResult.conversationId,
		JoinResult.participants,
		Source
	})
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = UseSelectorResult.participants,
		query = UserProfilesCombinedNameAndUsernameByUserIds
	})
	local UseTelemetryModuleResult = UseTelemetryModule(ChatDetailsTelemetryLayerModule.Context)
	local Participants = nil
	local IsGroupOwner = nil
	local IsGroupConversation: boolean? = nil
	local TitleNotSetText = nil
	local ShouldHideGroupChatFunctionality = nil
	local v1 = nil
	local IsModerationTypeMatch: boolean? = nil
	
	if UseSelectorResult then
		Participants = UseSelectorFunction(function(p2)
			-- upvalues: SelectChatUserEntryModelListModule (upval), UseSelectorResult (copy), UseUserProfilesFetchResult (copy)
			return SelectChatUserEntryModelListModule(p2, UseSelectorResult.participants, if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UseUserProfilesFetchResult.data.userProfiles else nil)
		end)
		IsGroupConversation = UseSelectorResult.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
		IsGroupOwner = UseSelectorFunction(function(p2): boolean
			-- upvalues: IsGroupConversation (ref), UseSelectorResult (copy)
			return IsGroupConversation and UseSelectorResult.initiator == p2.LocalUserId
		end)
		TitleNotSetText = GetConversationTitleModule(UseSelectorResult)
		
		if UseSelectorResult1 then
			for i, participant in Participants do
				Participants[i] = CryoModule.Dictionary.join(participant, { metadata = UseSelectorResult1[i] })
			end
		end
		v1 = UseIsUserPendingModule(UseSelectorResult)
		ShouldHideGroupChatFunctionality = IsGroupConversation and v1
		
		if ShouldHideGroupChatFunctionality then
			UseIsGroupChatEnabledModuleResult = false
		end
		IsModerationTypeMatch = UseSelectorResult.moderationType == ConversationChannelsModule.ModerationType.TrustedComms
	end
	local CountParticipants: number = Participants and #Participants or 0
	local EnabledText = if IsModerationTypeMatch then UseLocalizationResult.enabledText else UseLocalizationResult.disabledText
	
	if UseSelectorResult.isDefaultTitle then
		TitleNotSetText = UseLocalizationResult.titleNotSetText
	end
	local function _(p2)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.new(function(Callback1: () -> (), Callback: () -> ())
			-- upvalues: p2 (copy)
			if #p2.participants > 5 then
				Callback()
				
				return
			else
				Callback1()
			end
		end)
	end
	
	local function OnGroupNameEntryCellActivated()
		-- upvalues: JoinResult (copy), GenericDialogTypeModule (upval)
		JoinResult.navigateToDialog(GenericDialogTypeModule.EditChatGroupNameDialog, { conversationId = JoinResult.conversationId })
	end
	
	local function OnLeaveGroupCellActivated()
		-- upvalues: GetFFlagAppChatEnableRootedNavigationModule (upval), UseNavigationResult (copy), JoinResult (copy), GenericDialogTypeModule (upval), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval)
		JoinResult.navigateToDialog(GenericDialogTypeModule.LeaveGroupDialog, {
			conversationId = JoinResult.conversationId,
			isRooted = if GetFFlagAppChatEnableRootedNavigationModule() and UseNavigationResult then UseNavigationResult.getParam("isRooted", false) else false
		})
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ChatDetailsLeaveGroupBtnClicked, {})
	end
	
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseNavigationResult (copy), UseContextResult (copy)
		if UseNavigationResult then
			UseContextResult.navigateToUnfilteredThreadsLearnMore(UseNavigationResult.navigate)
			
			return
		else
			UseContextResult.navigateToUnfilteredThreadsLearnMore()
		end
	end, { UseContextResult, UseNavigationResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), UseStateResult2 (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), JoinResult (copy), UseLocalizationResult (copy)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellClicked, {})
		UseStateResult2(true)
		UseDispatchResult(AppChatNetworkingModule.rodux.DuplicateConversation.API(JoinResult.conversationId, "trusted_comms")):andThen(function(Result)
			-- upvalues: JoinResult (upval), UseLocalizationResult (upval)
			local ResponseBody = Result.responseBody
			local Id = ResponseBody and (ResponseBody.conversations and (ResponseBody.conversations[1] and ResponseBody.conversations[1].id))
			
			if Id then
				JoinResult.navigateToConversation(Id)
				
				return
			else
				JoinResult.navigateToToast({
					toastProps = {
						toastContent = { toastTitle = UseLocalizationResult.networkErrorToastText }
					}
				})
			end
		end):catch(function()
			-- upvalues: JoinResult (upval), UseLocalizationResult (upval)
			JoinResult.navigateToToast({
				toastProps = {
					toastContent = { toastTitle = UseLocalizationResult.networkErrorToastText }
				}
			})
		end):finally(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
	end, {
		UseDispatchResult, UseStateResult2, JoinResult.navigateToToast,
		JoinResult.navigateToConversation, JoinResult.conversationId,
		CountParticipants, IsGroupOwner, UseTelemetryModuleResult
	})
	
	local function OnDismiss()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1(nil)
		UseStateResult2_2(nil)
	end
	
	local function OnParticipantCellActivated(p2, p3)
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Text = tostring(p2)
		
		if UseStateResult1 == Text then
			UseStateResult2_1(nil)
			UseStateResult2_2(nil)
			
			return
		else
			UseStateResult2_1(Text)
			UseStateResult2_2(p3)
		end
	end
	
	local function v63(ToastTitle)
		-- upvalues: JoinResult (copy)
		JoinResult.navigateToToast({
			toastProps = { toastContent = { toastTitle = ToastTitle } }
		})
	end
	
	local function v64(ToastTitle)
		-- upvalues: UseSelectorResult (copy), PromiseModule (upval), JoinResult (copy), v63 (copy), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval)
		PromiseModule.new(function(Callback1: () -> (), Callback: () -> ())
			-- upvalues: UseSelectorResult (copy)
			if #UseSelectorResult.participants > 5 then
				Callback()
				
				return
			else
				Callback1()
			end
		end):andThen(function()
			-- upvalues: JoinResult (upval), UseSelectorResult (upval)
			JoinResult.navigateToEditChatMembers(UseSelectorResult)
		end, function()
			-- upvalues: v63 (upval), ToastTitle (copy)
			v63(ToastTitle)
		end)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ChatDetailsAddFriendsBtnClicked, {})
	end
	
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getWebViewSupport()
	end)
	local IsPlacementInExperience = IsPlacementInExperienceFunction(UseChatPlacementContextFunction().chatPlacement)
	local UseAppPolicyResult1 = UseAppPolicyResult or IsPlacementInExperience
	local ModerationType = UseSelectorResult and UseSelectorResult.moderationType or CryoModule.None
	local UserPendingStatus = UseSelectorResult and UseSelectorResult.userPendingStatus or CryoModule.None
	local UseMergeStateResult = ChatConversationTelemetryStateModule.useMergeState()
	UseEffectFunction(function()
		-- upvalues: UseMergeStateResult (copy), JoinResult (copy), ModerationType (copy), UserPendingStatus (copy)
		UseMergeStateResult({
			conversationId = JoinResult.conversationId,
			moderationType = ModerationType,
			userPendingStatus = UserPendingStatus
		})
	end, {
		JoinResult.conversationId,
		ModerationType,
		UserPendingStatus
	})
	local UseMergeStateResult1 = ChatDetailsTelemetryStateModule.useMergeState()
	UseEffectFunction(function()
		-- upvalues: UseMergeStateResult1 (copy), UseSelectorResult (copy), IsGroupOwner (ref)
		UseMergeStateResult1({
			participantsCount = #UseSelectorResult.participants,
			isGroupOwner = IsGroupOwner
		})
	end, { #UseSelectorResult.participants, IsGroupOwner })
	UseEffectOnMountFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), IsGroupConversation (ref)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ScreenRendered, { isGroupConversation = IsGroupConversation })
	end)
	local JoinResult1 = CryoModule.Dictionary.join({
		shouldShowCreateUnfilteredChat = false,
		LayoutOrder = 2,
		navigateBack = JoinResult.navigateBack,
		onGroupNameEntryCellActivated = OnGroupNameEntryCellActivated,
		onLeaveGroupCellActivated = OnLeaveGroupCellActivated,
		onParticipantCellActivated = OnParticipantCellActivated,
		onAddFriendsCellActivated = function()
			-- upvalues: v64 (copy), UseLocalizationResult (copy)
			return v64(UseLocalizationResult.tooManyPeopleText)
		end,
		onConversationTypeIconActivated = UseCallbackResult,
		onCreateUnfilteredChatCellActivated = UseCallbackResult1,
		conversationTitle = TitleNotSetText,
		conversation = UseSelectorResult,
		conversationId = JoinResult.conversationId,
		participants = Participants,
		isGroupConversation = IsGroupConversation,
		wideMode = JoinResult.wideMode,
		shouldHideGroupChatFunctionality = ShouldHideGroupChatFunctionality,
		shouldShowAddFriends = UseIsGroupChatEnabledModuleResult,
		shouldShowConversationTypeInfo = UseAppPolicyResult1,
		conversationTypeText = EnabledText,
		isCreateUnfilteredChatLoading = UseStateResult,
		topBarHeight = JoinResult.topBarHeight,
		style = UseStyleResult
	}, UseLocalizationResult)
	JoinResult1.activeParticipantId = UseStateResult1
	
	return ReactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ChatDetailsPage = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Content = ReactModule.createElement(ChatDetailsPageModule, JoinResult1)
		}),
		ParticipantDialog = if UseStateResult1 == nil then nil else ReactModule.createElement(ParticipantDialogContainerModule, {
			anchorRef = UseStateResult3,
			conversationId = JoinResult.conversationId,
			isWideMode = JoinResult.wideMode,
			navigateToDialog = JoinResult.navigateToDialog,
			onDismiss = OnDismiss,
			participantId = UseStateResult1,
			showRemoveUserButton = not v1 and (IsGroupConversation and IsGroupOwner)
		})
	})
end
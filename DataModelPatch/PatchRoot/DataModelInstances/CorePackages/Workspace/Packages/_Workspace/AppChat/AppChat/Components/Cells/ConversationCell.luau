local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EnumScreensModule = require(AppChat.EnumScreens)
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local UsePageTrackerFunction = require(Parent.PageLoadTracker).usePageTracker
local FFlagLuaAppEnableChatMilestones = require(Parent.SharedFlags).FFlagLuaAppEnableChatMilestones
local FFlagLuaAppEnablePageLoadTracker = require(Parent.SharedFlags).FFlagLuaAppEnablePageLoadTracker
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local PresenceBubbleCellStyledModule = require(script.Parent.PresenceBubbleCellStyled)
local config = {
	messageUnavailableKey = "Feature.Chat.Message.MessageUnavailable",
	boldTitle = true,
	childWidth = 0,
	isLoading = false,
	hideLeftAvatarPadding = false,
	Size = UDim2.new(1, 0, 1, 0),
	style = CryoModule.Dictionary.join(require(AppChat.SocialLibraries).Components.TestStyle, { Tokens = { Color = { None = {} } } })
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseIsUserPendingModule (copy), UseIsInExperienceModule (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), FocusNavigationUtilsModule (copy), UseNavigationFunction (copy), FFlagLuaAppEnablePageLoadTracker (copy), FFlagLuaAppEnableChatMilestones (copy), UsePageTrackerFunction (copy), ReactModule (copy), EnumScreensModule (copy), GetConversationTitleModule (copy), UseLocalizationFunction (copy), PresenceBubbleCellStyledModule (copy), Images (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Conversation = JoinResult.conversation
	local UseIsUserPendingModuleResult = UseIsUserPendingModule(Conversation or {})
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(Conversation and Conversation.id)
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck then UseGetOneToOneFriendIdFromConversationIdModuleResult else nil)
	local UseLastInputModeResult = FocusNavigationUtilsModule.useLastInputMode()
	local UseNavigationResult = UseNavigationFunction()
	local UsePageTrackerResult = if FFlagLuaAppEnablePageLoadTracker and FFlagLuaAppEnableChatMilestones then UsePageTrackerFunction() else nil
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppEnablePageLoadTracker (upval), FFlagLuaAppEnableChatMilestones (upval), UseIsInExperienceModuleResult (copy), UsePageTrackerResult (ref)
		if FFlagLuaAppEnablePageLoadTracker and FFlagLuaAppEnableChatMilestones and not UseIsInExperienceModuleResult then
			UsePageTrackerResult:sendMilestone("main_cta_interactable")
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseLastInputModeResult (copy), UseNavigationResult (copy), EnumScreensModule (upval), JoinResult (copy)
		if UseLastInputModeResult == "Focus" and UseNavigationResult then
			UseNavigationResult.navigate(EnumScreensModule.ChatConversation, {
				navigatedWithFocus = true,
				conversationId = JoinResult.conversation.id
			})
			
			return
		end
		if JoinResult.onActivated then
			JoinResult.onActivated(JoinResult.conversation)
		end
	end, {
		JoinResult.onActivated,
		JoinResult.conversation,
		UseLastInputModeResult,
		UseNavigationResult
	})
	local ConversationTitleModule = GetConversationTitleModule(Conversation)
	local v1 = JoinResult.subTitleText and JoinResult.subTitleText:split("\n")
	local SubTitleText = v1 and v1[1] or ""
	local UseLocalizationResult = UseLocalizationFunction({ subTitleText = JoinResult.messageUnavailableKey })
	
	if UseIsUserPendingModuleResult then
		SubTitleText = UseLocalizationResult.subTitleText
	end
	return ReactModule.createElement(PresenceBubbleCellStyledModule, {
		boldTitle = JoinResult.boldTitle,
		style = JoinResult.style,
		childWidth = JoinResult.childWidth,
		onActivated = UseResult,
		onCircleActivated = JoinResult.onCircleActivated,
		subTitleText = SubTitleText,
		subTitleTimestamp = JoinResult.subTitleTimestamp,
		subTitleIcon = UseIsUserPendingModuleResult and Images["icons/status/private_small"] or nil,
		secondaryTitleText = JoinResult.secondaryTitleText,
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then JoinResult.testId else nil,
		Size = JoinResult.Size,
		isLoading = JoinResult.isLoading,
		avatarCirclePresenceImage = Conversation.presenceImage,
		titleText = ConversationTitleModule,
		thumbnails = Conversation.thumbnails,
		conversationId = Conversation.id,
		hideLeftAvatarPadding = JoinResult.hideLeftAvatarPadding,
		paddingLeft = JoinResult.paddingLeft,
		paddingRight = JoinResult.paddingRight,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil
	}, JoinResult.children or {})
end)
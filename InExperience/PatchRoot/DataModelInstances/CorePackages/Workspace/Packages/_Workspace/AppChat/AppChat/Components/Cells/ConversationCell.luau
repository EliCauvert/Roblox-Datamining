local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local images = require(parent.UIBlox).App.ImageSet.Images
local useLocalization = require(parent.Localization).Hooks.useLocalization
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useNavigation = require(parent.Navigation).useNavigation
local enumScreensModule = require(appChat.EnumScreens)
local testStyle = require(appChat.SocialLibraries).Components.TestStyle
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local usePageTracker = require(parent.PageLoadTracker).usePageTracker
local fFlagLuaAppEnableChatMilestones = require(parent.SharedFlags).FFlagLuaAppEnableChatMilestones
local fFlagLuaAppEnablePageLoadTracker = require(parent.SharedFlags).FFlagLuaAppEnablePageLoadTracker
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local presenceBubbleCellStyledModule = require(script.Parent.PresenceBubbleCellStyled)
local t = {
	messageUnavailableKey = "Feature.Chat.Message.MessageUnavailable",
	boldTitle = true,
	childWidth = 0,
	isLoading = false,
	hideLeftAvatarPadding = false,
	Size = UDim2.new(1, 0, 1, 0),
	style = cryoModule.Dictionary.join(testStyle, { Tokens = { Color = { None = {} } } })
}

return reactModule.memo(function(p0) --[[ line: 67 | named "ConversationCell" ]]
	-- upvalues: cryoModule (ref), t (ref), useIsUserPendingModule (ref), useIsInExperienceModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), focusNavigationUtilsModule (ref), useNavigation (ref), fFlagLuaAppEnablePageLoadTracker (ref), fFlagLuaAppEnableChatMilestones (ref), usePageTracker (ref), reactModule (ref), enumScreensModule (ref), getConversationTitleModule (ref), useLocalization (ref), presenceBubbleCellStyledModule (ref), images (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var12 = cryoModule.Dictionary.join(t, p0)
	local conversation = var12.conversation
	local var13 = useIsUserPendingModule(conversation or {})
	local var14 = useIsInExperienceModule()
	local var15 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then useGetOneToOneFriendIdFromConversationIdModule(conversation and conversation.id) else nil)
	local var16 = focusNavigationUtilsModule.useLastInputMode()
	local var17 = useNavigation()
	local var18 = if fFlagLuaAppEnablePageLoadTracker and fFlagLuaAppEnableChatMilestones then usePageTracker() else nil
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: fFlagLuaAppEnablePageLoadTracker (copy), fFlagLuaAppEnableChatMilestones (copy), var14 (ref), var18 (write)
		if fFlagLuaAppEnablePageLoadTracker and fFlagLuaAppEnableChatMilestones and not var14 then
			var18:sendMilestone("main_cta_interactable")
		end
	end, {})
	local var19 = reactModule.useCallback(function() --[[ line: 94 ]]
		-- upvalues: var16 (ref), var17 (ref), enumScreensModule (copy), var12 (ref)
		if var16 == "Focus" and var17 then
			var17.navigate(enumScreensModule.ChatConversation, {
				navigatedWithFocus = true,
				conversationId = var12.conversation.id
			})
			
			return
		elseif var12.onActivated then
			var12.onActivated(var12.conversation)
		end
	end, { var12.onActivated, var12.conversation, var16, var17 })
	local var20 = getConversationTitleModule(conversation)
	local var21 = var12.subTitleText and var12.subTitleText:split("\n")
	local var22 = if var21 then var21[1] else ""
	local var23 = useLocalization({ subTitleText = var12.messageUnavailableKey })
	
	if var13 then
		var22 = var23.subTitleText
	end
	return reactModule.createElement(presenceBubbleCellStyledModule, {
		boldTitle = var12.boldTitle,
		style = var12.style,
		childWidth = var12.childWidth,
		onActivated = var19,
		onCircleActivated = var12.onCircleActivated,
		subTitleText = var22,
		subTitleTimestamp = var12.subTitleTimestamp,
		subTitleIcon = if var13 then images["icons/status/private_small"] else nil,
		secondaryTitleText = var12.secondaryTitleText,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var12.testId else nil,
		Size = var12.Size,
		isLoading = var12.isLoading,
		avatarCirclePresenceImage = conversation.presenceImage,
		titleText = var20,
		thumbnails = conversation.thumbnails,
		conversationId = conversation.id,
		hideLeftAvatarPadding = var12.hideLeftAvatarPadding,
		paddingLeft = var12.paddingLeft,
		paddingRight = var12.paddingRight,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var15 else nil
	}, var12.children or {})
end)
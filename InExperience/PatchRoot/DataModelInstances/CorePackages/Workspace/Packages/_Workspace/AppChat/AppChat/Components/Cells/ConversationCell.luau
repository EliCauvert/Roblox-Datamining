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
local useConversationAvatarPresenceImageModule = require(appChat.Hooks.useConversationAvatarPresenceImage)
local presenceBubbleCellStyledModule = require(script.Parent.PresenceBubbleCellStyled)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local t = {
	messageUnavailableKey = "Feature.Chat.Message.MessageUnavailable",
	boldTitle = true,
	childWidth = 0,
	isLoading = false,
	hideLeftAvatarPadding = false,
	Size = UDim2.new(1, 0, 1, 0),
	style = cryoModule.Dictionary.join(testStyle, { Tokens = { Color = { None = {} } } })
}

return reactModule.memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), useIsUserPendingModule (ref), useIsInExperienceModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagAppChatPresenceStoreMigrationModule (ref), useConversationAvatarPresenceImageModule (ref), focusNavigationUtilsModule (ref), useNavigation (ref), fFlagLuaAppEnablePageLoadTracker (ref), fFlagLuaAppEnableChatMilestones (ref), usePageTracker (ref), reactModule (ref), enumScreensModule (ref), getConversationTitleModule (ref), useLocalization (ref), presenceBubbleCellStyledModule (ref), images (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var14 = cryoModule.Dictionary.join(t, p0)
	local conversation = var14.conversation
	local var15 = useIsUserPendingModule(conversation or {})
	local var16 = useIsInExperienceModule()
	local var17 = useGetOneToOneFriendIdFromConversationIdModule(conversation and conversation.id)
	local var18 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then var17 else nil)
	local var19 = if fFlagAppChatPresenceStoreMigrationModule then useConversationAvatarPresenceImageModule(var17) else nil
	local var20 = focusNavigationUtilsModule.useLastInputMode()
	local var21 = useNavigation()
	local var22 = if fFlagLuaAppEnablePageLoadTracker and fFlagLuaAppEnableChatMilestones then usePageTracker() else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagLuaAppEnablePageLoadTracker (copy), fFlagLuaAppEnableChatMilestones (copy), var16 (ref), var22 (write)
		if fFlagLuaAppEnablePageLoadTracker and fFlagLuaAppEnableChatMilestones and not var16 then
			var22:sendMilestone("main_cta_interactable")
		end
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var21 (ref), enumScreensModule (copy), var14 (ref)
		if var20 == "Focus" and var21 then
			var21.navigate(enumScreensModule.ChatConversation, {
				navigatedWithFocus = true,
				conversationId = var14.conversation.id
			})
			
			return
		elseif var14.onActivated then
			var14.onActivated(var14.conversation)
		end
	end, { var14.onActivated, var14.conversation, var20, var21 })
	local var24 = getConversationTitleModule(conversation)
	local var25 = var14.subTitleText and var14.subTitleText:split("\n")
	local var26 = if var25 then var25[1] else ""
	local var27 = useLocalization({ subTitleText = var14.messageUnavailableKey })
	
	if var15 then
		var26 = var27.subTitleText
	end
	return reactModule.createElement(presenceBubbleCellStyledModule, {
		boldTitle = var14.boldTitle,
		style = var14.style,
		childWidth = var14.childWidth,
		onActivated = var23,
		onCircleActivated = var14.onCircleActivated,
		subTitleText = var26,
		subTitleTimestamp = var14.subTitleTimestamp,
		subTitleIcon = if var15 then images["icons/status/private_small"] else nil,
		secondaryTitleText = var14.secondaryTitleText,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var14.testId else nil,
		Size = var14.Size,
		isLoading = var14.isLoading,
		avatarCirclePresenceImage = if fFlagAppChatPresenceStoreMigrationModule then var19 else conversation.presenceImage,
		titleText = var24,
		thumbnails = conversation.thumbnails,
		conversationId = conversation.id,
		hideLeftAvatarPadding = var14.hideLeftAvatarPadding,
		paddingLeft = var14.paddingLeft,
		paddingRight = var14.paddingRight,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var18 else nil
	}, var14.children or {})
end)
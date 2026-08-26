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

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useIsUserPendingModule (ref), useIsInExperienceModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagAppChatPresenceStoreMigrationModule (ref), useConversationAvatarPresenceImageModule (ref), focusNavigationUtilsModule (ref), useNavigation (ref), fFlagLuaAppEnablePageLoadTracker (ref), fFlagLuaAppEnableChatMilestones (ref), usePageTracker (ref), reactModule (ref), enumScreensModule (ref), getConversationTitleModule (ref), useLocalization (ref), presenceBubbleCellStyledModule (ref), images (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local conversation = var1.conversation
	local var2 = useIsUserPendingModule(conversation or {})
	local var3 = useIsInExperienceModule()
	local var4 = useGetOneToOneFriendIdFromConversationIdModule(conversation and conversation.id)
	local var5 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then var4 else nil)
	local var6 = if fFlagAppChatPresenceStoreMigrationModule then useConversationAvatarPresenceImageModule(var4) else nil
	local var7 = focusNavigationUtilsModule.useLastInputMode()
	local var8 = useNavigation()
	local var9 = if fFlagLuaAppEnablePageLoadTracker and fFlagLuaAppEnableChatMilestones then usePageTracker() else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagLuaAppEnablePageLoadTracker (copy), fFlagLuaAppEnableChatMilestones (copy), var3 (ref), var9 (write)
		if fFlagLuaAppEnablePageLoadTracker and fFlagLuaAppEnableChatMilestones and not var3 then
			var9:sendMilestone("main_cta_interactable")
		end
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var8 (ref), enumScreensModule (copy), var1 (ref)
		if var7 == "Focus" and var8 then
			var8.navigate(enumScreensModule.ChatConversation, {
				navigatedWithFocus = true,
				conversationId = var1.conversation.id
			})
			
			return
		elseif var1.onActivated then
			var1.onActivated(var1.conversation)
		end
	end, { var1.onActivated, var1.conversation, var7, var8 })
	local var11 = getConversationTitleModule(conversation)
	local var12 = var1.subTitleText and var1.subTitleText:split("\n")
	local var13 = if var12 then var12[1] else ""
	local var14 = useLocalization({ subTitleText = var1.messageUnavailableKey })
	
	if var2 then
		var13 = var14.subTitleText
	end
	return reactModule.createElement(presenceBubbleCellStyledModule, {
		boldTitle = var1.boldTitle,
		style = var1.style,
		childWidth = var1.childWidth,
		onActivated = var10,
		onCircleActivated = var1.onCircleActivated,
		subTitleText = var13,
		subTitleTimestamp = var1.subTitleTimestamp,
		subTitleIcon = if var2 then images["icons/status/private_small"] else nil,
		secondaryTitleText = var1.secondaryTitleText,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var1.testId else nil,
		Size = var1.Size,
		isLoading = var1.isLoading,
		avatarCirclePresenceImage = if fFlagAppChatPresenceStoreMigrationModule then var6 else conversation.presenceImage,
		titleText = var11,
		thumbnails = conversation.thumbnails,
		conversationId = conversation.id,
		hideLeftAvatarPadding = var1.hideLeftAvatarPadding,
		paddingLeft = var1.paddingLeft,
		paddingRight = var1.paddingRight,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var5 else nil
	}, var1.children or {})
end)
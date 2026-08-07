local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dictionary = require(parent.llama).Dictionary
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getGlobalChatTooltipStoreModule = require(expChat.Stores.GetGlobalChatTooltipStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local ui = script:FindFirstAncestor("UI")
local scrollingViewModule = require(ui.ScrollingView)
local translatedTextMessageModule = require(ui.TranslatedTextMessage)
local topBannerModule = require(ui.TopBanner)
local globalChatTooltipModule = require(ui.GlobalChatTooltip)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local var18 = require(parent.UserProfiles).Stores.VerifiedBadgeDisplayStore.get()
local fStringReportingIXPLayer = require(parent.SharedFlags).FStringReportingIXPLayer
local getFFlagEnableChatLineReporting = require(parent.SharedFlags).GetFFlagEnableChatLineReporting
local getFFlagMemoizeChatReportingMenu = require(parent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local getFFlagChatWindowUseCallbackOptimizationsModule = require(expChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagAEGIS2EnableGatesForExpChatModule = require(expChat.Flags.FFlagAEGIS2EnableGatesForExpChat)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatTopBannerForPresetChatAccessModule = require(expChat.Flags.FFlagExpChatTopBannerForPresetChatAccess)
local useIsARButtonVisibleModule = require(expChat.useIsARButtonVisible)
local fFlagEnableVerifiedBadgeStore = require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local enableInExpChatRewriteEngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local fFlagExpChatPerfTracking = require(parent.SharedFlags).FFlagExpChatPerfTracking
local fFlagExpChatWindowMessageSourceRefactor = require(parent.SharedFlags).FFlagExpChatWindowMessageSourceRefactor
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local fFlagExpChatChannelTabRefactor = require(parent.SharedFlags).FFlagExpChatChannelTabRefactor
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local fFlagExpChatRewriteInlineModule = require(expChat.Flags.FFlagExpChatRewriteInline)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local t = {
	LayoutOrder = 1,
	showTranslationButton = false,
	size = UDim2.fromScale(1, 1),
	messages = if fFlagExpChatEnableV2ChatWindowModule then nil else {},
	transparencyValue = if getFFlagMemoizeChatReportingMenu() then reactModule.createBinding(configModule.ChatWindowBackgroundTransparency) else configModule.ChatWindowBackgroundTransparency,
	textTransparency = reactModule.createBinding(0),
	mutedUserIds = {},
	verifiedUserIds = {}
}

return reactModule.memo(function(_) --[[ line: 68 ]]
	-- upvalues: dictionary (ref), t (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), getGlobalChatTooltipStoreModule (ref), reactModule (ref), getFFlagMemoizeChatReportingMenu (ref), fFlagExpChatEnableV2ChatWindowModule (ref), getMessagesStoreModule (ref), list (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagEnableChatLineReporting (ref), useUserExperiment (ref), fStringReportingIXPLayer (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), fFlagExpChatWindowMessageSourceRefactor (ref), fFlagEnableVerifiedBadgeStore (ref), var18 (ref), translatedTextMessageModule (ref), enableInExpChatRewriteEngineFeature (ref), fFlagExpChatRewriteInlineModule (ref), fFlagExpChatPerfTracking (ref), fFlagExpChatChannelTabRefactor (ref), fFlagExpChatPerfTrackerTabName (ref), expChatPerfTracker (ref), configModule (ref), fFlagExpChatEnableFriendsTab (ref), isChatRegionLockedModule (ref), topBannerModule (ref), scrollingViewModule (ref), textChatService (ref), globalChatTooltipModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 168
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end)
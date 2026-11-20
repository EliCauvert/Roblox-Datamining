local SharedFlagsModule = require(script.Parent.SharedFlags)
local SduiV2Module = require(script.SduiV2)
local FFlagLuaAppsServerTriggeredModals = SharedFlagsModule.FFlagLuaAppsServerTriggeredModals
local FFlagEnableProfileCompletion = SharedFlagsModule.FFlagEnableProfileCompletion
local FFlagEnableSduiV2HomepagePrompts = SharedFlagsModule.FFlagEnableSduiV2HomepagePrompts
local FFlagEnableHomepagePromptsForModalsAndBanners = SharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagEdpGameLeavePromptsHandlerEnabled = SharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagEdpOpenPromptsHandlerEnabled = SharedFlagsModule.FFlagEdpOpenPromptsHandlerEnabled
local FFlagChatPushUpsellPromptsEnabled = SharedFlagsModule.FFlagChatPushUpsellPromptsEnabled
local FFlagNotificationStreamPromptsHandlerEnabled = SharedFlagsModule.FFlagNotificationStreamPromptsHandlerEnabled
local FFlagEventRsvpPushUpsellEnabled = SharedFlagsModule.FFlagEventRsvpPushUpsellEnabled

return {
	["jest.config"] = script["jest.config"],
	CheckForSduiModal = if FFlagLuaAppsServerTriggeredModals then require(script.CheckForSduiModal) else nil,
	SduiModal = if FFlagLuaAppsServerTriggeredModals then require(script.SduiModal) else nil,
	PromptsContainer = require(script.PromptsContainer),
	CheckForPrompts = if FFlagEnableSduiV2HomepagePrompts then require(script.CheckForPrompts) else nil,
	PromptsConstants = require(script.PromptsConstants),
	fetchPrompts = SduiV2Module.fetchPrompts,
	PromptsEntryPoint = SduiV2Module.PromptsEntryPoint,
	PromptStyle = SduiV2Module.PromptStyle,
	usePromptEntries = if FFlagEnableHomepagePromptsForModalsAndBanners then SduiV2Module.usePromptEntries else nil,
	PromptsSystemBanner = if FFlagEnableHomepagePromptsForModalsAndBanners then require(script.PromptsSystemBanner) else nil,
	reportPromptImpression = if FFlagEnableProfileCompletion then require(script.reportPromptImpression) else nil,
	PromptsHandler = require(script.SduiV2.PromptsHandler).PromptsHandler,
	EdpGameLeavePromptsHandler = if FFlagEdpGameLeavePromptsHandlerEnabled then require(script.SduiV2.EdpGameLeavePromptsHandler) else nil,
	EdpOpenPromptsHandler = if FFlagEdpOpenPromptsHandlerEnabled then require(script.SduiV2.EdpOpenPromptsHandler) else nil,
	ChatPromptsHandler = if FFlagChatPushUpsellPromptsEnabled then require(script.SduiV2.ChatPromptsHandler) else nil,
	StreamPromptsHandler = if FFlagNotificationStreamPromptsHandlerEnabled then require(script.SduiV2.StreamPromptsHandler) else nil,
	registerPromptsTriggerActions = if FFlagEventRsvpPushUpsellEnabled then require(script.SduiV2.registerPromptsTriggerActions) else nil
}
local SharedFlagsModule = require(script.Parent.SharedFlags)
local SduiV2Module = require(script.SduiV2)
local PromptsHandlerModule = require(script.SduiV2.PromptsHandler)
local FFlagLuaAppsServerTriggeredModals = SharedFlagsModule.FFlagLuaAppsServerTriggeredModals
local FFlagEnableProfileCompletion = SharedFlagsModule.FFlagEnableProfileCompletion
local FFlagEnableSduiV2HomepagePrompts = SharedFlagsModule.FFlagEnableSduiV2HomepagePrompts
local FFlagEnableHomepagePromptsForModalsAndBanners = SharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = SharedFlagsModule.FFlagPromptsHandlerEnabled
local FFlagEdpGameLeavePromptsHandlerEnabled = SharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagEdpOpenPromptsHandlerEnabled = SharedFlagsModule.FFlagEdpOpenPromptsHandlerEnabled

return {
	["jest.config"] = script["jest.config"],
	CheckForSduiModal = if FFlagLuaAppsServerTriggeredModals then require(script.CheckForSduiModal) else nil,
	SduiModal = if FFlagLuaAppsServerTriggeredModals then require(script.SduiModal) else nil,
	PromptsContainer = if FFlagEnableSduiV2HomepagePrompts or FFlagPromptsHandlerEnabled then require(script.PromptsContainer) else nil,
	CheckForPrompts = if FFlagEnableSduiV2HomepagePrompts then require(script.CheckForPrompts) else nil,
	PromptsConstants = require(script.PromptsConstants),
	fetchPrompts = if FFlagEnableProfileCompletion or FFlagPromptsHandlerEnabled then SduiV2Module.fetchPrompts else nil,
	PromptsEntryPoint = if FFlagEnableProfileCompletion or FFlagPromptsHandlerEnabled then SduiV2Module.PromptsEntryPoint else nil,
	PromptStyle = if FFlagEnableHomepagePromptsForModalsAndBanners or FFlagPromptsHandlerEnabled then SduiV2Module.PromptStyle else nil,
	usePromptEntries = if FFlagEnableHomepagePromptsForModalsAndBanners then SduiV2Module.usePromptEntries else nil,
	PromptsSystemBanner = if FFlagEnableHomepagePromptsForModalsAndBanners then require(script.PromptsSystemBanner) else nil,
	reportPromptImpression = if FFlagEnableProfileCompletion then require(script.reportPromptImpression) else nil,
	PromptsHandler = if FFlagPromptsHandlerEnabled then PromptsHandlerModule.PromptsHandler else nil,
	EdpGameLeavePromptsHandler = if FFlagEdpGameLeavePromptsHandlerEnabled then require(script.SduiV2.EdpGameLeavePromptsHandler) else nil,
	EdpOpenPromptsHandler = if FFlagEdpOpenPromptsHandlerEnabled then require(script.SduiV2.EdpOpenPromptsHandler) else nil
}
local sharedFlagsModule = require(script.Parent.SharedFlags)
local sduiV2Module = require(script.SduiV2)
local promptsHandlerModule = require(script.SduiV2.PromptsHandler)
local fFlagLuaAppsServerTriggeredModals = sharedFlagsModule.FFlagLuaAppsServerTriggeredModals
local fFlagEnableProfileCompletion = sharedFlagsModule.FFlagEnableProfileCompletion
local fFlagEnableSduiV2HomepagePrompts = sharedFlagsModule.FFlagEnableSduiV2HomepagePrompts
local fFlagEnableHomepagePromptsForModalsAndBanners = sharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = sharedFlagsModule.FFlagPromptsHandlerEnabled

return {
	["jest.config"] = script["jest.config"],
	CheckForSduiModal = if fFlagLuaAppsServerTriggeredModals then require(script.CheckForSduiModal) else nil,
	SduiModal = if fFlagLuaAppsServerTriggeredModals then require(script.SduiModal) else nil,
	PromptsContainer = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then require(script.PromptsContainer) else nil,
	CheckForPrompts = if fFlagEnableSduiV2HomepagePrompts then require(script.CheckForPrompts) else nil,
	PromptsConstants = require(script.PromptsConstants),
	fetchPrompts = if fFlagEnableProfileCompletion or fFlagPromptsHandlerEnabled then sduiV2Module.fetchPrompts else nil,
	PromptsEntryPoint = if fFlagEnableProfileCompletion or fFlagPromptsHandlerEnabled then sduiV2Module.PromptsEntryPoint else nil,
	PromptStyle = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then sduiV2Module.PromptStyle else nil,
	usePromptEntries = if fFlagEnableHomepagePromptsForModalsAndBanners then sduiV2Module.usePromptEntries else nil,
	PromptsSystemBanner = if fFlagEnableHomepagePromptsForModalsAndBanners then require(script.PromptsSystemBanner) else nil,
	reportPromptImpression = if fFlagEnableProfileCompletion then require(script.reportPromptImpression) else nil,
	PromptsHandler = if fFlagPromptsHandlerEnabled then promptsHandlerModule.PromptsHandler else nil,
	EdpGameLeavePromptsHandler = if sharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled then require(script.SduiV2.EdpGameLeavePromptsHandler) else nil
}
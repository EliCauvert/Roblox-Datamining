local Parent = script.Parent
local Parent1 = Parent.Parent
local AvatarCreationService = game:GetService("AvatarCreationService")
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local ReactModule = require(Parent1.React)
local SelfieConsentPromptModule = require(Parent.SelfieConsentPrompt)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection

local function v8(p1)
	-- upvalues: ReactModule (copy), UseEventConnectionFunction (copy), AvatarCreationService (copy)
	UseEventConnectionFunction(AvatarCreationService.OpenSelfieConsent, (ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.displaySelfieConsent(true)
	end)))
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {})
end

return function(_)
	-- upvalues: ReactModule (copy), SelfieConsentPromptModule (copy), v8 (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Element = if UseStateResult then ReactModule.createElement(SelfieConsentPromptModule, { displaySelfieConsent = UseStateResult2 }) else nil
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		EventListener = ReactModule.createElement(v8, { displaySelfieConsent = UseStateResult2 }),
		FocusNavigationCoreScriptsWrapper = if Element == nil then nil else ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = Element })
	})
end
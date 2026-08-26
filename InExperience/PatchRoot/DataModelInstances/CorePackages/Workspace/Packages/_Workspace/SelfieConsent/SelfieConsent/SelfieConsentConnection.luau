local parent = script.Parent
local parent_1 = parent.Parent
local avatarCreationService = game:GetService("AvatarCreationService")
local focusNavigationUtilsModule = require(parent_1.FocusNavigationUtils)
local reactUtilsModule = require(parent_1.ReactUtils)
local reactModule = require(parent_1.React)
local selfieConsentPromptModule = require(parent.SelfieConsentPrompt)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useEventConnection = reactUtilsModule.useEventConnection

local var1 = function(p1)
	-- upvalues: reactModule (ref), useEventConnection (ref), avatarCreationService (ref)
	useEventConnection(avatarCreationService.OpenSelfieConsent, reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.displaySelfieConsent(true)
	end))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end

return function(_)
	-- upvalues: reactModule (ref), selfieConsentPromptModule (ref), var1 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2, var3 = reactModule.useState(false)
	local var4 = if var2 then reactModule.createElement(selfieConsentPromptModule, { displaySelfieConsent = var3 }) else nil
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		EventListener = reactModule.createElement(var1, { displaySelfieConsent = var3 }),
		FocusNavigationCoreScriptsWrapper = if var4 ~= nil then nil else reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var4 })
	})
end
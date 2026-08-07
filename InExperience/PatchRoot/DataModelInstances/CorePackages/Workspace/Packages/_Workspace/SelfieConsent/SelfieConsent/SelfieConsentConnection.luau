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

local var5 = function(p0) --[[ line: 21 ]]
	-- upvalues: reactModule (ref), useEventConnection (ref), avatarCreationService (ref)
	useEventConnection(avatarCreationService.OpenSelfieConsent, reactModule.useCallback(function() --[[ line: 22 ]]
		-- upvalues: p0 (ref)
		p0.displaySelfieConsent(true)
	end))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end

return function(_) --[[ line: 29 ]]
	-- upvalues: reactModule (ref), selfieConsentPromptModule (ref), var5 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var6, var7 = reactModule.useState(false)
	local var8 = if var6 then reactModule.createElement(selfieConsentPromptModule, { displaySelfieConsent = var7 }) else nil
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		EventListener = reactModule.createElement(var5, { displaySelfieConsent = var7 }),
		FocusNavigationCoreScriptsWrapper = if var8 ~= nil then nil else reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var8 })
	})
end
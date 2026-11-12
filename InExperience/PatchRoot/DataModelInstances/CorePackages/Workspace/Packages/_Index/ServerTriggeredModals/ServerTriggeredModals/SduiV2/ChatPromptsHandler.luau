local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local ReactModule = require(Parent.React)
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local UsePushPermissionClientAttributesFunction = NotificationsUpsellModule.usePushPermissionClientAttributes
local UseOpenPendingLegacyUpsellFunction = NotificationsUpsellModule.ChatPushUpsellLegacyPrompt.useOpenPendingLegacyUpsell
local PromptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)

return function()
	-- upvalues: UsePushPermissionClientAttributesFunction (copy), UseOpenPendingLegacyUpsellFunction (copy), ReactModule (copy), PromptsHandler (copy), PromptsEntryPointModule (copy)
	local UsePushPermissionClientAttributesResult = UsePushPermissionClientAttributesFunction()
	UseOpenPendingLegacyUpsellFunction()
	
	return if UsePushPermissionClientAttributesResult == nil then nil else ReactModule.createElement(PromptsHandler, {
		entryPoint = PromptsEntryPointModule.ChatLandingOpen,
		clientAttributes = UsePushPermissionClientAttributesResult
	})
end
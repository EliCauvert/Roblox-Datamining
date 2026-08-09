local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local appChatAccountSettingsEventReceiverModule = require(script.Parent.AppChatAccountSettingsEventReceiver)
local appChatInterventionEventReceiverModule = require(script.Parent.AppChatInterventionEventReceiver)
local appChatThirdPartySettingsEventReceiverModule = require(script.Parent.AppChatThirdPartySettingsEventReceiver)
local appChatNotificationEventReceiverModule = require(script.Parent.AppChatNotificationEventReceiver)
local appChatRemoveThirdPartyRestrictionModule = require(script.Parent.AppChatRemoveThirdPartyRestriction)
local thirdPartyUserService = game:GetService("ThirdPartyUserService")

return function(p0) --[[ line: 17 | named "AppChatPersistentEventReceivers" ]]
	-- upvalues: reactModule (ref), appChatAccountSettingsEventReceiverModule (ref), appChatInterventionEventReceiverModule (ref), thirdPartyUserService (ref), appChatThirdPartySettingsEventReceiverModule (ref), appChatRemoveThirdPartyRestrictionModule (ref), appChatNotificationEventReceiverModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		accountSettings = reactModule.createElement(appChatAccountSettingsEventReceiverModule, { isInExperience = p0.isInExperience }),
		intervention = reactModule.createElement(appChatInterventionEventReceiverModule, {}),
		thirdPartySettings = reactModule.createElement(if thirdPartyUserService == nil or not thirdPartyUserService:IsChatRestrictionSupported() then appChatRemoveThirdPartyRestrictionModule else appChatThirdPartySettingsEventReceiverModule),
		notification = reactModule.createElement(appChatNotificationEventReceiverModule)
	})
end
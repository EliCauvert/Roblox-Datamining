local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local AppChatAccountSettingsEventReceiverModule = require(script.Parent.AppChatAccountSettingsEventReceiver)
local AppChatInterventionEventReceiverModule = require(script.Parent.AppChatInterventionEventReceiver)
local AppChatThirdPartySettingsEventReceiverModule = require(script.Parent.AppChatThirdPartySettingsEventReceiver)
local AppChatNotificationEventReceiverModule = require(script.Parent.AppChatNotificationEventReceiver)
local AppChatRemoveThirdPartyRestrictionModule = require(script.Parent.AppChatRemoveThirdPartyRestriction)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")

return function(p1)
	-- upvalues: ReactModule (copy), AppChatAccountSettingsEventReceiverModule (copy), AppChatInterventionEventReceiverModule (copy), ThirdPartyUserService (copy), AppChatThirdPartySettingsEventReceiverModule (copy), AppChatRemoveThirdPartyRestrictionModule (copy), AppChatNotificationEventReceiverModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		accountSettings = ReactModule.createElement(AppChatAccountSettingsEventReceiverModule, { isInExperience = p1.isInExperience }),
		intervention = ReactModule.createElement(AppChatInterventionEventReceiverModule, {}),
		thirdPartySettings = ReactModule.createElement(if ThirdPartyUserService == nil or not ThirdPartyUserService:IsChatRestrictionSupported() then AppChatRemoveThirdPartyRestrictionModule else AppChatThirdPartySettingsEventReceiverModule),
		notification = ReactModule.createElement(AppChatNotificationEventReceiverModule, { isInExperience = p1.isInExperience })
	})
end
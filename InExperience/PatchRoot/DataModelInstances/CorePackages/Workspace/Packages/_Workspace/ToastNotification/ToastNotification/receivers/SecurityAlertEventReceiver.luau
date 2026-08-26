local parent = script.Parent.Parent
local parent_1 = parent.Parent
local getFFlagGenerateLinkWithChannel = require(parent_1.SharedFlags).GetFFlagGenerateLinkWithChannel
local webViewServiceWrapperModule = require(parent.utils.WebViewServiceWrapper)
local reactModule = require(parent_1.React)
local urlBuilder = require(parent_1.UrlBuilder).UrlBuilder
local lifecycleEventsModule = require(parent.utils.LifecycleEvents)
local notificationTypeEnum = require(parent.type).NotificationTypeEnum
local default = require(parent_1.ToastNotificationsProtocol).ToastNotificationProtocol.default
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.RobloxAppLocales).Localization

return function()
	-- upvalues: reactModule (ref), lifecycleEventsModule (ref), notificationTypeEnum (ref), getFFlagGenerateLinkWithChannel (ref), urlBuilder (ref), localization (ref), localizationService (ref), webViewServiceWrapperModule (ref), default (ref)
	reactModule.useEffect(function()
		-- upvalues: lifecycleEventsModule (copy), notificationTypeEnum (copy), getFFlagGenerateLinkWithChannel (copy), urlBuilder (copy), localization (copy), localizationService (copy), webViewServiceWrapperModule (copy), default (copy)
		local userAction = lifecycleEventsModule:RegisterCallback(lifecycleEventsModule.ToastEvents.UserAction, notificationTypeEnum.SecurityAlert, function(p1)
			-- upvalues: getFFlagGenerateLinkWithChannel (copy), urlBuilder (copy), localization (copy), localizationService (copy), webViewServiceWrapperModule (copy), default (copy)
			if p1 and p1.notificationData and (p1.notificationData.notificationType and p1.notificationData.clientEventsPayload) and (p1.notificationData.clientEventsPayload.payload and p1.notificationData.clientEventsPayload.username) then
				local payload = p1.notificationData.clientEventsPayload.payload
				local username = p1.notificationData.clientEventsPayload.username
				webViewServiceWrapperModule.new({
					title = localization.new(localizationService.RobloxLocaleId):Format("Feature.SecurityFeedback.Header.NewLogin"),
					url = if getFFlagGenerateLinkWithChannel() then urlBuilder.static.securityAlertWithChannel({
						channel = "toast",
						payload = payload,
						username = username
					}) else urlBuilder.static.securityAlert({ payload = payload, username = username })
				}):open()
				default:dismissNotification(p1.notificationData.id)
				
				return
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {})
end
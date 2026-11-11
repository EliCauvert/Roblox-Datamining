local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local GetFFlagGenerateLinkWithChannelFunction = require(Parent1.SharedFlags).GetFFlagGenerateLinkWithChannel
local WebViewServiceWrapperModule = require(Parent.utils.WebViewServiceWrapper)
local ReactModule = require(Parent1.React)
local UrlBuilder = require(Parent1.UrlBuilder).UrlBuilder
local LifecycleEventsModule = require(Parent.utils.LifecycleEvents)
local NotificationTypeEnum = require(Parent.type).NotificationTypeEnum
local Default = require(Parent1.ToastNotificationsProtocol).ToastNotificationProtocol.default
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.RobloxAppLocales).Localization

return function()
	-- upvalues: ReactModule (copy), LifecycleEventsModule (copy), NotificationTypeEnum (copy), GetFFlagGenerateLinkWithChannelFunction (copy), UrlBuilder (copy), Localization (copy), LocalizationService (copy), WebViewServiceWrapperModule (copy), Default (copy)
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEventsModule (upval), NotificationTypeEnum (upval), GetFFlagGenerateLinkWithChannelFunction (upval), UrlBuilder (upval), Localization (upval), LocalizationService (upval), WebViewServiceWrapperModule (upval), Default (upval)
		local RegisterResult = LifecycleEventsModule:RegisterCallback(LifecycleEventsModule.ToastEvents.UserAction, NotificationTypeEnum.SecurityAlert, function(p1)
			-- upvalues: GetFFlagGenerateLinkWithChannelFunction (upval), UrlBuilder (upval), Localization (upval), LocalizationService (upval), WebViewServiceWrapperModule (upval), Default (upval)
			if p1 and p1.notificationData and p1.notificationData.notificationType and p1.notificationData.clientEventsPayload and p1.notificationData.clientEventsPayload.payload and p1.notificationData.clientEventsPayload.username then
				local Payload = p1.notificationData.clientEventsPayload.payload
				local Username = p1.notificationData.clientEventsPayload.username
				WebViewServiceWrapperModule.new({
					title = Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.SecurityFeedback.Header.NewLogin"),
					url = if GetFFlagGenerateLinkWithChannelFunction() then UrlBuilder.static.securityAlertWithChannel({
						channel = "toast",
						payload = Payload,
						username = Username
					}) else UrlBuilder.static.securityAlert({ payload = Payload, username = Username })
				}):open()
				Default:dismissNotification(p1.notificationData.id)
				
				return
			end
		end)
		
		return function()
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, {})
end
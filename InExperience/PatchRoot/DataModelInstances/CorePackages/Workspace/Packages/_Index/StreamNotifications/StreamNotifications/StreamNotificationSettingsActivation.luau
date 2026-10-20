local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local NotificationHelper = require(Parent.NotificationsCommon).NotificationHelper
local NavigateDownToNotificationSettingsFunction = require(Parent.NavigationRodux).Thunks.NavigateDownToNotificationSettings
local EventStream = require(StreamNotifications.analytics.analyticsService).EventStream
local AnalyticsConstantsModule = require(StreamNotifications.analytics.analyticsConstants)
local ConstantsModule = require(StreamNotifications.constants)

return {
	createOnSettingsActivated = function(p1, p2, Callback, Callback1)
		-- upvalues: NotificationHelper (copy), EventStream (copy), AnalyticsConstantsModule (copy), ConstantsModule (copy), NavigateDownToNotificationSettingsFunction (copy)
		return function()
			-- upvalues: p1 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), ConstantsModule (upval), p2 (copy), Callback (copy), Callback1 (copy), NavigateDownToNotificationSettingsFunction (upval)
			if not p1 then return end
			NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.goToSettingPage, {
				in_app = true,
				sendrVersion = ConstantsModule.SENDRVersion
			})
			
			if p2 then
				Callback(false)
			end
			Callback1(NavigateDownToNotificationSettingsFunction())
		end
	end
}
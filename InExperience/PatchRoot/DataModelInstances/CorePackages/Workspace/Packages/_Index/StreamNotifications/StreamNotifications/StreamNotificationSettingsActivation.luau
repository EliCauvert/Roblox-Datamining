local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local notificationHelper = require(parent.NotificationsCommon).NotificationHelper
local navigateDownToNotificationSettings = require(parent.NavigationRodux).Thunks.NavigateDownToNotificationSettings
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local constantsModule = require(streamNotifications.constants)

return {
	createOnSettingsActivated = function(value, p1, p2, p3)
		-- upvalues: notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), constantsModule (ref), navigateDownToNotificationSettings (ref)
		return function()
			-- upvalues: value (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), constantsModule (copy), p1 (ref), p2 (ref), p3 (ref), navigateDownToNotificationSettings (copy)
			if not value then return end
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.goToSettingPage, {
				in_app = true,
				sendrVersion = constantsModule.SENDRVersion
			})
			
			if p1 then
				p2(false)
			end
			p3(navigateDownToNotificationSettings())
		end
	end
}
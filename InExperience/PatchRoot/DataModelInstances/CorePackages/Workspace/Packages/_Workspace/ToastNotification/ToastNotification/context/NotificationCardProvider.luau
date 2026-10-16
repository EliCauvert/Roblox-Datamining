local Parent = script.Parent
local Parent1 = Parent.Parent
local NotificationCardContextModule = require(Parent.NotificationCardContext)
local ReactModule = require(Parent1.Parent.React)
local _ = require(Parent1.type)
local ConstantsModule = require(Parent1.constants)
local AnalyticsServiceModule = require(Parent1.analytics.analyticsService)
local ToastNotificationHelperModule = require(Parent1.utils.toastNotificationHelper)

return function(p1) --[[ Line: 23 | Named "NotificationCardProvider" ]]
	-- upvalues: AnalyticsServiceModule (copy), ConstantsModule (copy), ToastNotificationHelperModule (copy), ReactModule (copy), NotificationCardContextModule (copy)
	local EventStream = AnalyticsServiceModule.EventStream
	local CardSize = {
		thumbnail = ConstantsModule.CardSizeDefault.thumbnail,
		cardPadding = ConstantsModule.Padding.DefaultCardPadding
	}
	
	if p1.isCompact then
		CardSize.thumbnail = ConstantsModule.CardSizeCompact.thumbnail
		CardSize.cardPadding = ConstantsModule.Padding.CompactCardPadding
	end
	return ReactModule.createElement(NotificationCardContextModule.Provider, {
		value = {
			state = p1.state,
			cardSize = CardSize,
			handleActions = p1.handleActions,
			sendEvent = function(p2) --[[ Line: 36 ]]
				-- upvalues: ToastNotificationHelperModule (upval), EventStream (copy)
				ToastNotificationHelperModule.fireEvent(EventStream, p2)
			end,
			cardTransparency = if p1.isCompact then ConstantsModule.CardTransparency.Compact else ConstantsModule.CardTransparency.Default,
			notificationReceivedTimestampMs = p1.notificationReceivedTimestampMs,
			timers = p1.timers,
			displayTimestampMs = p1.displayTimestampMs
		}
	}, p1.children)
end
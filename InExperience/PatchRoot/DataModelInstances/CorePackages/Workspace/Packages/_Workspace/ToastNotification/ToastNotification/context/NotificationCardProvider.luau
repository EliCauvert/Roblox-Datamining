local parent = script.Parent
local parent_1 = parent.Parent
local notificationCardContextModule = require(parent.NotificationCardContext)
local reactModule = require(parent_1.Parent.React)
local _ = require(parent_1.type)
local constantsModule = require(parent_1.constants)
local analyticsServiceModule = require(parent_1.analytics.analyticsService)
local toastNotificationHelperModule = require(parent_1.utils.toastNotificationHelper)

return function(p0) --[[ line: 23 | named "NotificationCardProvider" ]]
	-- upvalues: analyticsServiceModule (ref), constantsModule (ref), toastNotificationHelperModule (ref), reactModule (ref), notificationCardContextModule (ref)
	local eventStream = analyticsServiceModule.EventStream
	local t = {
		thumbnail = constantsModule.CardSizeDefault.thumbnail,
		cardPadding = constantsModule.Padding.DefaultCardPadding
	}
	
	if p0.isCompact then
		t.thumbnail = constantsModule.CardSizeCompact.thumbnail
		t.cardPadding = constantsModule.Padding.CompactCardPadding
	end
	return reactModule.createElement(notificationCardContextModule.Provider, {
		value = {
			state = p0.state,
			cardSize = t,
			handleActions = p0.handleActions,
			sendEvent = function(p1) --[[ line: 36 ]]
				-- upvalues: toastNotificationHelperModule (copy), eventStream (ref)
				toastNotificationHelperModule.fireEvent(eventStream, p1)
			end,
			cardTransparency = if p0.isCompact then constantsModule.CardTransparency.Compact else constantsModule.CardTransparency.Default,
			notificationReceivedTimestampMs = p0.notificationReceivedTimestampMs,
			timers = p0.timers,
			displayTimestampMs = p0.displayTimestampMs
		}
	}, p0.children)
end
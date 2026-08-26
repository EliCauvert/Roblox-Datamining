local parent = script.Parent
local parent_1 = parent.Parent
local notificationCardContextModule = require(parent.NotificationCardContext)
local reactModule = require(parent_1.Parent.React)
local _ = require(parent_1.type)
local constantsModule = require(parent_1.constants)

return function(p1)
	-- upvalues: constantsModule (ref), reactModule (ref), notificationCardContextModule (ref)
	local t = {
		thumbnail = constantsModule.CardSizeDefault.thumbnail,
		cardPadding = constantsModule.Padding.DefaultCardPadding
	}
	
	if p1.isCompact then
		t.thumbnail = constantsModule.CardSizeCompact.thumbnail
		t.cardPadding = constantsModule.Padding.CompactCardPadding
	end
	return reactModule.createElement(notificationCardContextModule.Provider, {
		value = {
			notificationPayload = p1.notificationPayload,
			state = p1.state,
			cardSize = t,
			handleActions = p1.handleActions,
			openMetaActions = p1.openMetaActions,
			readOnly = p1.readOnly,
			cardTransparency = if p1.isCompact then constantsModule.CardTransparency.Compact else constantsModule.CardTransparency.Default
		}
	}, p1.children)
end
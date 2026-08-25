local parent = script.Parent
local parent_1 = parent.Parent
local notificationCardContextModule = require(parent.NotificationCardContext)
local reactModule = require(parent_1.Parent.React)
local _ = require(parent_1.type)
local constantsModule = require(parent_1.constants)

return function(p0)
	-- upvalues: constantsModule (ref), reactModule (ref), notificationCardContextModule (ref)
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
			notificationPayload = p0.notificationPayload,
			state = p0.state,
			cardSize = t,
			handleActions = p0.handleActions,
			openMetaActions = p0.openMetaActions,
			readOnly = p0.readOnly,
			cardTransparency = if p0.isCompact then constantsModule.CardTransparency.Compact else constantsModule.CardTransparency.Default
		}
	}, p0.children)
end
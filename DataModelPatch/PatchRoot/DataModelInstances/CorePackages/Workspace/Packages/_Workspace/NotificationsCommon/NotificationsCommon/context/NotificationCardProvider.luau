local Parent = script.Parent
local Parent1 = Parent.Parent
local NotificationCardContextModule = require(Parent.NotificationCardContext)
local ReactModule = require(Parent1.Parent.React)
local _ = require(Parent1.type)
local ConstantsModule = require(Parent1.constants)

return function(p1)
	-- upvalues: ConstantsModule (copy), ReactModule (copy), NotificationCardContextModule (copy)
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
			notificationPayload = p1.notificationPayload,
			state = p1.state,
			cardSize = CardSize,
			handleActions = p1.handleActions,
			openMetaActions = p1.openMetaActions,
			readOnly = p1.readOnly,
			cardTransparency = if p1.isCompact then ConstantsModule.CardTransparency.Compact else ConstantsModule.CardTransparency.Default
		}
	}, p1.children)
end
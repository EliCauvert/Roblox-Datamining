local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ConvertToFoundationPresenceEnumFunction = require(Parent.SocialCommon).Utils.convertToFoundationPresenceEnum

return function(p1)
	-- upvalues: UseTokensFunction (copy), FoundationModule (copy), ConvertToFoundationPresenceEnumFunction (copy), ReactModule (copy), View (copy), UserTile (copy), LayoutMode (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "auto-none",
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = p1.tileRef,
		selection = if p1.selectionOrder then { Selectable = true, SelectionOrder = p1.selectionOrder } else nil
	}, {
		Content = ReactModule.createElement(UserTile, {
			layoutMode = LayoutMode.compact,
			userId = p1.item.id,
			title = p1.name,
			subtitle = p1.contextualText,
			titleStyle = UseTokensResult.Typography.TitleSmall,
			subtitleStyle = UseTokensResult.Typography.LabelSmall,
			userPresenceType = if p1.item.presence == nil then FoundationModule.Enums.UserPresence.None else FoundationModule.Enums.UserPresence[ConvertToFoundationPresenceEnumFunction(p1.item.presence.userPresenceType)],
			onActivated = p1.onActivated,
			titleIcon = p1.titleIcon
		})
	})
end
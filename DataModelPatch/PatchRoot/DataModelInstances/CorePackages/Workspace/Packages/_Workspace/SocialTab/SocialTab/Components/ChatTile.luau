local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local BadgeStates = UIBlox.App.Indicator.Enum.BadgeStates
local Images = UIBlox.App.ImageSet.Images
local ChatTile = Roact.PureComponent:extend("ChatTile")
ChatTile.defaultProps = {
	LayoutOrder = 1,
	unreadConversationCount = nil,
	title = "",
	onActivated = function() end
}
ChatTile.validateProps = T.strictInterface({
	LayoutOrder = T.optional(T.number),
	unreadConversationCount = T.optional(T.number),
	onActivated = T.optional(T.callback),
	title = T.optional(T.string)
})

function ChatTile.render(p1)
	-- upvalues: BadgeStates (copy), UIBlox (copy), Roact (copy), Images (copy)
	local IsEmpty = if p1.props.unreadConversationCount and p1.props.unreadConversationCount > 0 then BadgeStates.isEmpty else nil
	
	return UIBlox.Style.withStyle(function()
		-- upvalues: Roact (upval), UIBlox (upval), p1 (copy), IsEmpty (copy), Images (upval)
		return Roact.createElement(UIBlox.App.Tile.MenuTile, {
			size = UDim2.fromScale(1, 1),
			layoutOrder = p1.props.LayoutOrder,
			badgeValue = IsEmpty,
			icon = Images["icons/menu/messages_large"],
			title = p1.props.title,
			onActivated = p1.props.onActivated
		})
	end)
end

return ChatTile
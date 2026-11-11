local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local Images = UIBlox.App.ImageSet.Images
local GroupsTile = Roact.PureComponent:extend("GroupsTile")
GroupsTile.defaultProps = {
	LayoutOrder = 0,
	title = "",
	onActivated = function() end
}
GroupsTile.validateProps = T.strictInterface({
	LayoutOrder = T.optional(T.number),
	onActivated = T.optional(T.callback),
	title = T.optional(T.string)
})

function GroupsTile.render(p1)
	-- upvalues: UIBlox (copy), Roact (copy), Images (copy)
	return UIBlox.Style.withStyle(function()
		-- upvalues: Roact (upval), UIBlox (upval), p1 (copy), Images (upval)
		return Roact.createElement(UIBlox.App.Tile.MenuTile, {
			size = UDim2.fromScale(1, 1),
			layoutOrder = p1.props.LayoutOrder,
			icon = Images["icons/menu/groups_large"],
			title = p1.props.title,
			onActivated = p1.props.onActivated
		})
	end)
end

return GroupsTile
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local TileModule = require(Parent.BaseTile.Tile)
local SaveTile = RoactModule.PureComponent:extend("SaveTile")
SaveTile.validateProps = TModule.strictInterface({
	hasRoundedCorners = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	isDisabled = TModule.optional(TModule.boolean),
	thumbnail = TModule.optional(TModule.union(TModule.string, TModule.table)),
	thumbnailSize = TModule.optional(TModule.UDim2),
	thumbnailTransparency = TModule.optional(TModule.number),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	thumbnailRef = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
SaveTile.defaultProps = {
	hasRoundedCorners = true,
	thumbnailTransparency = 0,
	isRoactGamepadEnabled = true,
	thumbnail = ImagesModule["icons/actions/edit/add"],
	thumbnailSize = UDim2.new(0, 36, 0, 36)
}

function SaveTile.render(p1)
	-- upvalues: RoactModule (copy), TileModule (copy)
	return RoactModule.createElement(TileModule, {
		hasRoundedCorners = p1.props.hasRoundedCorners,
		name = "",
		onActivated = p1.props.onActivated,
		isDisabled = p1.props.isDisabled,
		thumbnail = p1.props.thumbnail,
		thumbnailSize = p1.props.thumbnailSize,
		thumbnailTransparency = p1.props.thumbnailTransparency,
		isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.thumbnailRef
	})
end

return RoactModule.forwardRef(function(p1, ThumbnailRef)
	-- upvalues: RoactModule (copy), SaveTile (copy), CryoModule (copy)
	return RoactModule.createElement(SaveTile, CryoModule.Dictionary.join(p1, { thumbnailRef = ThumbnailRef }))
end)
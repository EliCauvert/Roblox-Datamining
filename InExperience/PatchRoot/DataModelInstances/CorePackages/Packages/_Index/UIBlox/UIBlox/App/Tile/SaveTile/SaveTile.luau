local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local imagesModule = require(parent_1.App.ImageSet.Images)
local tileModule = require(parent.BaseTile.Tile)
local saveTile = roactModule.PureComponent:extend("SaveTile")
saveTile.validateProps = tModule.strictInterface({
	hasRoundedCorners = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
	isDisabled = tModule.optional(tModule.boolean),
	thumbnail = tModule.optional(tModule.union(tModule.string, tModule.table)),
	thumbnailSize = tModule.optional(tModule.UDim2),
	thumbnailTransparency = tModule.optional(tModule.number),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	thumbnailRef = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
saveTile.defaultProps = {
	hasRoundedCorners = true,
	thumbnailTransparency = 0,
	isRoactGamepadEnabled = true,
	thumbnail = imagesModule["icons/actions/edit/add"],
	thumbnailSize = UDim2.new(0, 36, 0, 36)
}

function saveTile.render(p0)
	-- upvalues: roactModule (ref), tileModule (ref)
	return roactModule.createElement(tileModule, {
		hasRoundedCorners = p0.props.hasRoundedCorners,
		name = "",
		onActivated = p0.props.onActivated,
		isDisabled = p0.props.isDisabled,
		thumbnail = p0.props.thumbnail,
		thumbnailSize = p0.props.thumbnailSize,
		thumbnailTransparency = p0.props.thumbnailTransparency,
		isRoactGamepadEnabled = p0.props.isRoactGamepadEnabled,
		NextSelectionLeft = p0.props.NextSelectionLeft,
		NextSelectionRight = p0.props.NextSelectionRight,
		NextSelectionUp = p0.props.NextSelectionUp,
		NextSelectionDown = p0.props.NextSelectionDown,
		[roactModule.Ref] = p0.props.thumbnailRef
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), saveTile (ref), cryoModule (ref)
	return roactModule.createElement(saveTile, cryoModule.Dictionary.join(p1, { thumbnailRef = p2 }))
end)
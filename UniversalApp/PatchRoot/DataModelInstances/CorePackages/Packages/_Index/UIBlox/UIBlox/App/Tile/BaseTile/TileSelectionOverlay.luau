local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ImagesModule = require(Parent.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local TileSelectionOverlay = RoactModule.PureComponent:extend("TileSelectionOverlay")
TileSelectionOverlay.validateProps = TModule.strictInterface({
	ZIndex = TModule.optional(TModule.integer),
	cornerRadius = TModule.optional(TModule.UDim)
})
TileSelectionOverlay.defaultProps = { cornerRadius = UDim.new(0, 0) }

function TileSelectionOverlay.render(p1) --[[ Line: 26 ]]
	-- upvalues: ImagesModule (copy), WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy)
	local ZIndex = p1.props.ZIndex
	local CornerRadius = p1.props.cornerRadius
	local IconsActionsSelectOn = ImagesModule["icons/actions/selectOn"]
	local ImageRectSizeRatio = IconsActionsSelectOn.ImageRectSize / ImagesModule.ImagesResolutionScale
	
	return WithStyleModule(function(p2) --[[ Line: 33 ]]
		-- upvalues: RoactModule (upval), ZIndex (copy), ImageSetComponentModule (upval), IconsActionsSelectOn (copy), ImageRectSizeRatio (copy), CornerRadius (copy)
		local Theme = p2.Theme
		local Tokens = p2.Tokens
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = ZIndex
		}, {
			SelectionImage = RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Image = IconsActionsSelectOn,
				Position = UDim2.new(1, -Tokens.Size.Size_50, 0, Tokens.Size.Size_50),
				Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y)
			}),
			UICorner = if CornerRadius == UDim.new(0, 0) then nil else RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
		})
	end)
end

return TileSelectionOverlay
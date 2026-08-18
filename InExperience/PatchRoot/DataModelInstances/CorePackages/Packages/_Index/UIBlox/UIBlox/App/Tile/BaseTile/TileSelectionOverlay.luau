local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local withStyleModule = require(parent.Core.Style.withStyle)
local imagesModule = require(parent.App.ImageSet.Images)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local tileSelectionOverlay = roactModule.PureComponent:extend("TileSelectionOverlay")
tileSelectionOverlay.validateProps = tModule.strictInterface({
	ZIndex = tModule.optional(tModule.integer),
	cornerRadius = tModule.optional(tModule.UDim)
})
tileSelectionOverlay.defaultProps = { cornerRadius = UDim.new(0, 0) }

function tileSelectionOverlay.render(p0) --[[ line: 26 ]]
	-- upvalues: imagesModule (ref), withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local zIndex = p0.props.ZIndex
	local cornerRadius = p0.props.cornerRadius
	local selectOn = imagesModule["icons/actions/selectOn"]
	local var6 = selectOn.ImageRectSize / imagesModule.ImagesResolutionScale
	
	return withStyleModule(function(p1) --[[ line: 33 ]]
		-- upvalues: roactModule (copy), zIndex (ref), imageSetComponentModule (copy), selectOn (ref), var6 (ref), cornerRadius (ref)
		local theme = p1.Theme
		local tokens = p1.Tokens
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = theme.Overlay.Color,
			BackgroundTransparency = theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = zIndex
		}, {
			SelectionImage = roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Image = selectOn,
				Position = UDim2.new(1, -tokens.Global.Size_25, 0, tokens.Global.Size_25),
				Size = UDim2.new(0, var6.X, 0, var6.Y)
			}),
			UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
		})
	end)
end

return tileSelectionOverlay
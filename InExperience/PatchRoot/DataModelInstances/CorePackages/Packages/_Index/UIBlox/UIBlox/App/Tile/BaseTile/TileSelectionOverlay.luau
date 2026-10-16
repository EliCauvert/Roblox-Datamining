local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local UIBloxConfigModule = require(parent.UIBloxConfig)
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

function tileSelectionOverlay.render(p1)
	-- upvalues: imagesModule (ref), withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), UIBloxConfigModule (ref)
	local zIndex = p1.props.ZIndex
	local cornerRadius = p1.props.cornerRadius
	local selectOn = imagesModule["icons/actions/selectOn"]
	local var1 = selectOn.ImageRectSize / imagesModule.ImagesResolutionScale
	
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), zIndex (ref), imageSetComponentModule (copy), selectOn (ref), UIBloxConfigModule (copy), var1 (ref), cornerRadius (ref)
		local theme = p2.Theme
		local tokens = p2.Tokens
		
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
				Position = UDim2.new(1, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then -tokens.Size.Size_50 else -tokens.Global.Size_25, 0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Size_25),
				Size = UDim2.new(0, var1.X, 0, var1.Y)
			}),
			UICorner = cornerRadius ~= UDim.new(0, 0) and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
		})
	end)
end

return tileSelectionOverlay
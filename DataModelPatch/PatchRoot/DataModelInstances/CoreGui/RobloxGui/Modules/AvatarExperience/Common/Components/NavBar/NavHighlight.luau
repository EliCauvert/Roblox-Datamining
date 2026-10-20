local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = UIBloxModule.Style.withStyle
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local NavHighlight = RoactModule.PureComponent:extend("NavHighlight")
local ComponentAssetsTriangleUp16 = UIBloxModule.App.ImageSet.Images["component_assets/triangleUp_16"]
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }
local _Vector2 = Vector2.new(20, 8)

local function mapAnimatedValuesToProps(p1)
	return {
		Size = UDim2.new(0, p1.width, 1, 0),
		Position = UDim2.fromOffset(p1.position, 0)
	}
end

NavHighlight.validateProps = TModule.strictInterface({
	useArrowHighlight = TModule.optional(TModule.boolean),
	selectedCategoryButtonInstance = TModule.optional(TModule.Instance),
	scrollingFrameRef = TModule.table
})

function NavHighlight.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), _Vector2 (copy), ComponentAssetsTriangleUp16 (copy), SpringAnimatedItem (copy), mapAnimatedValuesToProps (copy), SpringOptions (copy)
	local UseArrowHighlight = p1.props.useArrowHighlight
	local X = 0
	local X1 = 0
	X = 0
	X1 = 0
	
	if p1.props.selectedCategoryButtonInstance then
		local SelectedCategoryButtonInstance = p1.props.selectedCategoryButtonInstance
		
		if SelectedCategoryButtonInstance then
			X = SelectedCategoryButtonInstance.AbsoluteSize.X
			X1 = SelectedCategoryButtonInstance.AbsolutePosition.X
		end
	end
	local Value = p1.props.scrollingFrameRef:getValue()
	
	if Value then
		X1 = X1 + Value.CanvasPosition.X - Value.AbsolutePosition.X
	end
	return WithStyleFunction(function(p2)
		-- upvalues: UseArrowHighlight (copy), RoactModule (upval), ImageSetLabel (upval), _Vector2 (upval), ComponentAssetsTriangleUp16 (upval), SpringAnimatedItem (upval), X (ref), X1 (ref), mapAnimatedValuesToProps (upval), SpringOptions (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
			regularProps = { BackgroundTransparency = 1 },
			animatedValues = { width = X, position = X1 },
			mapValuesToProps = mapAnimatedValuesToProps,
			springOptions = SpringOptions
		}, {
			Highlight = not UseArrowHighlight and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 3),
				BackgroundColor3 = Theme.IconEmphasis.Color,
				BackgroundTransparency = Theme.IconEmphasis.Transparency
			}),
			ArrowHighlight = UseArrowHighlight and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(0, _Vector2.X, 0, _Vector2.Y),
				Image = ComponentAssetsTriangleUp16,
				ImageColor3 = Theme.BackgroundContrast.Color,
				ImageTransparency = Theme.BackgroundContrast.Transparency
			})
		})
	end)
end

return NavHighlight
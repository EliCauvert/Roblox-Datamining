local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameHorizontal = RoactFitComponents.FitFrameHorizontal
local FitTextLabel = RoactFitComponents.FitTextLabel
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local RobuxAmountDisplay = RoactModule.PureComponent:extend("RobuxAmountDisplay")
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
RobuxAmountDisplay.validateProps = TModule.strictInterface({
	robuxAmountText = TModule.string,
	iconSize = TModule.number,
	textSize = TModule.number,
	padding = TModule.number,
	showRobuxIcon = TModule.optional(TModule.boolean)
})
RobuxAmountDisplay.defaultProps = { showRobuxIcon = true }

function RobuxAmountDisplay.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FitFrameHorizontal (copy), ImageSetLabel (copy), IconsCommonRobux (copy), FitTextLabel (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FitFrameHorizontal (upval), p1 (copy), ImageSetLabel (upval), IconsCommonRobux (upval), FitTextLabel (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement(FitFrameHorizontal, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			height = UDim.new(1, 0),
			contentPadding = UDim.new(0, p1.props.padding),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}, {
			Icon = RoactModule.createElement(ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize),
				Image = IconsCommonRobux,
				ImageColor3 = Theme.TextDefault.Color,
				ImageTransparency = Theme.TextDefault.Transparency,
				Visible = p1.props.showRobuxIcon
			}),
			Text = RoactModule.createElement(FitTextLabel, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = FitTextLabel.Width.FitToText,
				Text = p1.props.robuxAmountText,
				Font = p2.Font.Body.Font,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextSize = p1.props.textSize
			})
		})
	end)
end

return RobuxAmountDisplay
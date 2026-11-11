local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GamepadBottomBarElement = RoactModule.PureComponent:extend("GamepadBottomBarElement")
GamepadBottomBarElement.validateProps = TModule.strictInterface({
	elementIcon = TModule.string,
	elementText = TModule.string,
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.number),
	forwardRef = TModule.optional(TModule.table),
	width = TModule.optional(TModule.number),
	disabled = TModule.optional(TModule.boolean)
})
GamepadBottomBarElement.defaultValue = { layoutOrder = 1, position = UDim2.new(0, 0, 0, 0) }

function GamepadBottomBarElement.render(p1)
	-- upvalues: WithStyleFunction (copy), UIBloxModule (copy), Text (copy), RoactModule (copy), ImageSetLabel (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: UIBloxModule (upval), Text (upval), p1 (copy), RoactModule (upval), ImageSetLabel (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local HeaderFont = _Font.Header2.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
		local Regular: number = UIBloxModule.App.Constant.IconSize.Regular
		local TextWidth = Text.GetTextWidth(p1.props.elementText, HeaderFont, ScaledBaseSize)
		local XOffset = nil
		
		if p1.props.width and p1.props.width < TextWidth then
			TextWidth = p1.props.width - (Regular + 8)
			XOffset = p1.props.width
		else
			XOffset = TextWidth + Regular + 8
		end
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(0, XOffset, 1, 0),
			BackgroundTransparency = 1,
			Position = p1.props.position,
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Ref] = p1.props.forwardRef
		}, {
			Icon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.new(0, Regular, 0, Regular),
				Image = p1.props.elementIcon,
				ImageColor3 = Theme.IconEmphasis.Color,
				ImageTransparency = if p1.props.disabled then 0.5 else Theme.IconEmphasis.Transparency
			}),
			TextFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, TextWidth, 1, 0),
				Position = UDim2.new(0, Regular + 8, 0, 0)
			}, {
				Text = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextScaled = true,
					Text = p1.props.elementText,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 0, ScaledBaseSize),
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = if p1.props.disabled then 0.5 else Theme.TextEmphasis.Transparency,
					Font = HeaderFont,
					TextSize = ScaledBaseSize,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			})
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), GamepadBottomBarElement (copy), CryoModule (copy)
	return RoactModule.createElement(GamepadBottomBarElement, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)
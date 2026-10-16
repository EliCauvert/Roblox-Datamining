local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local Checkbox = RoactModule.PureComponent:extend("Checkbox")
Checkbox.defaultProps = { activated = false }

function Checkbox.render(p1) --[[ Line: 17 ]]
	-- upvalues: UIBloxModule (copy), RoactModule (copy), ImageSetLabel (copy), Images (copy)
	return UIBloxModule.Style.withStyle(function(p2) --[[ Line: 18 ]]
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), p1 (copy), Images (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 64, 1, 0)
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			image = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 20, 0, 20),
				Image = if p1.props.activated then Images["squircles/fill"] else Images["squircles/hollow"],
				ImageColor3 = if p1.props.activated then p2.Tokens.Color.System.Emphasis.Color3 else p2.Theme.IconEmphasis.Color,
				ImageTransparency = if p1.props.activated then 0 else p2.Theme.IconEmphasis.Transparency
			}, {
				FillImage = if p1.props.activated then RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.fromOffset(16, 16),
					Image = Images["icons/status/success_small"]
				}) else nil
			})
		})
	end)
end

return Checkbox
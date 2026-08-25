local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local checkbox = roactModule.PureComponent:extend("Checkbox")
checkbox.defaultProps = { activated = false }

function checkbox.render(p0)
	-- upvalues: UIBloxModule (ref), roactModule (ref), imageSetLabel (ref), images (ref)
	return UIBloxModule.Style.withStyle(function(p1)
		-- upvalues: roactModule (copy), imageSetLabel (copy), p0 (ref), images (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 64, 1, 0)
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			image = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 20, 0, 20),
				Image = if p0.props.activated then images["squircles/fill"] else images["squircles/hollow"],
				ImageColor3 = if p0.props.activated then p1.Tokens.Color.System.Emphasis.Color3 else p1.Theme.IconEmphasis.Color,
				ImageTransparency = if p0.props.activated then 0 else p1.Theme.IconEmphasis.Transparency
			}, {
				FillImage = if p0.props.activated then roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.fromOffset(16, 16),
					Image = images["icons/status/success_small"]
				}) else nil
			})
		})
	end)
end

return checkbox
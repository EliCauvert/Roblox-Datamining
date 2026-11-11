local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ComponentAssetsCircle9 = UIBloxModule.App.ImageSet.Images["component_assets/circle_9"]
local NewItemNotification = RoactModule.PureComponent:extend("NewItemNotification")
NewItemNotification.validateProps = TModule.strictInterface({ isSelected = TModule.optional(TModule.boolean) })
NewItemNotification.defaultProps = { isSelected = false }

function NewItemNotification.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle9 (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), ImageSetLabel (upval), ComponentAssetsCircle9 (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = ComponentAssetsCircle9,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -3, 0, 6),
			Size = UDim2.fromOffset(6, 6),
			ImageColor3 = p1.props.isSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color,
			ImageTransparency = p1.props.isSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency
		})
	end)
end

return NewItemNotification
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsGraphicLockXxlarge = UIBloxModule.App.ImageSet.Images["icons/graphic/lock_xxlarge"]
local IconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2(UIBloxModule.App.ImageSet.Enum.IconSize.XLarge)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), IconsGraphicLockXxlarge (copy), IconSizeUDim2 (copy)
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = IconsGraphicLockXxlarge,
		LayoutOrder = p1.props.layoutOrder or nil,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = IconSizeUDim2
	})
end

return ExtendResult
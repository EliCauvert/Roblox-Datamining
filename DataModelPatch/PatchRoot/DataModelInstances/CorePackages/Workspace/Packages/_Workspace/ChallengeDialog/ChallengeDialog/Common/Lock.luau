local Parent = script:FindFirstAncestor("ChallengeDialog").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsGraphicLockXxlarge = UIBloxModule.App.ImageSet.Images["icons/graphic/lock_xxlarge"]
local IconSizeUDim2 = UIBloxModule.App.ImageSet.getIconSizeUDim2(UIBloxModule.App.ImageSet.Enum.IconSize.XLarge)

return function(p1)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), IconsGraphicLockXxlarge (copy), IconSizeUDim2 (copy)
	return ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = IconsGraphicLockXxlarge,
		LayoutOrder = p1.layoutOrder or nil,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = IconSizeUDim2
	})
end
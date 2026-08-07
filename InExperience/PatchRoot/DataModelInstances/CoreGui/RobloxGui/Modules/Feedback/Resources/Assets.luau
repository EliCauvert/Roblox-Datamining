local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return {
	Images = {
		RoundedRect = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = images["component_assets/circle_17"]
		},
		BiometricIcon = {
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium)),
			Image = images["icons/menu/biometric"]
		},
		FeedbackBarHintIcon = {
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium)),
			Image = images["icons/actions/edit/add"]
		}
	}
}
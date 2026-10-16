local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return {
	Images = {
		RoundedRect = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = Images["component_assets/circle_17"]
		},
		BiometricIcon = {
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium)),
			Image = Images["icons/menu/biometric"]
		},
		FeedbackBarHintIcon = {
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium)),
			Image = Images["icons/actions/edit/add"]
		}
	}
}
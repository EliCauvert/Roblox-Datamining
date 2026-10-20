local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return {
	Images = {
		MuteIcon = {
			Image = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium))
		},
		BlockIcon = {
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium)),
			Image = Images["icons/actions/block"]
		},
		VoiceChatIcon = {
			Image = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium))
		},
		TextChatIcon = {
			Image = "rbxasset://textures/ui/TopBar/chatOff.png",
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium))
		},
		OtherIcon = {
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium)),
			Image = Images["icons/menu/help"]
		},
		RoundedRect = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = Images["component_assets/circle_17"]
		}
	}
}
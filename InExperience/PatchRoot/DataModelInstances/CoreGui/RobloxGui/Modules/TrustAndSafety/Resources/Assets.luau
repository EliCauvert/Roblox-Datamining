local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return {
	Images = {
		MuteIcon = {
			Image = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium))
		},
		BlockIcon = {
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium)),
			Image = images["icons/actions/block"]
		},
		VoiceChatIcon = {
			Image = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium))
		},
		TextChatIcon = {
			Image = "rbxasset://textures/ui/TopBar/chatOff.png",
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium))
		},
		OtherIcon = {
			Size = UDim2.fromOffset(getIconSize(iconSize.Medium), getIconSize(iconSize.Medium)),
			Image = images["icons/menu/help"]
		},
		RoundedRect = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = images["component_assets/circle_17"]
		}
	}
}
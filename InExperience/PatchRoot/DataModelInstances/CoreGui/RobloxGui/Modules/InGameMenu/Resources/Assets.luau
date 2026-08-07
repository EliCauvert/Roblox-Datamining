local corePackagesService = game:GetService("CorePackages")
local imagesModule = require(script.Parent.Images)
local images = require(corePackagesService.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation

return {
	Images = {
		RobloxLogo = imagesModule["LuaApp/graphic/ic_logo"],
		CloseButton = "rbxasset://textures/ui/TopBar/close.png",
		RespawnIcon = imagesModule["InGameMenu/Icons/RespawnIcon"],
		ReportIcon = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/actions/feedback" else imagesModule["LuaApp/icons/GameDetails/feedback"],
		CloseModal = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/navigation/close" else imagesModule["LuaApp/icons/navigation/close"],
		NavigateBack = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/navigation/pushBack" else imagesModule["LuaApp/icons/navigation/pushBack"],
		NavigateForward = imagesModule["LuaApp/icons/navigation/pushRight"],
		SendInvite = imagesModule["LuaApp/icons/GameDetails/invite"],
		InviteSuccess = imagesModule["LuaApp/icons/status_progress"],
		InviteMenu = imagesModule["InGameMenu/Icons/MenuFriends"],
		InviteFail = imagesModule["LuaApp/graphic/ic_alert"],
		ControlsMenu = imagesModule["InGameMenu/Icons/MenuControls"],
		Gamepad = "rbxasset://textures/ui/InGameMenu/GenericController.png",
		GamepadXbox = "rbxasset://textures/ui/InGameMenu/XboxController.png",
		GamepadQuest = "rbxassetid://13262267483",
		KeyBorder = imagesModule["InGameMenu/Icons/KeyBorder"],
		Mouse1Press = imagesModule["InGameMenu/Graphic/ClickLeft"],
		Mouse2Press = imagesModule["InGameMenu/Graphic/ClickRight"],
		MouseWheelScroll = imagesModule["InGameMenu/Graphic/WheelScroll"],
		UpArrow = imagesModule["InGameMenu/Icons/ArrowUp"],
		DownArrow = imagesModule["InGameMenu/Icons/ArrowDown"],
		LeftArrow = imagesModule["InGameMenu/Icons/ArrowLeft"],
		RightArrow = imagesModule["InGameMenu/Icons/ArrowRight"],
		ScrollTop = "rbxasset://textures/ui/InGameMenu/ScrollTop.png",
		ScrollMid = "rbxasset://textures/ui/InGameMenu/ScrollMiddle.png",
		ScrollBottom = "rbxasset://textures/ui/InGameMenu/ScrollBottom.png",
		RadialGlow = "rbxasset://textures/ui/InGameMenu/BackgroundGlow.png",
		PlayersMenu = imagesModule["InGameMenu/Icons/MenuPlayers"],
		AddFriend = imagesModule["LuaApp/graphic/actions_friends_addfriend"],
		CancelFriendRequest = imagesModule["InGameMenu/Icons/CancelFriendRequest"],
		UnFriend = imagesModule["InGameMenu/Icons/UnFriend"],
		Friends = imagesModule["InGameMenu/Icons/Friends"],
		MoreActions = imagesModule["LuaApp/icons/GameDetails/more"],
		ViewAvatar = imagesModule["InGameMenu/Icons/ViewAvatar"],
		RoundedRectImageKey = "component_assets/circle_17",
		RoundedRect = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = images["component_assets/circle_17"]
		},
		RoundedRectBorder = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = images["component_assets/circle_17_stroke_1"]
		},
		WhiteSquare = {
			Image = "rbxasset://textures/ui/InGameMenu/WhiteSquare.png",
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(0, 0, 0, 0)
		},
		Circle = if fFlagCoreUiMigrateUIBloxToFoundation then "component_assets/circle_29" else images["component_assets/circle_29"],
		CircleCutout = "rbxasset://textures/ui/InGameMenu/CircleCutout.png",
		QuarterCircle = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png",
		ExpandArrow = imagesModule["InGameMenu/Icons/ExpandArrow"],
		SelectedCheck = imagesModule["InGameMenu/Icons/SelectedCheck"],
		SuccessTick = imagesModule["LuaApp/icons/status_progress"],
		RetryIcon = imagesModule["LuaApp/icons/common_refresh"],
		ClearIcon = imagesModule["InGameMenu/Icons/Clear"],
		SearchIcon = imagesModule["LuaApp/icons/ic-search-new"],
		GameSettings = imagesModule["InGameMenu/Icons/GameSettings"],
		Shadow = {
			Size = 8,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(12, 12, 40, 40),
			Image = imagesModule["InGameMenu/9Slice/DropShadow"]
		},
		ToggleOutline = {
			Image = imagesModule["InGameMenu/9Slice/ToggleOutline"],
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(18, 18, 18, 18)
		},
		ToggleFill = {
			Image = imagesModule["InGameMenu/9Slice/ToggleFill"],
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(18, 18, 18, 18)
		},
		ToggleKnob = imagesModule["InGameMenu/Graphic/SliderButton"],
		SliderHover = imagesModule["InGameMenu/Graphic/sliderHover"],
		SliderCircle = {
			Image = imagesModule["InGameMenu/9Slice/sliderCircle"],
			SliceCenter = Rect.new(8, 8, 9, 9),
			ScaleType = Enum.ScaleType.Slice
		},
		SliderButton = imagesModule["InGameMenu/Graphic/SliderButton"],
		PlaceholderGameIcon = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/imageUnavailable" else images["icons/imageUnavailable"]
	}
}
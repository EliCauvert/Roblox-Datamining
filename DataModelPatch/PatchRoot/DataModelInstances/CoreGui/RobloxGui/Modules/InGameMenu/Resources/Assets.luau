local CorePackages = game:GetService("CorePackages")
local ImagesModule = require(script.Parent.Images)
local Images = require(CorePackages.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation

return {
	Images = {
		RobloxLogo = ImagesModule["LuaApp/graphic/ic_logo"],
		CloseButton = "rbxasset://textures/ui/TopBar/close.png",
		RespawnIcon = ImagesModule["InGameMenu/Icons/RespawnIcon"],
		ReportIcon = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/actions/feedback" else ImagesModule["LuaApp/icons/GameDetails/feedback"],
		CloseModal = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/navigation/close" else ImagesModule["LuaApp/icons/navigation/close"],
		NavigateBack = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/navigation/pushBack" else ImagesModule["LuaApp/icons/navigation/pushBack"],
		NavigateForward = ImagesModule["LuaApp/icons/navigation/pushRight"],
		SendInvite = ImagesModule["LuaApp/icons/GameDetails/invite"],
		InviteSuccess = ImagesModule["LuaApp/icons/status_progress"],
		InviteMenu = ImagesModule["InGameMenu/Icons/MenuFriends"],
		InviteFail = ImagesModule["LuaApp/graphic/ic_alert"],
		ControlsMenu = ImagesModule["InGameMenu/Icons/MenuControls"],
		Gamepad = "rbxasset://textures/ui/InGameMenu/GenericController.png",
		GamepadXbox = "rbxasset://textures/ui/InGameMenu/XboxController.png",
		GamepadQuest = "rbxassetid://13262267483",
		KeyBorder = ImagesModule["InGameMenu/Icons/KeyBorder"],
		Mouse1Press = ImagesModule["InGameMenu/Graphic/ClickLeft"],
		Mouse2Press = ImagesModule["InGameMenu/Graphic/ClickRight"],
		MouseWheelScroll = ImagesModule["InGameMenu/Graphic/WheelScroll"],
		UpArrow = ImagesModule["InGameMenu/Icons/ArrowUp"],
		DownArrow = ImagesModule["InGameMenu/Icons/ArrowDown"],
		LeftArrow = ImagesModule["InGameMenu/Icons/ArrowLeft"],
		RightArrow = ImagesModule["InGameMenu/Icons/ArrowRight"],
		ScrollTop = "rbxasset://textures/ui/InGameMenu/ScrollTop.png",
		ScrollMid = "rbxasset://textures/ui/InGameMenu/ScrollMiddle.png",
		ScrollBottom = "rbxasset://textures/ui/InGameMenu/ScrollBottom.png",
		RadialGlow = "rbxasset://textures/ui/InGameMenu/BackgroundGlow.png",
		PlayersMenu = ImagesModule["InGameMenu/Icons/MenuPlayers"],
		AddFriend = ImagesModule["LuaApp/graphic/actions_friends_addfriend"],
		CancelFriendRequest = ImagesModule["InGameMenu/Icons/CancelFriendRequest"],
		UnFriend = ImagesModule["InGameMenu/Icons/UnFriend"],
		Friends = ImagesModule["InGameMenu/Icons/Friends"],
		MoreActions = ImagesModule["LuaApp/icons/GameDetails/more"],
		ViewAvatar = ImagesModule["InGameMenu/Icons/ViewAvatar"],
		RoundedRect = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = Images["component_assets/circle_17"]
		},
		RoundedRectBorder = {
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			Image = Images["component_assets/circle_17_stroke_1"]
		},
		WhiteSquare = {
			Image = "rbxasset://textures/ui/InGameMenu/WhiteSquare.png",
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(0, 0, 0, 0)
		},
		Circle = Images["component_assets/circle_29"],
		CircleCutout = "rbxasset://textures/ui/InGameMenu/CircleCutout.png",
		QuarterCircle = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png",
		ExpandArrow = ImagesModule["InGameMenu/Icons/ExpandArrow"],
		SelectedCheck = ImagesModule["InGameMenu/Icons/SelectedCheck"],
		SuccessTick = ImagesModule["LuaApp/icons/status_progress"],
		RetryIcon = ImagesModule["LuaApp/icons/common_refresh"],
		ClearIcon = ImagesModule["InGameMenu/Icons/Clear"],
		SearchIcon = ImagesModule["LuaApp/icons/ic-search-new"],
		GameSettings = ImagesModule["InGameMenu/Icons/GameSettings"],
		Shadow = {
			Size = 8,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(12, 12, 40, 40),
			Image = ImagesModule["InGameMenu/9Slice/DropShadow"]
		},
		ToggleOutline = {
			Image = ImagesModule["InGameMenu/9Slice/ToggleOutline"],
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(18, 18, 18, 18)
		},
		ToggleFill = {
			Image = ImagesModule["InGameMenu/9Slice/ToggleFill"],
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(18, 18, 18, 18)
		},
		ToggleKnob = ImagesModule["InGameMenu/Graphic/SliderButton"],
		SliderHover = ImagesModule["InGameMenu/Graphic/sliderHover"],
		SliderCircle = {
			Image = ImagesModule["InGameMenu/9Slice/sliderCircle"],
			SliceCenter = Rect.new(8, 8, 9, 9),
			ScaleType = Enum.ScaleType.Slice
		},
		SliderButton = ImagesModule["InGameMenu/Graphic/SliderButton"],
		PlaceholderGameIcon = Images["icons/imageUnavailable"]
	}
}
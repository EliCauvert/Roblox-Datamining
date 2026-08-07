local corePackagesService = game:GetService("CorePackages")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeShortcutRemoveLeaveOnRespawnPage = sharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local fFlagChromeShortcutRemoveRespawnOnLeavePage = sharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local _ = require(corePackagesService.Packages.ReactOtter)
local tenFootInterfaceModule = require(script.Parent.Parent.Parent.Parent.TenFootInterface)
local getStyleTokensModule = require(script.Parent.Parent.Utility.GetStyleTokens)
local iconSize = require(corePackagesService.Packages.UIBlox).App.ImageSet.Enum.IconSize
local _ = {
	MouseAndKeyboard = "MouseAndKeyboard",
	Touch = "Touch",
	Gamepad = "Gamepad"
}
local _ = {
	Landscape = "Landscape",
	Portrait = "Portrait",
	Sensor = "Sensor"
}
local var4 = getStyleTokensModule()

local function _(p0) --[[ line: 34 | named "withUIScale" ]]
	-- upvalues: tenFootInterfaceModule (ref)
	return (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * p0
end

return {
	ICON_CELL_WIDTH = var4.Size.Size_1100,
	DIVIDER_CELL_WIDTH = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 5,
	ICON_SIZE = var4.Size.Size_900,
	ICON_NAME_PREFIX = if fFlagEnableConsoleExpControls then "IconHitArea_" else nil,
	ICON_HIGHLIGHT_SIZE = UDim2.new(0, var4.Size.Size_900, 0, var4.Size.Size_900),
	ICON_DIVIDER_SIZE = UDim2.new(0, (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 1, 0, var4.Size.Size_700),
	ICON_DIVIDER_POSITION = UDim2.new(0, var4.Size.Size_50, 0.5, 0),
	ICON_BADGE_OFFSET_X = var4.Gap.XXLarge,
	ICON_BADGE_OFFSET_Y = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 5,
	MEDIUM_ICON_SIZE = var4.Size.Size_700,
	UNIBAR_END_PADDING = var4.Padding.XSmall,
	MENU_SUBMENU_PADDING = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 10,
	UNIBAR_LEFT_MARGIN = var4.Padding.Small,
	MENU_ICON_SCREEN_SIDE_OFFSET = var4.Gap.Large,
	SUB_MENU_ROW_HEIGHT = var4.Size.Size_1400,
	SUBMENU_CORNER_RADIUS = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 10,
	SUBMENU_PADDING_LEFT = var4.Padding.Small,
	SUBMENU_PADDING_RIGHT = var4.Padding.Small,
	SUBMENU_ROW_LABEL_FONT = var4.Typography.TitleLarge,
	SUBMENU_ROW_PADDING = var4.Padding.Small,
	SUBMENU_ROW_CORNER_RADIUS = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 10,
	SUBMENU_BOTTOM_PADDING = var4.Padding.XLarge,
	PIN_ICON_SIZE = UDim2.new(0, (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 18, 0, (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 18),
	PIN_BUTTON_SIZE = var4.Size.Size_1000,
	PIN_RIGHT_PADDING = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 13,
	PIN_CORNER_RADIUS = var4.Radius.Medium,
	NEW_BADGE_SIZE = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 66,
	MENU_ANIMATION_SPRING = {
		dampingRatio = 1.1,
		frequency = 6.666666666667,
		restingPositionLimit = 0.1,
		restingVelocityLimit = 0.05
	},
	UNIBAR_KEEP_OUT_AREA_ID = "unibar",
	SELFIE_VIEW_ID = "selfie_view",
	AVATAR_SWITCHER_ID = "avatar_switcher",
	IN_EXPERIENCE_SHOP_ID = "in_experience_shop",
	UNIBAR_SHORTCUTBAR_ID = "unibarShortcuts",
	TILTMENU_SHORTCUTBAR_ID = "tiltMenuShortcuts",
	TILTMENU_DIALOG_SHORTCUTBAR_ID = "tiltMenuDialogShortcuts",
	TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID = if fFlagChromeShortcutRemoveLeaveOnRespawnPage then "tiltMenuRespawnDialogShortcuts" else nil,
	TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID = if fFlagChromeShortcutRemoveRespawnOnLeavePage then "tiltMenuLeaveDialogShortcuts" else nil,
	SHORTCUTBAR_DISPLAYORDER = 100,
	WINDOW_HOST_GUI_NAME = "WindowHost",
	CLOSE_BUTTON_FRAME = UDim2.fromOffset(var4.Size.Size_1100, var4.Size.Size_1100),
	CLOSE_BUTTON_SIZE = UDim2.fromOffset((if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 22, (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 22),
	CLOSE_ICON_SIZE = iconSize.Small,
	CORNER_RADIUS = UDim.new(0, var4.Radius.Medium),
	WINDOW_DEFAULT_PADDING = var4.Padding.Small,
	WINDOW_ICON_SIZE = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 42,
	DRAG_MAGNITUDE_THRESHOLD = 10,
	WINDOW_MIN_DRAG_DISTANCE = 25,
	DEFAULT_HEIGHT_LARGE = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 285,
	DEFAULT_WIDTH_LARGE = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 176,
	DEFAULT_HEIGHT = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 130,
	DEFAULT_WIDTH = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 176,
	MAX_HEIGHT_PORTRAIT = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 285,
	MAX_WIDTH_PORTRAIT = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 260,
	MAX_HEIGHT_LANDSCAPE = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 285,
	MAX_WIDTH_LANDSCAPE = (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 260,
	SOCIAL_SLOTS = 3,
	TOGGLE_SLOTS = 1,
	NINE_DOT_SLOTS = 1,
	CORE_SLOTS = 5,
	MOBILE_TINY_PORTRAIT_SLOTS = 5,
	MOBILE_PORTRAIT_SLOTS = 6,
	MOBILE_LANDSCAPE_SLOTS = 7,
	NON_MOBILE_SLOTS = 9,
	MAX_NUM_UNIVERSES_SHOWN = 5,
	ANALYTICS = {
		ICON_ACTIVATED = "chrome_unibar_icon_activated",
		ICON_DRAG_START = "chrome_unibar_icon_drag_started",
		ICON_DRAG_END = "chrome_unibar_icon_drag_ended",
		WINDOW_DRAG_START = "chrome_unibar_window_drag_started",
		WINDOW_DRAG_END = "chrome_unibar_window_drag_ended",
		WINDOW_RESIZE = "chrome_unibar_window_resized",
		WINDOW_OPENED = "chrome_unibar_window_opened",
		WINDOW_CLOSED = "chrome_unibar_window_closed",
		SCREEN_ORIENTATION_MAP = {
			[Enum.ScreenOrientation.LandscapeLeft] = "Landscape",
			[Enum.ScreenOrientation.LandscapeRight] = "Landscape",
			[Enum.ScreenOrientation.LandscapeSensor] = "Landscape",
			[Enum.ScreenOrientation.Portrait] = "Portrait",
			[Enum.ScreenOrientation.Sensor] = "Sensor"
		},
		INPUT_TYPE_MAP = {
			[Enum.UserInputType.MouseButton1] = "MouseAndKeyboard",
			[Enum.UserInputType.MouseButton2] = "MouseAndKeyboard",
			[Enum.UserInputType.MouseButton3] = "MouseAndKeyboard",
			[Enum.UserInputType.MouseWheel] = "MouseAndKeyboard",
			[Enum.UserInputType.MouseMovement] = "MouseAndKeyboard",
			[Enum.UserInputType.Keyboard] = "MouseAndKeyboard",
			[Enum.UserInputType.Gamepad1] = "Gamepad",
			[Enum.UserInputType.Gamepad2] = "Gamepad",
			[Enum.UserInputType.Gamepad3] = "Gamepad",
			[Enum.UserInputType.Gamepad4] = "Gamepad",
			[Enum.UserInputType.Gamepad5] = "Gamepad",
			[Enum.UserInputType.Gamepad6] = "Gamepad",
			[Enum.UserInputType.Gamepad7] = "Gamepad",
			[Enum.UserInputType.Gamepad8] = "Gamepad",
			[Enum.UserInputType.Touch] = "Touch"
		}
	}
}
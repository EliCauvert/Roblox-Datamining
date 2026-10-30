local CorePackages = game:GetService("CorePackages")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeShortcutRemoveLeaveOnRespawnPage = SharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local FFlagChromeShortcutRemoveRespawnOnLeavePage = SharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local FFlagResponsiveUnitsDeprecateTenFoot = SharedFlagsModule.FFlagResponsiveUnitsDeprecateTenFoot
local _ = require(CorePackages.Packages.ReactOtter)
local TenFootInterfaceModule = require(script.Parent.Parent.Parent.Parent.TenFootInterface)
local v1 = require(script.Parent.Parent.Utility.GetStyleTokens)()

local function _(p1)
	-- upvalues: FFlagResponsiveUnitsDeprecateTenFoot (copy), TenFootInterfaceModule (copy)
	return if FFlagResponsiveUnitsDeprecateTenFoot then p1 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * p1
end

return {
	ICON_CELL_WIDTH = v1.Size.Size_1100,
	DIVIDER_CELL_WIDTH = if FFlagResponsiveUnitsDeprecateTenFoot then 5 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 5,
	ICON_SIZE = v1.Size.Size_900,
	ICON_NAME_PREFIX = if FFlagEnableConsoleExpControls then "IconHitArea_" else nil,
	ICON_HIGHLIGHT_SIZE = UDim2.new(0, v1.Size.Size_900, 0, v1.Size.Size_900),
	ICON_DIVIDER_SIZE = UDim2.new(0, if FFlagResponsiveUnitsDeprecateTenFoot then 1 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 1, 0, v1.Size.Size_700),
	ICON_DIVIDER_POSITION = UDim2.new(0, v1.Size.Size_50, 0.5, 0),
	ICON_BADGE_OFFSET_X = v1.Gap.XXLarge,
	ICON_BADGE_OFFSET_Y = if FFlagResponsiveUnitsDeprecateTenFoot then 5 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 5,
	MEDIUM_ICON_SIZE = v1.Size.Size_700,
	UNIBAR_END_PADDING = v1.Padding.XSmall,
	MENU_SUBMENU_PADDING = if FFlagResponsiveUnitsDeprecateTenFoot then 10 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 10,
	UNIBAR_LEFT_MARGIN = v1.Padding.Small,
	MENU_ICON_SCREEN_SIDE_OFFSET = v1.Gap.Large,
	SUB_MENU_ROW_HEIGHT = v1.Size.Size_1400,
	SUBMENU_CORNER_RADIUS = if FFlagResponsiveUnitsDeprecateTenFoot then 10 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 10,
	SUBMENU_PADDING_LEFT = v1.Padding.Small,
	SUBMENU_PADDING_RIGHT = v1.Padding.Small,
	SUBMENU_ROW_LABEL_FONT = v1.Typography.TitleLarge,
	SUBMENU_ROW_PADDING = v1.Padding.Small,
	SUBMENU_ROW_CORNER_RADIUS = if FFlagResponsiveUnitsDeprecateTenFoot then 10 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 10,
	SUBMENU_BOTTOM_PADDING = v1.Padding.XLarge,
	PIN_ICON_SIZE = UDim2.new(0, if FFlagResponsiveUnitsDeprecateTenFoot then 18 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 18, 0, if FFlagResponsiveUnitsDeprecateTenFoot then 18 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 18),
	PIN_BUTTON_SIZE = v1.Size.Size_1000,
	PIN_RIGHT_PADDING = if FFlagResponsiveUnitsDeprecateTenFoot then 13 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 13,
	PIN_CORNER_RADIUS = v1.Radius.Medium,
	NEW_BADGE_SIZE = if FFlagResponsiveUnitsDeprecateTenFoot then 66 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 66,
	MENU_ANIMATION_SPRING = {
		dampingRatio = 1.1,
		frequency = 6.666666666666667,
		restingPositionLimit = 0.1,
		restingVelocityLimit = 0.05
	},
	UNIBAR_KEEP_OUT_AREA_ID = "unibar",
	SELFIE_VIEW_ID = "selfie_view",
	AVATAR_SWITCHER_ID = "avatar_switcher",
	SWITCH_SERVER_ID = "switch_server",
	IN_EXPERIENCE_SHOP_ID = "in_experience_shop",
	UNIBAR_SHORTCUTBAR_ID = "unibarShortcuts",
	TILTMENU_SHORTCUTBAR_ID = "tiltMenuShortcuts",
	TILTMENU_DIALOG_SHORTCUTBAR_ID = "tiltMenuDialogShortcuts",
	TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID = if FFlagChromeShortcutRemoveLeaveOnRespawnPage then "tiltMenuRespawnDialogShortcuts" else nil,
	TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID = if FFlagChromeShortcutRemoveRespawnOnLeavePage then "tiltMenuLeaveDialogShortcuts" else nil,
	SHORTCUTBAR_DISPLAYORDER = 100,
	WINDOW_HOST_GUI_NAME = "WindowHost",
	CLOSE_BUTTON_FRAME = UDim2.fromOffset(v1.Size.Size_1100, v1.Size.Size_1100),
	CLOSE_BUTTON_SIZE = UDim2.fromOffset(if FFlagResponsiveUnitsDeprecateTenFoot then 22 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 22, if FFlagResponsiveUnitsDeprecateTenFoot then 22 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 22),
	CLOSE_ICON_SIZE = require(CorePackages.Packages.UIBlox).App.ImageSet.Enum.IconSize.Small,
	CORNER_RADIUS = UDim.new(0, v1.Radius.Medium),
	WINDOW_DEFAULT_PADDING = v1.Padding.Small,
	WINDOW_ICON_SIZE = if FFlagResponsiveUnitsDeprecateTenFoot then 42 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 42,
	DRAG_MAGNITUDE_THRESHOLD = 10,
	WINDOW_MIN_DRAG_DISTANCE = 25,
	DEFAULT_HEIGHT_LARGE = if FFlagResponsiveUnitsDeprecateTenFoot then 285 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 285,
	DEFAULT_WIDTH_LARGE = if FFlagResponsiveUnitsDeprecateTenFoot then 176 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 176,
	DEFAULT_HEIGHT = if FFlagResponsiveUnitsDeprecateTenFoot then 130 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 130,
	DEFAULT_WIDTH = if FFlagResponsiveUnitsDeprecateTenFoot then 176 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 176,
	MAX_HEIGHT_PORTRAIT = if FFlagResponsiveUnitsDeprecateTenFoot then 285 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 285,
	MAX_WIDTH_PORTRAIT = if FFlagResponsiveUnitsDeprecateTenFoot then 260 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 260,
	MAX_HEIGHT_LANDSCAPE = if FFlagResponsiveUnitsDeprecateTenFoot then 285 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 285,
	MAX_WIDTH_LANDSCAPE = if FFlagResponsiveUnitsDeprecateTenFoot then 260 else (if TenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 260,
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
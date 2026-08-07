local parent = script.Parent
local foundationModule = require(parent.Parent.Foundation)
local extraKeysEnumModule = require(parent.Enums.ExtraKeysEnum)
local touchControlsEnumModule = require(parent.Enums.TouchControlsEnum)
local enums = foundationModule.Enums
local iconName = foundationModule.Enums.IconName
local t = {
	ZOOM = enums.IconName.HandDualArrows,
	TAP = enums.IconName.HandHalfEllipse,
	ROTATE = enums.IconName.HandCurvedArrowLeft
}

return {
	HELP_PAGE = {
		PAGE_ID = "helppage",
		TAB_HEADER = {
			NAME = "HelpTab",
			ICON = "icons/menu/help",
			TEXT = "CoreScripts.Feedback.Help.MainHeader"
		},
		KEYCODES_LOCALIZED = {
			[extraKeysEnumModule.MouseWheel] = "CoreScripts.InGameMenu.Controls.MouseWheel",
			[Enum.KeyCode.Up] = "CoreScripts.InGameMenu.Controls.UpArrow",
			[Enum.KeyCode.Down] = "CoreScripts.InGameMenu.Controls.DownArrow",
			[Enum.KeyCode.Left] = "CoreScripts.InGameMenu.Controls.LeftArrow",
			[Enum.KeyCode.Right] = "CoreScripts.InGameMenu.Controls.RightArrow",
			[Enum.KeyCode.Space] = "CoreScripts.InGameMenu.Controls.Space",
			[Enum.KeyCode.Backspace] = "CoreScripts.InGameMenu.Controls.Backspace",
			[Enum.KeyCode.MouseLeftButton] = "CoreScripts.InGameMenu.Controls.LeftMouseButton",
			[Enum.KeyCode.MouseRightButton] = "CoreScripts.InGameMenu.Controls.RightMouseButton",
			[Enum.KeyCode.LeftShift] = "CoreScripts.InGameMenu.Controls.Shift"
		},
		KEYCODES_UNLOCALIZED = {
			[extraKeysEnumModule.Fn] = "Fn",
			[extraKeysEnumModule.NumSequence] = "1,2,3...",
			[Enum.KeyCode.LeftControl] = "Ctrl",
			[Enum.KeyCode.LeftAlt] = "Alt",
			[Enum.KeyCode.RightAlt] = "Opt",
			[Enum.KeyCode.LeftSuper] = "Cmd",
			[Enum.KeyCode.Escape] = "Esc",
			[Enum.KeyCode.Tab] = "Tab",
			[Enum.KeyCode.F1] = "F1",
			[Enum.KeyCode.F2] = "F2",
			[Enum.KeyCode.F3] = "F3",
			[Enum.KeyCode.F4] = "F4",
			[Enum.KeyCode.F5] = "F5",
			[Enum.KeyCode.F6] = "F6",
			[Enum.KeyCode.F7] = "F7",
			[Enum.KeyCode.F8] = "F8",
			[Enum.KeyCode.F9] = "F9",
			[Enum.KeyCode.F10] = "F10",
			[Enum.KeyCode.F11] = "F11",
			[Enum.KeyCode.F12] = "F12"
		},
		KEYCODE_ORDER = {
			[extraKeysEnumModule.Fn] = 1,
			[Enum.KeyCode.LeftControl] = 2,
			[Enum.KeyCode.LeftAlt] = 3,
			[Enum.KeyCode.RightAlt] = 4,
			[Enum.KeyCode.LeftShift] = 5,
			[Enum.KeyCode.LeftSuper] = 6,
			[Enum.KeyCode.F1] = 7,
			[Enum.KeyCode.F2] = 8,
			[Enum.KeyCode.F3] = 9,
			[Enum.KeyCode.F4] = 10,
			[Enum.KeyCode.F5] = 11,
			[Enum.KeyCode.F6] = 12,
			[Enum.KeyCode.F7] = 13,
			[Enum.KeyCode.F8] = 14,
			[Enum.KeyCode.F9] = 15,
			[Enum.KeyCode.F10] = 16,
			[Enum.KeyCode.F11] = 17,
			[Enum.KeyCode.F12] = 18,
			[Enum.KeyCode.Up] = 160,
			[Enum.KeyCode.Left] = 161,
			[Enum.KeyCode.Right] = 162,
			[Enum.KeyCode.Down] = 163,
			[extraKeysEnumModule.NumSequence] = 164,
			[Enum.KeyCode.MouseLeftButton] = 165,
			[Enum.KeyCode.MouseMiddleButton] = 166,
			[extraKeysEnumModule.MouseWheel] = 167,
			[Enum.KeyCode.MouseRightButton] = 168
		},
		SEPARATORS = { COMBO = " + ", ALTERNATIVE = "/" },
		GAMEPAD_PLAYSTATION_PLATFORMS = {
			[Enum.Platform.PS5] = true,
			[Enum.Platform.PS4] = true,
			[Enum.Platform.PS3] = true
		},
		GAMEPAD_LAYOUT_ORDER = {
			[Enum.KeyCode.ButtonL2] = 1,
			[Enum.KeyCode.ButtonL1] = 2,
			[Enum.KeyCode.ButtonSelect] = 3,
			[extraKeysEnumModule.TouchPad] = 4,
			[Enum.KeyCode.Thumbstick1] = 5,
			[Enum.KeyCode.DPadUp] = 6,
			[Enum.KeyCode.DPadLeft] = 7,
			[Enum.KeyCode.DPadRight] = 8,
			[Enum.KeyCode.DPadDown] = 9,
			[extraKeysEnumModule.DPad] = 10,
			[Enum.KeyCode.ButtonL3] = 11,
			[Enum.KeyCode.ButtonR3] = 12,
			[Enum.KeyCode.Thumbstick2] = 13,
			[Enum.KeyCode.ButtonA] = 14,
			[Enum.KeyCode.ButtonX] = 15,
			[Enum.KeyCode.ButtonB] = 16,
			[Enum.KeyCode.ButtonY] = 17,
			[Enum.KeyCode.ButtonStart] = 18,
			[Enum.KeyCode.ButtonR1] = 19,
			[Enum.KeyCode.ButtonR2] = 20
		},
		GAMEPAD_ICON_MAP_XBOX = {
			[Enum.KeyCode.ButtonL2] = iconName.XboxLt,
			[Enum.KeyCode.ButtonL1] = iconName.XboxLb,
			[Enum.KeyCode.ButtonSelect] = iconName.XboxView,
			[Enum.KeyCode.DPadUp] = iconName.XboxDpadUp,
			[Enum.KeyCode.DPadLeft] = iconName.XboxDpadLeft,
			[Enum.KeyCode.DPadRight] = iconName.XboxDpadRight,
			[Enum.KeyCode.DPadDown] = iconName.XboxDpadDown,
			[extraKeysEnumModule.DPad] = iconName.XboxDpad,
			[Enum.KeyCode.Thumbstick1] = iconName.XboxStickLeftDirectional,
			[Enum.KeyCode.ButtonL3] = iconName.XboxStickLeft,
			[Enum.KeyCode.ButtonR3] = iconName.XboxStickRight,
			[Enum.KeyCode.Thumbstick2] = iconName.XboxStickRightDirectional,
			[Enum.KeyCode.ButtonA] = iconName.XboxA,
			[Enum.KeyCode.ButtonX] = iconName.XboxX,
			[Enum.KeyCode.ButtonB] = iconName.XboxB,
			[Enum.KeyCode.ButtonY] = iconName.XboxY,
			[Enum.KeyCode.ButtonStart] = iconName.XboxMenu,
			[Enum.KeyCode.ButtonR1] = iconName.XboxRb,
			[Enum.KeyCode.ButtonR2] = iconName.XboxRt
		},
		GAMEPAD_ICON_MAP_PLAYSTATION = {
			[Enum.KeyCode.ButtonL2] = iconName.PsL2,
			[Enum.KeyCode.ButtonL1] = iconName.PsL1,
			[Enum.KeyCode.ButtonSelect] = iconName.Ps4Share,
			[extraKeysEnumModule.TouchPad] = iconName.Ps4Touchpad,
			[Enum.KeyCode.DPadUp] = iconName.PsDpadUp,
			[Enum.KeyCode.DPadLeft] = iconName.PsDpadLeft,
			[Enum.KeyCode.DPadRight] = iconName.PsDpadRight,
			[Enum.KeyCode.DPadDown] = iconName.PsDpadDown,
			[extraKeysEnumModule.DPad] = iconName.PsDpad,
			[Enum.KeyCode.Thumbstick1] = iconName.PsStickLeft,
			[Enum.KeyCode.ButtonL3] = iconName.PsL3,
			[Enum.KeyCode.ButtonR3] = iconName.PsR3,
			[Enum.KeyCode.Thumbstick2] = iconName.PsStickRight,
			[Enum.KeyCode.ButtonA] = iconName.PsX,
			[Enum.KeyCode.ButtonX] = iconName.PsSquare,
			[Enum.KeyCode.ButtonB] = iconName.PsCircle,
			[Enum.KeyCode.ButtonY] = iconName.PsTriagle,
			[Enum.KeyCode.ButtonStart] = iconName.Ps4Options,
			[Enum.KeyCode.ButtonR1] = iconName.PsR1,
			[Enum.KeyCode.ButtonR2] = iconName.PsR2
		},
		GAMEPAD_ICON_MAP_PLAYSTATION_5 = {
			[extraKeysEnumModule.TouchPad] = iconName.Ps5Touchpad,
			[Enum.KeyCode.ButtonSelect] = iconName.Ps5Share,
			[Enum.KeyCode.ButtonStart] = iconName.Ps5Options
		},
		GAMEPAD_ICON_MAP_SPATIAL = {
			[Enum.KeyCode.ButtonSelect] = iconName.XboxMenu,
			[Enum.KeyCode.Thumbstick1] = iconName.XboxStickLeftDirectional,
			[Enum.KeyCode.ButtonL3] = iconName.XboxStickLeft,
			[Enum.KeyCode.DPadDown] = iconName.XboxX,
			[Enum.KeyCode.DPadUp] = iconName.XboxY,
			[Enum.KeyCode.ButtonA] = iconName.XboxA,
			[Enum.KeyCode.ButtonB] = iconName.XboxB,
			[Enum.KeyCode.ButtonR3] = iconName.XboxStickRight,
			[Enum.KeyCode.Thumbstick2] = iconName.XboxStickRightDirectional
		},
		GAMEPAD_CUTOFFS = { LEFT_COL = 11, BOTTOM_RIGHT_COL = 13 },
		GAMEPAD_SIZES = {
			IMAGE_ASPECT_RATIO = 1.289,
			IMAGE_MULTIPLIER_DEFAULT = 0.5,
			COL_SCALE_PORTRAIT = 0.75,
			COL_SCALE_VR = 0.75,
			IMAGE_MULTIPLIER_PORTRAIT = 0.75,
			IMAGE_MULTIPLIER_VR = 0.45,
			LEFT_COL_SCALE = 0.285,
			RIGHT_COL_SCALE = 0.75,
			RIGHT_COL_SCALE_VR = 0.715,
			NO_PADDING_CUTOFF_Y = 650
		},
		TOUCH_ENUM_TO_ICON = {
			[touchControlsEnumModule.TopLeft] = t.ZOOM,
			[touchControlsEnumModule.TopMidTap] = t.TAP,
			[touchControlsEnumModule.TopMidRotate] = t.ROTATE,
			[touchControlsEnumModule.TopRightTap] = t.TAP,
			[touchControlsEnumModule.TopRightRotate] = t.ROTATE,
			[touchControlsEnumModule.BottomLeftTap] = t.TAP,
			[touchControlsEnumModule.BottomLeftRotate] = t.ROTATE,
			[touchControlsEnumModule.BottomMid] = nil,
			[touchControlsEnumModule.BottomRight] = t.TAP
		},
		TOUCH_OFFSETS = {
			SMALL_SCREEN_CUTOFF_X = 700,
			SMALL_SCREEN_CUTOFF_Y = 500,
			SMALL_SCREEN_OFFSET = 150,
			BIG_SCREEN_OFFSET = 335
		}
	}
}
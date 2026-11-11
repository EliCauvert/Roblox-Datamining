local Foundation = script:FindFirstAncestor("Foundation")
local ColorModeModule = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Components.Types)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local InputPlacementModule = require(Foundation.Enums.InputPlacement)

return {
	MAX_LAYOUT_ORDER = 2147483648,
	MIN_LAYOUT_ORDER = -2147483648,
	DISABLED_TRANSPARENCY = 0.5,
	DEFAULT_DELAY_TIME = 0.15,
	DEFAULT_INPUT_FIELD_WIDTH_PIXELS = 400,
	DEFAULT_NUMBER_INPUT_WIDTH = 300,
	SHADOW_IMAGE = "component_assets/dropshadow_17_8",
	SHADOW_SIZE = 16,
	BUILDER_SANS_FONT_ASSET = "rbxasset://fonts/families/BuilderSans.json",
	MODAL = {
		DISABLE_SELECTION = { Selectable = false },
		TRAP_FOCUS = {
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	},
	COLOR_MODE_TO_STATE_LAYER_MODE = {
		[false] = {
			[ColorModeModule.Color] = StateLayerModeModule.Default,
			[ColorModeModule.Inverse] = StateLayerModeModule.Inverse,
			[ColorModeModule.LightMode] = StateLayerModeModule.Light,
			[ColorModeModule.DarkMode] = StateLayerModeModule.Dark
		},
		[true] = {
			[ColorModeModule.Color] = StateLayerModeModule.Inverse,
			[ColorModeModule.Inverse] = StateLayerModeModule.Default,
			[ColorModeModule.LightMode] = StateLayerModeModule.Dark,
			[ColorModeModule.DarkMode] = StateLayerModeModule.Light
		}
	},
	INPUT_PLACEMENT_TO_LABEL_ALIGNMENT = {
		[InputPlacementModule.Start] = Enum.HorizontalAlignment.Right,
		[InputPlacementModule.End] = Enum.HorizontalAlignment.Left
	}
}
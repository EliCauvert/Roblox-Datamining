local Foundation = script:FindFirstAncestor("Foundation")
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
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
	TOOLTIP_MAX_WIDTH = 280,
	SHADOW_IMAGE = "component_assets/dropshadow_17_8",
	SHADOW_SIZE = 16,
	PLUGIN_SHADOW_SIZE = 4,
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
	COLOR_NAMESPACE_TO_STATE_LAYER_MODE = {
		[false] = {
			[ColorNamespaceModule.Color] = StateLayerModeModule.Default,
			[ColorNamespaceModule.Inverse] = StateLayerModeModule.Inverse,
			[ColorNamespaceModule.LightMode] = StateLayerModeModule.Light,
			[ColorNamespaceModule.DarkMode] = StateLayerModeModule.Dark
		},
		[true] = {
			[ColorNamespaceModule.Color] = StateLayerModeModule.Inverse,
			[ColorNamespaceModule.Inverse] = StateLayerModeModule.Default,
			[ColorNamespaceModule.LightMode] = StateLayerModeModule.Dark,
			[ColorNamespaceModule.DarkMode] = StateLayerModeModule.Light
		}
	},
	INPUT_PLACEMENT_TO_LABEL_ALIGNMENT = {
		[InputPlacementModule.Start] = Enum.HorizontalAlignment.Right,
		[InputPlacementModule.End] = Enum.HorizontalAlignment.Left
	}
}
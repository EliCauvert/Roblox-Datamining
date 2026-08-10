local foundation = script:FindFirstAncestor("Foundation")
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Components.Types)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local inputPlacementModule = require(foundation.Enums.InputPlacement)

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
	COLOR_NAMESPACE_TO_STATE_LAYER_MODE = {
		[false] = {
			[colorNamespaceModule.Color] = stateLayerModeModule.Default,
			[colorNamespaceModule.Inverse] = stateLayerModeModule.Inverse,
			[colorNamespaceModule.LightMode] = stateLayerModeModule.Light,
			[colorNamespaceModule.DarkMode] = stateLayerModeModule.Dark
		},
		[true] = {
			[colorNamespaceModule.Color] = stateLayerModeModule.Inverse,
			[colorNamespaceModule.Inverse] = stateLayerModeModule.Default,
			[colorNamespaceModule.LightMode] = stateLayerModeModule.Dark,
			[colorNamespaceModule.DarkMode] = stateLayerModeModule.Light
		}
	},
	INPUT_PLACEMENT_TO_LABEL_ALIGNMENT = {
		[inputPlacementModule.Start] = Enum.HorizontalAlignment.Right,
		[inputPlacementModule.End] = Enum.HorizontalAlignment.Left
	}
}
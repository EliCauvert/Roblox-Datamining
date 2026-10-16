local Foundation = script:FindFirstAncestor("Foundation")
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.ControlStateEvent)
local _ = require(script.Parent.StateTable.StateTable)

return {
	Initialize = {
		Idle = { nextState = ControlStateModule.Default },
		Enabled = { nextState = ControlStateModule.Default },
		Disabled = { nextState = ControlStateModule.Disabled }
	},
	Default = {
		PrimaryPressed = { nextState = ControlStateModule.Pressed },
		PointerHover = { nextState = ControlStateModule.Hover },
		SelectionGained = { nextState = ControlStateModule.Selected },
		Disabled = { nextState = ControlStateModule.Disabled }
	},
	Hover = {
		SelectionGained = { nextState = ControlStateModule.Selected },
		PrimaryPressed = { nextState = ControlStateModule.Pressed },
		PointerHoverEnd = { nextState = ControlStateModule.Default },
		Disabled = { nextState = ControlStateModule.Disabled }
	},
	Pressed = {
		SelectionGained = { nextState = ControlStateModule.SelectedPressed },
		PrimaryReleasedHover = { nextState = ControlStateModule.Hover },
		PrimaryReleased = { nextState = ControlStateModule.Default },
		Disabled = { nextState = ControlStateModule.Disabled }
	},
	Selected = {
		SelectionLost = { nextState = ControlStateModule.Default },
		PrimaryPressed = { nextState = ControlStateModule.SelectedPressed },
		Disabled = { nextState = ControlStateModule.Disabled }
	},
	SelectedPressed = {
		SelectionLost = { nextState = ControlStateModule.Default },
		PrimaryReleasedHover = { nextState = ControlStateModule.Selected },
		PrimaryReleased = { nextState = ControlStateModule.Selected },
		Disabled = { nextState = ControlStateModule.Disabled }
	},
	Disabled = { Enabled = { nextState = ControlStateModule.Default } }
}
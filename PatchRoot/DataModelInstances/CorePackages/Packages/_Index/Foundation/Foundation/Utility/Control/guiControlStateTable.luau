-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = script.Parent
local controlStateModule = require(foundation.Enums.ControlState)
local _ = require(foundation.Enums.ControlStateEvent)
local _ = require(parent.StateTable.StateTable)

return {
	Initialize = {
		Idle = { nextState = controlStateModule.Default },
		Enabled = { nextState = controlStateModule.Default },
		Disabled = { nextState = controlStateModule.Disabled }
	},
	Default = {
		PrimaryPressed = { nextState = controlStateModule.Pressed },
		PointerHover = { nextState = controlStateModule.Hover },
		SelectionGained = { nextState = controlStateModule.Selected },
		Disabled = { nextState = controlStateModule.Disabled }
	},
	Hover = {
		SelectionGained = { nextState = controlStateModule.Selected },
		PrimaryPressed = { nextState = controlStateModule.Pressed },
		PointerHoverEnd = { nextState = controlStateModule.Default },
		Disabled = { nextState = controlStateModule.Disabled }
	},
	Pressed = {
		SelectionGained = { nextState = controlStateModule.SelectedPressed },
		PrimaryReleasedHover = { nextState = controlStateModule.Hover },
		PrimaryReleased = { nextState = controlStateModule.Default },
		Disabled = { nextState = controlStateModule.Disabled }
	},
	Selected = {
		SelectionLost = { nextState = controlStateModule.Default },
		PrimaryPressed = { nextState = controlStateModule.SelectedPressed },
		Disabled = { nextState = controlStateModule.Disabled }
	},
	SelectedPressed = {
		SelectionLost = { nextState = controlStateModule.Default },
		PrimaryReleasedHover = { nextState = controlStateModule.Selected },
		PrimaryReleased = { nextState = controlStateModule.Selected },
		Disabled = { nextState = controlStateModule.Disabled }
	},
	Disabled = { Enabled = { nextState = controlStateModule.Default } }
}
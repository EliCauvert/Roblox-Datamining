local parent = script.Parent
local parent_1 = parent.Parent.Parent
local controlStateModule = require(parent.Enum.ControlState)
local controlStateEventModule = require(parent.Enum.ControlStateEvent)
local stateTableModule = require(parent_1.StateTable.StateTable)

return function(p1)
	-- upvalues: stateTableModule (ref), controlStateModule (ref), controlStateEventModule (ref)
	local _ = nil
	local guiStateTable = stateTableModule.new("GuiStateTable", controlStateModule.Initialize, {}, {
		[controlStateModule.Initialize] = {
			[controlStateEventModule.Idle] = { nextState = controlStateModule.Default },
			[controlStateEventModule.Enabled] = { nextState = controlStateModule.Default },
			[controlStateEventModule.Disabled] = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Default] = {
			[controlStateEventModule.PrimaryPressed] = { nextState = controlStateModule.Pressed },
			[controlStateEventModule.PointerHover] = { nextState = controlStateModule.Hover },
			[controlStateEventModule.SelectionGained] = { nextState = controlStateModule.Selected },
			[controlStateEventModule.Disabled] = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Hover] = {
			[controlStateEventModule.SelectionGained] = { nextState = controlStateModule.Selected },
			[controlStateEventModule.PrimaryPressed] = { nextState = controlStateModule.Pressed },
			[controlStateEventModule.PointerHoverEnd] = { nextState = controlStateModule.Default },
			[controlStateEventModule.Disabled] = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Pressed] = {
			[controlStateEventModule.SelectionGained] = { nextState = controlStateModule.SelectedPressed },
			[controlStateEventModule.PrimaryReleasedHover] = { nextState = controlStateModule.Hover },
			[controlStateEventModule.PrimaryReleased] = { nextState = controlStateModule.Default },
			[controlStateEventModule.Disabled] = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Selected] = {
			[controlStateEventModule.SelectionLost] = { nextState = controlStateModule.Default },
			[controlStateEventModule.PrimaryPressed] = { nextState = controlStateModule.SelectedPressed },
			[controlStateEventModule.Disabled] = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.SelectedPressed] = {
			[controlStateEventModule.SelectionLost] = { nextState = controlStateModule.Default },
			[controlStateEventModule.PrimaryReleasedHover] = { nextState = controlStateModule.Selected },
			[controlStateEventModule.PrimaryReleased] = { nextState = controlStateModule.Selected },
			[controlStateEventModule.Disabled] = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Disabled] = {
			[controlStateEventModule.Enabled] = { nextState = controlStateModule.Default }
		}
	})
	guiStateTable:onStateChange(p1)
	
	return guiStateTable
end
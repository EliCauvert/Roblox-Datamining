local Parent = script.Parent
local ControlStateModule = require(Parent.Enum.ControlState)
local ControlStateEventModule = require(Parent.Enum.ControlStateEvent)
local StateTableModule = require(Parent.Parent.Parent.StateTable.StateTable)

return function(p1) --[[ Line: 17 | Named "createGuiControlStateTable" ]]
	-- upvalues: StateTableModule (copy), ControlStateModule (copy), ControlStateEventModule (copy)
	local GuiStateTable = StateTableModule.new("GuiStateTable", ControlStateModule.Initialize, {}, {
		[ControlStateModule.Initialize] = {
			[ControlStateEventModule.Idle] = { nextState = ControlStateModule.Default },
			[ControlStateEventModule.Enabled] = { nextState = ControlStateModule.Default },
			[ControlStateEventModule.Disabled] = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Default] = {
			[ControlStateEventModule.PrimaryPressed] = { nextState = ControlStateModule.Pressed },
			[ControlStateEventModule.PointerHover] = { nextState = ControlStateModule.Hover },
			[ControlStateEventModule.SelectionGained] = { nextState = ControlStateModule.Selected },
			[ControlStateEventModule.Disabled] = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Hover] = {
			[ControlStateEventModule.SelectionGained] = { nextState = ControlStateModule.Selected },
			[ControlStateEventModule.PrimaryPressed] = { nextState = ControlStateModule.Pressed },
			[ControlStateEventModule.PointerHoverEnd] = { nextState = ControlStateModule.Default },
			[ControlStateEventModule.Disabled] = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Pressed] = {
			[ControlStateEventModule.SelectionGained] = { nextState = ControlStateModule.SelectedPressed },
			[ControlStateEventModule.PrimaryReleasedHover] = { nextState = ControlStateModule.Hover },
			[ControlStateEventModule.PrimaryReleased] = { nextState = ControlStateModule.Default },
			[ControlStateEventModule.Disabled] = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Selected] = {
			[ControlStateEventModule.SelectionLost] = { nextState = ControlStateModule.Default },
			[ControlStateEventModule.PrimaryPressed] = { nextState = ControlStateModule.SelectedPressed },
			[ControlStateEventModule.Disabled] = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.SelectedPressed] = {
			[ControlStateEventModule.SelectionLost] = { nextState = ControlStateModule.Default },
			[ControlStateEventModule.PrimaryReleasedHover] = { nextState = ControlStateModule.Selected },
			[ControlStateEventModule.PrimaryReleased] = { nextState = ControlStateModule.Selected },
			[ControlStateEventModule.Disabled] = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Disabled] = {
			[ControlStateEventModule.Enabled] = { nextState = ControlStateModule.Default }
		}
	})
	GuiStateTable:onStateChange(p1)
	
	return GuiStateTable
end
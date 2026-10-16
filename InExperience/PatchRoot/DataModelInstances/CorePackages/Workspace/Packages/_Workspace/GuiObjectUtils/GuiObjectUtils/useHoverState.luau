local UseGuiStateModule = require(script.Parent.useGuiState)

return function(p1): boolean --[[ Line: 9 | Named "useHoverState" ]]
	-- upvalues: UseGuiStateModule (copy)
	return UseGuiStateModule(p1) == Enum.GuiState.Hover
end
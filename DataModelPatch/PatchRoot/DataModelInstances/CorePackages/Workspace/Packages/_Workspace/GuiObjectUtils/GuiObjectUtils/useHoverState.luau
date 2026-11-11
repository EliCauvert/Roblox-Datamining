local UseGuiStateModule = require(script.Parent.useGuiState)

return function(p1): boolean
	-- upvalues: UseGuiStateModule (copy)
	return UseGuiStateModule(p1) == Enum.GuiState.Hover
end
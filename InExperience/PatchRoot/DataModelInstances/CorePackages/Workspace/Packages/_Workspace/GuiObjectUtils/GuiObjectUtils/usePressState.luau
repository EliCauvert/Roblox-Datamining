local UseGuiStateModule = require(script.Parent.useGuiState)

return function(p1): boolean --[[ Line: 9 | Named "usePressState" ]]
	-- upvalues: UseGuiStateModule (copy)
	return UseGuiStateModule(p1) == Enum.GuiState.Press
end
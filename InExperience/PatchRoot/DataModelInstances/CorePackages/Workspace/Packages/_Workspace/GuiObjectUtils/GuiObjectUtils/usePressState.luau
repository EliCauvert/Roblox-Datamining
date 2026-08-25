local useGuiStateModule = require(script.Parent.useGuiState)

return function(p0)
	-- upvalues: useGuiStateModule (ref)
	return useGuiStateModule(p0) == Enum.GuiState.Press
end
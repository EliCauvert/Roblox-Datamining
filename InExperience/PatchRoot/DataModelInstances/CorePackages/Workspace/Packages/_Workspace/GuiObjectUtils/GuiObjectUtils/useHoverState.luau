local useGuiStateModule = require(script.Parent.useGuiState)

return function(p1)
	-- upvalues: useGuiStateModule (ref)
	return useGuiStateModule(p1) == Enum.GuiState.Hover
end
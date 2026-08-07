local useGuiStateModule = require(script.Parent.useGuiState)

return function(p0) --[[ line: 9 | named "useHoverState" ]]
	-- upvalues: useGuiStateModule (ref)
	return useGuiStateModule(p0) == Enum.GuiState.Hover
end
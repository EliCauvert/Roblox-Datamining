local useGuiStateModule = require(script.Parent.useGuiState)

return function(p0) --[[ line: 9 | named "usePressState" ]]
	-- upvalues: useGuiStateModule (ref)
	return useGuiStateModule(p0) == Enum.GuiState.Press
end
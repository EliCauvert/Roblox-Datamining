local UsePropertyModule = require(script.Parent.useProperty)

return function(p1) --[[ Line: 9 | Named "useGuiState" ]]
	-- upvalues: UsePropertyModule (copy)
	return UsePropertyModule(p1, "GuiState")
end
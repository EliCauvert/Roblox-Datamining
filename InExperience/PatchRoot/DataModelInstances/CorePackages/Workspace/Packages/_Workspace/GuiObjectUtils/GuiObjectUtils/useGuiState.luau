local UsePropertyModule = require(script.Parent.useProperty)

return function(p1)
	-- upvalues: UsePropertyModule (copy)
	return UsePropertyModule(p1, "GuiState")
end
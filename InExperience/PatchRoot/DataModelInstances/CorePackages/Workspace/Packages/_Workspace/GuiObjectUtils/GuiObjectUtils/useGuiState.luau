local usePropertyModule = require(script.Parent.useProperty)

return function(p1)
	-- upvalues: usePropertyModule (ref)
	return usePropertyModule(p1, "GuiState")
end
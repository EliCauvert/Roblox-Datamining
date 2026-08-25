local usePropertyModule = require(script.Parent.useProperty)

return function(p0)
	-- upvalues: usePropertyModule (ref)
	return usePropertyModule(p0, "GuiState")
end
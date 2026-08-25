local foundationModule = require(script.Parent.Parent.Foundation)

return function(value)
	-- upvalues: foundationModule (ref)
	return if 0.299 * value.R + 0.587 * value.G + 0.114 * value.B >= 0.5 then foundationModule.Enums.ColorMode.Light else foundationModule.Enums.ColorMode.Dark
end
local FoundationModule = require(script.Parent.Parent.Foundation)

return function(p1)
	-- upvalues: FoundationModule (copy)
	return if 0.299 * p1.R + 0.587 * p1.G + 0.114 * p1.B >= 0.5 then FoundationModule.Enums.Theme.Light else FoundationModule.Enums.Theme.Dark
end
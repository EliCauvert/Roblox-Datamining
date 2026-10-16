local FoundationModule = require(script.Parent.Parent.Foundation)

return function(p1) --[[ Line: 14 | Named "themeFromBackgroundColor" ]]
	-- upvalues: FoundationModule (copy)
	return if 0.299 * p1.R + 0.587 * p1.G + 0.114 * p1.B >= 0.5 then FoundationModule.Enums.ColorMode.Light else FoundationModule.Enums.ColorMode.Dark
end
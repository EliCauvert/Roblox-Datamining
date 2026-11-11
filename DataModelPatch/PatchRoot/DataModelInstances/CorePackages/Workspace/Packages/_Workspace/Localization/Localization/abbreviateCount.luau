local NumberLocalizationModule = require(script.Parent.NumberLocalization)

return function(p1, p2)
	-- upvalues: NumberLocalizationModule (copy)
	return NumberLocalizationModule.abbreviate(p1, p2)
end
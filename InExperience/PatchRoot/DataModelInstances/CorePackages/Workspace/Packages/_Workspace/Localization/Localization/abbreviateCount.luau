local numberLocalizationModule = require(script.Parent.NumberLocalization)

return function(p1, p2)
	-- upvalues: numberLocalizationModule (ref)
	return numberLocalizationModule.abbreviate(p1, p2)
end
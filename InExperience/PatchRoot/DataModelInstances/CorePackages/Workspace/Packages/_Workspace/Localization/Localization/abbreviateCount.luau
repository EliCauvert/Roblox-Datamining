local numberLocalizationModule = require(script.Parent.NumberLocalization)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: numberLocalizationModule (ref)
	return numberLocalizationModule.abbreviate(p0, p1)
end
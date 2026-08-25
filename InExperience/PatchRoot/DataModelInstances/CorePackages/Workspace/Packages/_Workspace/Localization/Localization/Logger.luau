local localizationPackage = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "LocalizationPackage")
localizationPackage:addSink({
	maxLevel = localizationPackage.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return localizationPackage
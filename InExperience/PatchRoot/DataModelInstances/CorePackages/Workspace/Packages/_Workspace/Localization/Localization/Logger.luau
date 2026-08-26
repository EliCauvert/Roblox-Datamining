local localizationPackage = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "LocalizationPackage")
localizationPackage:addSink({
	maxLevel = localizationPackage.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return localizationPackage
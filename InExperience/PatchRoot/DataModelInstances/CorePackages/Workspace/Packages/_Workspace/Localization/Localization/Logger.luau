local LocalizationPackage = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "LocalizationPackage")
LocalizationPackage:addSink({
	maxLevel = LocalizationPackage.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 10 ]]
		print(p1)
	end
})

return LocalizationPackage
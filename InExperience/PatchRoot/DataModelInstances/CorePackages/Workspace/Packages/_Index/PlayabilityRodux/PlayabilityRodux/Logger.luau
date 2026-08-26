local playabilityRodux = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "PlayabilityRodux")
playabilityRodux:addSink({
	maxLevel = playabilityRodux.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return playabilityRodux
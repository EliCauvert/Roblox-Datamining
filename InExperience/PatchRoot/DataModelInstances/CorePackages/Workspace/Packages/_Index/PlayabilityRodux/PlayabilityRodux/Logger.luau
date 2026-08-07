local playabilityRodux = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "PlayabilityRodux")
playabilityRodux:addSink({
	maxLevel = playabilityRodux.Levels.Warning,
	log = function(_, p0, _) --[[ line: 10 ]]
		print(p0)
	end
})

return playabilityRodux
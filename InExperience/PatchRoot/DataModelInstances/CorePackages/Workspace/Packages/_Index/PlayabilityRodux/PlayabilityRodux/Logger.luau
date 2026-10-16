local PlayabilityRodux = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "PlayabilityRodux")
PlayabilityRodux:addSink({
	maxLevel = PlayabilityRodux.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 10 ]]
		print(p1)
	end
})

return PlayabilityRodux
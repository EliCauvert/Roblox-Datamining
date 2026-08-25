local gameDetailRodux = require(script:FindFirstAncestor("GameDetailRodux").Parent.Lumberyak).Logger.new(nil, "GameDetailRodux")
gameDetailRodux:addSink({
	maxLevel = gameDetailRodux.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return gameDetailRodux
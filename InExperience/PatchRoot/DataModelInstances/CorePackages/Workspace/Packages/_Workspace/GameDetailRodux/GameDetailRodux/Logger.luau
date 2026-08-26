local gameDetailRodux = require(script:FindFirstAncestor("GameDetailRodux").Parent.Lumberyak).Logger.new(nil, "GameDetailRodux")
gameDetailRodux:addSink({
	maxLevel = gameDetailRodux.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return gameDetailRodux
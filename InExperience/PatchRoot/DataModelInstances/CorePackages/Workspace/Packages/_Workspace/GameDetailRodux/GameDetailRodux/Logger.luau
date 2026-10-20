local GameDetailRodux = require(script:FindFirstAncestor("GameDetailRodux").Parent.Lumberyak).Logger.new(nil, "GameDetailRodux")
GameDetailRodux:addSink({
	maxLevel = GameDetailRodux.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return GameDetailRodux
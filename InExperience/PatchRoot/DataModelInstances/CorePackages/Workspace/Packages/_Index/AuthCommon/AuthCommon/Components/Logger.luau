local authentication = require(script:FindFirstAncestor("AuthCommon").Parent.Lumberyak).Logger.new(nil, "Authentication")
authentication:addSink({
	maxLevel = authentication.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return authentication
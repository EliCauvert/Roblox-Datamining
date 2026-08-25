local authentication = require(script:FindFirstAncestor("AuthCommon").Parent.Lumberyak).Logger.new(nil, "Authentication")
authentication:addSink({
	maxLevel = authentication.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return authentication
local Authentication = require(script:FindFirstAncestor("AuthCommon").Parent.Lumberyak).Logger.new(nil, "Authentication")
Authentication:addSink({
	maxLevel = Authentication.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 10 ]]
		print(p1)
	end
})

return Authentication
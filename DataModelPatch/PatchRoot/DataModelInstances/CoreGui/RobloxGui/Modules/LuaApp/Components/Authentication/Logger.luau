local Authentication = require(game:GetService("CorePackages").Packages.Lumberyak).Logger.new(nil, "Authentication")
Authentication:addSink({
	maxLevel = Authentication.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return Authentication
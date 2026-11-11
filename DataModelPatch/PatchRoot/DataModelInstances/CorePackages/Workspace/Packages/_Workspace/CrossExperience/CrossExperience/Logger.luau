local Lumberyak = require(script:FindFirstAncestor("CrossExperience").dependencies).Lumberyak
local CrossExperience = Lumberyak.Logger.new(nil, "CrossExperience")
CrossExperience:addSink({
	maxLevel = game:DefineFastString("CrossExpEventLoggingLevel", Lumberyak.Logger.Levels.Error),
	log = function(_, p1, _)
		print(p1)
	end
})

return CrossExperience
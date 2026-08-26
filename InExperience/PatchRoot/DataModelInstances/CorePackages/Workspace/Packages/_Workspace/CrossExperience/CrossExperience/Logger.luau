local lumberyak = require(script:FindFirstAncestor("CrossExperience").dependencies).Lumberyak
local crossExperience = lumberyak.Logger.new(nil, "CrossExperience")
crossExperience:addSink({
	maxLevel = game:DefineFastString("CrossExpEventLoggingLevel", lumberyak.Logger.Levels.Error),
	log = function(_, p1, _)
		print(p1)
	end
})

return crossExperience
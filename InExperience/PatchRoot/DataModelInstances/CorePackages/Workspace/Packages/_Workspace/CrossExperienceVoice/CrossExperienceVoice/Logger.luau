local crossExperienceVoice = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies).Lumberyak.Logger.new(nil, "CrossExperienceVoice")
crossExperienceVoice:addSink({
	maxLevel = crossExperienceVoice.Levels.Info,
	log = function(_, p1, _)
		print(p1)
	end
})

return crossExperienceVoice
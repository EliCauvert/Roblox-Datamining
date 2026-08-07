local crossExperienceVoice = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies).Lumberyak.Logger.new(nil, "CrossExperienceVoice")
crossExperienceVoice:addSink({
	maxLevel = crossExperienceVoice.Levels.Info,
	log = function(_, p0, _) --[[ line: 10 ]]
		print(p0)
	end
})

return crossExperienceVoice
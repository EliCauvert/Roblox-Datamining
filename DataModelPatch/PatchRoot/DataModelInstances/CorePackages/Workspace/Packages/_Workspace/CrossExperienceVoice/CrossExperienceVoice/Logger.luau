local CrossExperienceVoice = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies).Lumberyak.Logger.new(nil, "CrossExperienceVoice")
CrossExperienceVoice:addSink({
	maxLevel = CrossExperienceVoice.Levels.Info,
	log = function(_, p1, _)
		print(p1)
	end
})

return CrossExperienceVoice
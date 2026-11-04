return function()
	local Success, Result = pcall(function()
		return game:GetService("ExperienceService").OnNewJoinAttempt
	end)
	
	return if Success then Result else nil
end
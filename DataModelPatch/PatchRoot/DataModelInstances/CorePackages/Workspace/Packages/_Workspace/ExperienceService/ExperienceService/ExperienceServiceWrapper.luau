local ExperienceService = game:GetService("ExperienceService")

return {
	LaunchExperience = function(_, p1, Source, Callback)
		-- upvalues: ExperienceService (copy)
		if Source == nil then
			if Callback == nil then
				ExperienceService:LaunchExperience(p1)
				
				return
			else
				ExperienceService:LaunchExperienceFromSourceWithCallback(p1, "", Callback)
				
				return
			end
		elseif Callback == nil then
			ExperienceService:LaunchExperienceFromSource(p1, Source)
			
			return
		else
			ExperienceService:LaunchExperienceFromSourceWithCallback(p1, Source, Callback)
		end
	end,
	RegisterForExperienceJoin = function(_, Callback)
		-- upvalues: ExperienceService (copy)
		return (ExperienceService:RegisterForExperienceJoin(Callback))
	end,
	RegisterForExperienceLeave = function(_, Callback)
		-- upvalues: ExperienceService (copy)
		return (ExperienceService:RegisterForExperienceLeave(Callback))
	end,
	GetPendingJoinAttempt = function(_)
		-- upvalues: ExperienceService (copy)
		return ExperienceService:GetPendingJoinAttempt()
	end,
	OnNewJoinAttempt = function(_)
		-- upvalues: ExperienceService (copy)
		return ExperienceService.OnNewJoinAttempt
	end
}
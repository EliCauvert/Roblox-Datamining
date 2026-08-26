local experienceService = game:GetService("ExperienceService")

return {
	LaunchExperience = function(_, p1, p2, p3)
		-- upvalues: experienceService (ref)
		if p2 == nil then
			if p3 == nil then
				experienceService:LaunchExperience(p1)
				
				return
			end
			experienceService:LaunchExperienceFromSourceWithCallback(p1, "", p3)
			
			return
		elseif p3 == nil then
			experienceService:LaunchExperienceFromSource(p1, p2)
			
			return
		end
		experienceService:LaunchExperienceFromSourceWithCallback(p1, p2, p3)
	end,
	RegisterForExperienceJoin = function(_, p1)
		-- upvalues: experienceService (ref)
		return experienceService:RegisterForExperienceJoin(p1)
	end,
	RegisterForExperienceLeave = function(_, p1)
		-- upvalues: experienceService (ref)
		return experienceService:RegisterForExperienceLeave(p1)
	end,
	GetPendingJoinAttempt = function(_)
		-- upvalues: experienceService (ref)
		return experienceService:GetPendingJoinAttempt()
	end,
	OnNewJoinAttempt = function(_)
		-- upvalues: experienceService (ref)
		return experienceService.OnNewJoinAttempt
	end
}
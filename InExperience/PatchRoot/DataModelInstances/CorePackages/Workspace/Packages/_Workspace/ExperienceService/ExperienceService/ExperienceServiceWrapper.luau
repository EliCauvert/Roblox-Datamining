local experienceService = game:GetService("ExperienceService")

return {
	LaunchExperience = function(_, p0, p1, p2)
		-- upvalues: experienceService (ref)
		if p1 == nil then
			if p2 == nil then
				experienceService:LaunchExperience(p0)
				
				return
			end
			experienceService:LaunchExperienceFromSourceWithCallback(p0, "", p2)
			
			return
		elseif p2 == nil then
			experienceService:LaunchExperienceFromSource(p0, p1)
			
			return
		end
		experienceService:LaunchExperienceFromSourceWithCallback(p0, p1, p2)
	end,
	RegisterForExperienceJoin = function(_, p3)
		-- upvalues: experienceService (ref)
		return experienceService:RegisterForExperienceJoin(p3)
	end,
	RegisterForExperienceLeave = function(_, p4)
		-- upvalues: experienceService (ref)
		return experienceService:RegisterForExperienceLeave(p4)
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
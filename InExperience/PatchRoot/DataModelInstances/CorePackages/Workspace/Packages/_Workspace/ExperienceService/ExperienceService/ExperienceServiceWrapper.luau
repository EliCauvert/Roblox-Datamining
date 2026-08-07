local experienceService = game:GetService("ExperienceService")

return {
	LaunchExperience = function(_, p0, p1, p2) --[[ line: 3 ]]
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
	RegisterForExperienceJoin = function(_, p3) --[[ line: 18 ]]
		-- upvalues: experienceService (ref)
		return experienceService:RegisterForExperienceJoin(p3)
	end,
	RegisterForExperienceLeave = function(_, p4) --[[ line: 22 ]]
		-- upvalues: experienceService (ref)
		return experienceService:RegisterForExperienceLeave(p4)
	end,
	GetPendingJoinAttempt = function(_) --[[ line: 27 ]]
		-- upvalues: experienceService (ref)
		return experienceService:GetPendingJoinAttempt()
	end,
	OnNewJoinAttempt = function(_) --[[ line: 31 ]]
		-- upvalues: experienceService (ref)
		return experienceService.OnNewJoinAttempt
	end
}
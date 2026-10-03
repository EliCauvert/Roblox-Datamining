local pioneerUtils = script:FindFirstAncestor("PioneerUtils")
local experienceService = require(pioneerUtils.Parent.ExperienceService).ExperienceService
local _ = require(pioneerUtils.PioneerLeaveReason)

return function(p1)
	-- upvalues: experienceService (ref)
	experienceService:LeaveExperienceWithReason(p1)
end
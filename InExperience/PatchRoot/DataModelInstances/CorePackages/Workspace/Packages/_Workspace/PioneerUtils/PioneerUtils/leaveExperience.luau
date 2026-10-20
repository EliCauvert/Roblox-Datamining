local PioneerUtils = script:FindFirstAncestor("PioneerUtils")
local ExperienceService = require(PioneerUtils.Parent.ExperienceService).ExperienceService
local _ = require(PioneerUtils.PioneerLeaveReason)

return function(Reason)
	-- upvalues: ExperienceService (copy)
	ExperienceService:LeaveExperienceWithReason(Reason)
end
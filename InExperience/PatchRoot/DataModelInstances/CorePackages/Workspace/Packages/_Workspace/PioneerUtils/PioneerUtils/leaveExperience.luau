local PioneerUtils = script:FindFirstAncestor("PioneerUtils")
local ExperienceService = require(PioneerUtils.Parent.ExperienceService).ExperienceService
local _ = require(PioneerUtils.PioneerLeaveReason)

return function(Reason) --[[ Line: 10 | Named "leaveExperience" ]]
	-- upvalues: ExperienceService (copy)
	ExperienceService:LeaveExperienceWithReason(Reason)
end
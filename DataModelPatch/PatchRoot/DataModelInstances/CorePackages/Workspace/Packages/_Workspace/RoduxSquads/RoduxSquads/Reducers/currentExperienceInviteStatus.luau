local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local RoduxModule = require(RoduxSquads.Parent.Rodux)
local CurrentExperienceInviteStatusUpdated = require(RoduxSquads.Actions).CurrentExperienceInviteStatusUpdated
local _ = require(script.Parent.Parent.RoduxSquadsTypes)

return function()
	-- upvalues: RoduxModule (copy), CurrentExperienceInviteStatusUpdated (copy)
	return RoduxModule.createReducer(false, {
		[CurrentExperienceInviteStatusUpdated.name] = function(_, p1)
			return p1.payload.isExperienceInvitePending
		end
	})
end
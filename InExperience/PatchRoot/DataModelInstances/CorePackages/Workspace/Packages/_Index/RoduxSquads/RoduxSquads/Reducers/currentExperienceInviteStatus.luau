local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local roduxModule = require(roduxSquads.Parent.Rodux)
local currentExperienceInviteStatusUpdated = require(roduxSquads.Actions).CurrentExperienceInviteStatusUpdated
local _ = require(script.Parent.Parent.RoduxSquadsTypes)

return function()
	-- upvalues: roduxModule (ref), currentExperienceInviteStatusUpdated (ref)
	return roduxModule.createReducer(false, {
		[currentExperienceInviteStatusUpdated.name] = function(_, p0)
			return p0.payload.isExperienceInvitePending
		end
	})
end
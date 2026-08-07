local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local roduxModule = require(roduxSquads.Parent.Rodux)
local currentExperienceInviteStatusUpdated = require(roduxSquads.Actions).CurrentExperienceInviteStatusUpdated
local _ = require(script.Parent.Parent.RoduxSquadsTypes)

return function() --[[ line: 12 ]]
	-- upvalues: roduxModule (ref), currentExperienceInviteStatusUpdated (ref)
	return roduxModule.createReducer(false, {
		[currentExperienceInviteStatusUpdated.name] = function(_, p0) --[[ line: 14 ]]
			return p0.payload.isExperienceInvitePending
		end
	})
end
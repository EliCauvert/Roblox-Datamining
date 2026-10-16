local parent = script:FindFirstAncestor("SquadsCore").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal(false)
	
	return {
		getIsExperienceInvitePending = var1,
		currentExperienceInviteStatusUpdated = function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end
	}
end
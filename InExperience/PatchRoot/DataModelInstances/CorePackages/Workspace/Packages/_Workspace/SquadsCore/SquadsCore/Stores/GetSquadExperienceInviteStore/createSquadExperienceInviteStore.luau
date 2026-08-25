local parent = script:FindFirstAncestor("SquadsCore").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var0, var1 = createSessionScopedSignal(false)
	
	return {
		getIsExperienceInvitePending = var0,
		currentExperienceInviteStatusUpdated = function(p0)
			-- upvalues: var1 (ref)
			var1(p0)
		end
	}
end
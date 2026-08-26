local parent = script:FindFirstAncestor("NotificationsCommon").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal({})
	
	return {
		getGameInvitesStatus = var1,
		receivedUserInviteStatus = function(p1, p2)
			-- upvalues: var2 (ref)
			local var3 = tostring(p1)
			var2(function(p3)
				-- upvalues: var3 (ref), p2 (ref)
				local cloned = table.clone(p3)
				cloned[var3] = p2
				
				return cloned
			end)
		end,
		reset = function()
			-- upvalues: var2 (ref)
			var2({})
		end
	}
end
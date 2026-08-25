local parent = script:FindFirstAncestor("NotificationsCommon").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var0, var1 = createSessionScopedSignal({})
	
	return {
		getGameInvitesStatus = var0,
		receivedUserInviteStatus = function(p0, p1)
			-- upvalues: var1 (ref)
			local var2 = tostring(p0)
			var1(function(p2)
				-- upvalues: var2 (ref), p1 (ref)
				local cloned = table.clone(p2)
				cloned[var2] = p1
				
				return cloned
			end)
		end,
		reset = function()
			-- upvalues: var1 (ref)
			var1({})
		end
	}
end
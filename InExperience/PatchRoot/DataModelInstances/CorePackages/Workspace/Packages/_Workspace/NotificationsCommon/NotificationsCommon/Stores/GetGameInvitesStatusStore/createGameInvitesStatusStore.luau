local Parent = script:FindFirstAncestor("NotificationsCommon").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction({})
	
	return {
		getGameInvitesStatus = SessionScopedSignal,
		receivedUserInviteStatus = function(p1, p2)
			-- upvalues: SessionScopedSignal2 (copy)
			local Text = tostring(p1)
			SessionScopedSignal2(function(Tbl)
				-- upvalues: Text (copy), p2 (copy)
				local Copy = table.clone(Tbl)
				Copy[Text] = p2
				
				return Copy
			end)
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({})
		end
	}
end
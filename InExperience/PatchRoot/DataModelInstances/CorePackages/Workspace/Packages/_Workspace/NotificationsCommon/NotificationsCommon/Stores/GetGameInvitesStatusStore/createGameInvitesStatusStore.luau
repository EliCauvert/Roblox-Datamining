local Parent = script:FindFirstAncestor("NotificationsCommon").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function() --[[ Line: 15 ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction({})
	
	return {
		getGameInvitesStatus = SessionScopedSignal,
		receivedUserInviteStatus = function(p1, p2) --[[ Line: 18 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			local Text = tostring(p1)
			SessionScopedSignal2(function(Tbl) --[[ Line: 20 ]]
				-- upvalues: Text (copy), p2 (copy)
				local Copy = table.clone(Tbl)
				Copy[Text] = p2
				
				return Copy
			end)
		end,
		reset = function() --[[ Line: 27 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({})
		end
	}
end
local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local parent = playerContextualMenu.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local blockingModule = require(playerContextualMenu.Http.Blocking)

return roduxModule.createReducer({}, {
	[blockingModule.GetBlockedUsers.Succeeded.name] = function(_, p1)
		local t = {}
		
		for i, v in ipairs(if p1.responseBody then p1.responseBody.blockedUsers else {}) do
			t[tostring(v.userId)] = true
		end
		return t
	end,
	[blockingModule.BlockUserById.Succeeded.name] = function(p2, p3)
		-- upvalues: dashModule (ref)
		return dashModule.join(p2, { [tostring(p3.namedIds.users)] = true })
	end,
	[blockingModule.UnblockUserById.Succeeded.name] = function(p2, p3)
		-- upvalues: dashModule (ref)
		return dashModule.join(p2, { [tostring(p3.namedIds.users)] = false })
	end
})
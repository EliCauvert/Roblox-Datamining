local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local parent = playerContextualMenu.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local blockingModule = require(playerContextualMenu.Http.Blocking)

return roduxModule.createReducer({}, {
	[blockingModule.GetBlockedUsers.Succeeded.name] = function(_, p0) --[[ line: 12 ]]
		local t = {}
		
		for i, v in ipairs(if p0.responseBody then p0.responseBody.blockedUsers else {}) do
			t[tostring(v.userId)] = true
		end
		return t
	end,
	[blockingModule.BlockUserById.Succeeded.name] = function(p1, p2) --[[ line: 21 ]]
		-- upvalues: dashModule (ref)
		return dashModule.join(p1, { [tostring(p2.namedIds.users)] = true })
	end,
	[blockingModule.UnblockUserById.Succeeded.name] = function(p3, p4) --[[ line: 27 ]]
		-- upvalues: dashModule (ref)
		return dashModule.join(p3, { [tostring(p4.namedIds.users)] = false })
	end
})
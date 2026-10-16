local PlayerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local Parent = PlayerContextualMenu.Parent
local DashModule = require(Parent.Dash)
local BlockingModule = require(PlayerContextualMenu.Http.Blocking)

return require(Parent.Rodux).createReducer({}, {
	[BlockingModule.GetBlockedUsers.Succeeded.name] = function(_, p1) --[[ Line: 12 ]]
		local t = {}
		
		for _, value in ipairs(p1.responseBody and p1.responseBody.blockedUsers or {}) do
			t[tostring(value.userId)] = true
		end
		return t
	end,
	[BlockingModule.BlockUserById.Succeeded.name] = function(p2, p3) --[[ Line: 21 ]]
		-- upvalues: DashModule (copy)
		return DashModule.join(p2, { [tostring(p3.namedIds.users)] = true })
	end,
	[BlockingModule.UnblockUserById.Succeeded.name] = function(p2, p3) --[[ Line: 27 ]]
		-- upvalues: DashModule (copy)
		return DashModule.join(p2, { [tostring(p3.namedIds.users)] = false })
	end
})
local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReactModule = require(Parent.React)
local JoinFriendFromExperienceModule = require(script.Parent.joinFriendFromExperience)

local function _()
	-- upvalues: Parent (copy)
	return require(Parent.GameJoinCard).getInExperienceGameJoinCard()
end

return function()
	-- upvalues: ReactModule (copy), JoinFriendFromExperienceModule (copy), Parent (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return {
		userId = UseStateResult,
		open = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p1)
		end, {}),
		close = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		join = JoinFriendFromExperienceModule,
		cardComponent = if UseStateResult then require(Parent.GameJoinCard).getInExperienceGameJoinCard() else nil
	}
end
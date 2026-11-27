local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local GameInviteLeaveServerConfirmationModule = require(script.Parent.GameInviteLeaveServerConfirmation)
local JoinFriendFromExperienceModule = require(script.Parent.joinFriendFromExperience)
local IsInOtherServerOfThisExperienceModule = require(GameInvite.utils.isInOtherServerOfThisExperience)
local config = { skipFetch = true }

local function _()
	-- upvalues: Parent (copy)
	return require(Parent.GameJoinCard).getInExperienceGameJoinCard()
end

return function(p1, p2)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), config (copy), IsInOtherServerOfThisExperienceModule (copy), GameInviteLeaveServerConfirmationModule (copy), Parent (copy), JoinFriendFromExperienceModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return {
		userId = if UseStateResult then UseStateResult.userId else nil,
		open = ReactModule.useCallback(function(UserId)
			-- upvalues: DataHydrationModule (upval), config (upval), UseStateResult2 (copy), IsInOtherServerOfThisExperienceModule (upval), p1 (copy), p2 (copy)
			UseStateResult2({
				userId = UserId,
				isLeavingServer = IsInOtherServerOfThisExperienceModule(DataHydrationModule.Presence.PresenceStore.get().GetPresenceByUserId(UserId, config).data(false), p1, p2)
			})
		end, { p1, p2 }),
		close = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		join = JoinFriendFromExperienceModule,
		cardComponent = if UseStateResult == nil then nil elseif UseStateResult.isLeavingServer then GameInviteLeaveServerConfirmationModule else require(Parent.GameJoinCard).getInExperienceGameJoinCard()
	}
end
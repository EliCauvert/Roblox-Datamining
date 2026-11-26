local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local GameInviteLeaveServerConfirmationModule = require(script.Parent.GameInviteLeaveServerConfirmation)
local JoinFriendFromExperienceModule = require(script.Parent.joinFriendFromExperience)
local IsInOtherServerOfThisExperienceModule = require(GameInvite.utils.isInOtherServerOfThisExperience)
local IsJoinVisibleModule = require(GameInvite.utils.isJoinVisible)
local FFlagGameInviteHidePresenceInOtherExperienceModule = require(GameInvite.Flags.FFlagGameInviteHidePresenceInOtherExperience)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local config = { skipFetch = true }

local function _()
	-- upvalues: Parent (copy)
	return require(Parent.GameJoinCard).getInExperienceGameJoinCard()
end

return function(p1, p2)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), config (copy), FFlagGameInviteHidePresenceInOtherExperienceModule (copy), NotificationsCommonModule (copy), IsJoinVisibleModule (copy), IsInOtherServerOfThisExperienceModule (copy), GameInviteLeaveServerConfirmationModule (copy), Parent (copy), JoinFriendFromExperienceModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return {
		userId = if UseStateResult then UseStateResult.userId else nil,
		open = ReactModule.useCallback(function(UserId)
			-- upvalues: DataHydrationModule (upval), config (upval), FFlagGameInviteHidePresenceInOtherExperienceModule (upval), NotificationsCommonModule (upval), IsJoinVisibleModule (upval), p2 (copy), UseStateResult2 (copy), IsInOtherServerOfThisExperienceModule (upval), p1 (copy)
			local DataResult = DataHydrationModule.Presence.PresenceStore.get().GetPresenceByUserId(UserId, config).data(false)
			
			if not FFlagGameInviteHidePresenceInOtherExperienceModule or not NotificationsCommonModule.isGameInviteJoinForPioneerEnabled or IsJoinVisibleModule(DataResult, p2) then
				UseStateResult2({
					userId = UserId,
					isLeavingServer = IsInOtherServerOfThisExperienceModule(DataResult, p1, p2)
				})
				
				return
			end
		end, { p1, p2 }),
		close = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		join = JoinFriendFromExperienceModule,
		cardComponent = if UseStateResult == nil then nil elseif UseStateResult.isLeavingServer then GameInviteLeaveServerConfirmationModule else require(Parent.GameJoinCard).getInExperienceGameJoinCard()
	}
end
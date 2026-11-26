local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local LocalizationHelper = require(Parent.NotificationsCommon).LocalizationHelper
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local IsInOtherServerOfThisExperienceModule = require(GameInvite.utils.isInOtherServerOfThisExperience)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local GetLocalizedStringsFunction = LocalizationHelper.getLocalizedStrings
local config = { skipFetch = true }
local config1 = { join = "Feature.Profile.Action.JoinGame" }

return function(p1)
	-- upvalues: UseGetPresenceByUserIdFunction (copy), config (copy), GetLocalizedStringsFunction (copy), config1 (copy), IsInOtherServerOfThisExperienceModule (copy), ReactModule (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(p1.userId, config)
	local LocalizedStrings = GetLocalizedStringsFunction(config1)
	
	return if IsInOtherServerOfThisExperienceModule(UseGetPresenceByUserIdResult, p1.universeId, p1.jobId) then ReactModule.createElement(Button, {
		isDisabled = false,
		isLoading = false,
		fitContent = true,
		buttonType = ButtonType.Secondary,
		onActivated = function()
			-- upvalues: p1 (copy)
			p1.onJoin(p1.userId)
		end,
		standardSize = StandardButtonSize.XSmall,
		text = LocalizedStrings.join,
		layoutOrder = p1.layoutOrder
	}) else nil
end
local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.UserList)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local UserModel = require(Parent.UserLib).Models.UserModel
local GameInviteInviteButtonModule = require(script.Parent.GameInviteInviteButton)
local FriendMetadataLineModule = require(script.Parent.friendMetadataLine)
local FFlagGameInviteHidePresenceInOtherExperienceModule = require(GameInvite.Flags.FFlagGameInviteHidePresenceInOtherExperience)
local FFlagGameInviteInExpLivePresenceModule = require(GameInvite.Flags.FFlagGameInviteInExpLivePresence)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local IsInCurrentExperienceModule = require(GameInvite.utils.isInCurrentExperience)
local config = { skipFetch = true }
local PresenceType = DataHydrationModule.Presence.PresenceEnums.PresenceType
local config1 = {
	[UserModel.PresenceType.ONLINE] = "Online",
	[UserModel.PresenceType.IN_GAME] = "InGame",
	[UserModel.PresenceType.IN_STUDIO] = "InStudio",
	[UserModel.PresenceType.OFFLINE] = "Offline"
}

return function(p1)
	-- upvalues: NotificationsCommonModule (copy), UseLocalizationFunction (copy), FFlagGameInviteInExpLivePresenceModule (copy), FriendMetadataLineModule (copy), config1 (copy), UseGetPresenceByUserIdFunction (copy), config (copy), FFlagGameInviteHidePresenceInOtherExperienceModule (copy), IsInCurrentExperienceModule (copy), PresenceType (copy), ReactModule (copy), GameInviteInviteButtonModule (copy)
	local IsGameInviteJoinForPioneerEnabled = NotificationsCommonModule.isGameInviteJoinForPioneerEnabled
	local Friend = p1.friend
	local Id = Friend.id
	local RowNumber = p1.rowNumber
	local UseLocalizationResult = UseLocalizationFunction({
		inStudio = "Common.Presence.Label.RobloxStudio",
		online = if FFlagGameInviteInExpLivePresenceModule or IsGameInviteJoinForPioneerEnabled then "Common.Presence.Label.Online" else nil
	})
	local ContextText = FriendMetadataLineModule.getContextText(Friend, UseLocalizationResult)
	local LivePresenceType = nil
	
	if FFlagGameInviteInExpLivePresenceModule or IsGameInviteJoinForPioneerEnabled then
		LivePresenceType = config1[Friend.presence]
		local LastLocation = Friend.lastLocation
		local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(Id, config)
		
		if UseGetPresenceByUserIdResult ~= nil then
			LivePresenceType = FriendMetadataLineModule.getLivePresenceType(UseGetPresenceByUserIdResult)
			LastLocation = UseGetPresenceByUserIdResult.lastLocation
		end
		if FFlagGameInviteHidePresenceInOtherExperienceModule and IsGameInviteJoinForPioneerEnabled and not IsInCurrentExperienceModule(UseGetPresenceByUserIdResult) then
			LivePresenceType = PresenceType.Offline
			LastLocation = nil
		end
		ContextText = FriendMetadataLineModule.getContextTextForPresence(LivePresenceType, LastLocation, UseLocalizationResult)
	end
	return p1.createRow({
		contextualInfo = ReactModule.useMemo(function()
			-- upvalues: ContextText (ref)
			return if ContextText == nil then nil else { text = ContextText }
		end, { ContextText }),
		presence = if FFlagGameInviteInExpLivePresenceModule or IsGameInviteJoinForPioneerEnabled then LivePresenceType else config1[Friend.presence],
		trailingContent = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), GameInviteInviteButtonModule (upval), Id (copy), RowNumber (copy)
			return ReactModule.createElement(GameInviteInviteButtonModule, { userId = Id, rowNumber = RowNumber })
		end, { Id, RowNumber })
	})
end
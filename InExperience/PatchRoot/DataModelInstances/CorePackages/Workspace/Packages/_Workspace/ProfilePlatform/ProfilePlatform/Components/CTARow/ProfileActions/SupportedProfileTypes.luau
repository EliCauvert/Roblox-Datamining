local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local sharedFlagsModule = require(profilePlatform.Parent.SharedFlags)
local enumsModule = require(profilePlatform.Common.Enums)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagEnablePlatformProfileContextualMenuOption = sharedFlagsModule.FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformEnableCurrencyTransfer = sharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local fFlagPendingIncomingTrustedConnectionModule = require(profilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local list = {
	enumsModule.ProfileActions.AddFriend,
	enumsModule.ProfileActions.CannotAddFriend,
	enumsModule.ProfileActions.AcceptFriendRequest,
	enumsModule.ProfileActions.AcceptOffNetworkFriendRequest,
	enumsModule.ProfileActions.Block, enumsModule.ProfileActions.Unblock,
	enumsModule.ProfileActions.Chat, enumsModule.ProfileActions.EditAlias,
	enumsModule.ProfileActions.EditAvatar, enumsModule.ProfileActions.EditProfile,
	enumsModule.ProfileActions.IgnoreFriendRequest,
	enumsModule.ProfileActions.JoinExperience,
	enumsModule.ProfileActions.PendingFriendRequest,
	enumsModule.ProfileActions.QrCode, enumsModule.ProfileActions.Report,
	enumsModule.ProfileActions.ShareProfile, enumsModule.ProfileActions.Unfriend,
	enumsModule.ProfileActions.RemoveTrustedConnection
}

if require(profilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat) then
	table.insert(list, enumsModule.ProfileActions.UnlockChat)
end
if fFlagProfilePlatformEnableEditAppearanceMenuModule then
	table.insert(list, enumsModule.ProfileActions.EditAppearance)
	table.insert(list, enumsModule.ProfileActions.EditEmotes)
	table.insert(list, enumsModule.ProfileActions.SwitchAvatar)
	
	if fFlagProfilePlatformEditBackgroundMenuItemModule then
		table.insert(list, enumsModule.ProfileActions.EditBackground)
	end
end
if fFlagProfilePlatformEnableEditLookModule then
	table.insert(list, enumsModule.ProfileActions.EditLook)
end
if fFlagProfilePlatformEnableCurrencyTransfer then
	table.insert(list, enumsModule.ProfileActions.CurrencyTransfer)
end
if fFlagProfilePlatformEnableTradeItemsModule then
	table.insert(list, enumsModule.ProfileActions.TradeItems)
end
if fFlagProfilePlatformAddTC then
	table.insert(list, enumsModule.ProfileActions.AddTrustedConnection)
	table.insert(list, enumsModule.ProfileActions.AddIncomingTrustedConnection)
	table.insert(list, enumsModule.ProfileActions.PendingTrustedConnection)
end
table.insert(list, enumsModule.ProfileActions.AddTrustedConnectionViaLink)

if fFlagPendingIncomingTrustedConnectionModule then
	table.insert(list, enumsModule.ProfileActions.PendingIncomingTrustedConnection)
end
if fFlagProfilePlatformNewProfileHeader then
	table.insert(list, enumsModule.ProfileActions.ViewAbout)
end
if fFlagEnablePlatformProfileContextualMenuOption then
	table.insert(list, enumsModule.ProfileActions.ViewPlatformProfile)
end
local t = {}
table.insert(t, enumsModule.ProfileActions.CopyLink)
table.insert(t, enumsModule.ProfileActions.JoinCommunity)
table.insert(t, enumsModule.ProfileActions.CancelJoinCommunityRequest)
table.insert(t, enumsModule.ProfileActions.ViewCommunity)
table.insert(t, enumsModule.ProfileActions.LeaveCommunity)
table.insert(t, enumsModule.ProfileActions.MakePrimaryCommunity)
table.insert(t, enumsModule.ProfileActions.RemovePrimaryCommunity)
table.insert(t, enumsModule.ProfileActions.Report)

if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then
	table.insert(t, enumsModule.ProfileActions.ViewFullProfile)
	table.insert(t, enumsModule.ProfileActions.Follow)
	table.insert(t, enumsModule.ProfileActions.Unfollow)
end
return {
	[profileTypes.User] = list,
	[profileTypes.Community] = t,
	[profileTypes.Contact] = {
		enumsModule.ProfileActions.AddFriendFromContacts,
		enumsModule.ProfileActions.AddFriendFromContactsSent
	}
}
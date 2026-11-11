local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local SharedFlagsModule = require(ProfilePlatform.Parent.SharedFlags)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableEditLookModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagEnablePlatformProfileContextualMenuOption = SharedFlagsModule.FFlagEnablePlatformProfileContextualMenuOption
local FFlagProfilePlatformEnableCurrencyTransfer = SharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformAddTC = SharedFlagsModule.FFlagProfilePlatformAddTC
local FFlagPendingIncomingTrustedConnectionModule = require(ProfilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local List = {
	EnumsModule.ProfileActions.AddFriend,
	EnumsModule.ProfileActions.CannotAddFriend,
	EnumsModule.ProfileActions.AcceptFriendRequest,
	EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest,
	EnumsModule.ProfileActions.Block, EnumsModule.ProfileActions.Unblock,
	EnumsModule.ProfileActions.Chat, EnumsModule.ProfileActions.EditAlias,
	EnumsModule.ProfileActions.EditAvatar, EnumsModule.ProfileActions.EditProfile,
	EnumsModule.ProfileActions.IgnoreFriendRequest,
	EnumsModule.ProfileActions.JoinExperience,
	EnumsModule.ProfileActions.PendingFriendRequest,
	EnumsModule.ProfileActions.QrCode, EnumsModule.ProfileActions.Report,
	EnumsModule.ProfileActions.ShareProfile, EnumsModule.ProfileActions.Unfriend,
	EnumsModule.ProfileActions.RemoveTrustedConnection
}

if require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat) then
	table.insert(List, EnumsModule.ProfileActions.UnlockChat)
end
if FFlagProfilePlatformEnableEditAppearanceMenuModule then
	table.insert(List, EnumsModule.ProfileActions.EditAppearance)
	table.insert(List, EnumsModule.ProfileActions.EditEmotes)
	table.insert(List, EnumsModule.ProfileActions.SwitchAvatar)
	
	if FFlagProfilePlatformEditBackgroundMenuItemModule then
		table.insert(List, EnumsModule.ProfileActions.EditBackground)
	end
end
if FFlagProfilePlatformEnableEditLookModule then
	table.insert(List, EnumsModule.ProfileActions.EditLook)
end
if FFlagProfilePlatformEnableCurrencyTransfer then
	table.insert(List, EnumsModule.ProfileActions.CurrencyTransfer)
end
if FFlagProfilePlatformAddTC then
	table.insert(List, EnumsModule.ProfileActions.AddTrustedConnection)
	table.insert(List, EnumsModule.ProfileActions.AddIncomingTrustedConnection)
	table.insert(List, EnumsModule.ProfileActions.PendingTrustedConnection)
end
table.insert(List, EnumsModule.ProfileActions.AddTrustedConnectionViaLink)

if FFlagPendingIncomingTrustedConnectionModule then
	table.insert(List, EnumsModule.ProfileActions.PendingIncomingTrustedConnection)
end
if FFlagProfilePlatformNewProfileHeader then
	table.insert(List, EnumsModule.ProfileActions.ViewAbout)
end
if FFlagEnablePlatformProfileContextualMenuOption then
	table.insert(List, EnumsModule.ProfileActions.ViewPlatformProfile)
end
local List1 = {}
table.insert(List1, EnumsModule.ProfileActions.CopyLink)
table.insert(List1, EnumsModule.ProfileActions.JoinCommunity)
table.insert(List1, EnumsModule.ProfileActions.CancelJoinCommunityRequest)
table.insert(List1, EnumsModule.ProfileActions.ViewCommunity)
table.insert(List1, EnumsModule.ProfileActions.LeaveCommunity)
table.insert(List1, EnumsModule.ProfileActions.MakePrimaryCommunity)
table.insert(List1, EnumsModule.ProfileActions.RemovePrimaryCommunity)
table.insert(List1, EnumsModule.ProfileActions.Report)

if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then
	table.insert(List1, EnumsModule.ProfileActions.ViewFullProfile)
	table.insert(List1, EnumsModule.ProfileActions.Follow)
	table.insert(List1, EnumsModule.ProfileActions.Unfollow)
end
return {
	[ProfileTypes.User] = List,
	[ProfileTypes.Community] = List1,
	[ProfileTypes.Contact] = {
		EnumsModule.ProfileActions.AddFriendFromContacts,
		EnumsModule.ProfileActions.AddFriendFromContactsSent
	}
}
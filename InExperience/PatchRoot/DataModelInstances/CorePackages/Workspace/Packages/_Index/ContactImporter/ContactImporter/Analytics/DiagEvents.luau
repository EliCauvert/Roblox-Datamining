local eventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[eventNamesModule.ContactImportModalPageLoad] = {
		name = game:DefineFastString("ContactImportModalPageLoadCounter", "ContactImportModalPageLoad")
	},
	[eventNamesModule.ContactImportModalClose] = {
		name = game:DefineFastString("ContactImportModalCloseCounter", "ContactImportModalClose")
	},
	[eventNamesModule.ContactImportModalContinue] = {
		name = game:DefineFastString("ContactImportModalContinueCounter", "ContactImportModalContinue")
	},
	[eventNamesModule.ContactImportModalAddFriends] = {
		name = game:DefineFastString("ContactImportModalAddFriendsCounter", "ContactImportModalAddFriends")
	},
	[eventNamesModule.ContactsListLoaded] = {
		name = game:DefineFastString("ContactsListLoadedCounter", "ContactsListLoaded")
	},
	[eventNamesModule.RequestFriendship] = {
		name = game:DefineFastString("ContactImporterRequestFriendshipCounter", "ContactImporterFriendshipRequest")
	},
	[eventNamesModule.InviteContact] = {
		name = game:DefineFastString("ContactImporterInviteContactCounter", "ContactImporterInviteContact")
	},
	[eventNamesModule.ContactImportingTime] = {
		name = game:DefineFastString("ContactImportingTimeStat", "ContactImportingTime")
	},
	[eventNamesModule.CloseContactListButton] = {
		name = game:DefineFastString("CloseContactListButtonCounter", "CloseContactListButton")
	},
	[eventNamesModule.CloseContactListCross] = {
		name = game:DefineFastString("CloseContactListCrossCounter", "CloseContactListCross")
	},
	[eventNamesModule.PhoneVerificationWebview] = {
		name = game:DefineFastString("PhoneVerificationWebviewCounter", "PhoneVerificationWebview")
	},
	[eventNamesModule.PhoneVerificationClose] = {
		name = game:DefineFastString("PhoneVerificationCloseCounter", "PhoneVerificationCloseWebview")
	},
	[eventNamesModule.FailedGetContactsFromDevice] = {
		name = game:DefineFastString("FailedGetContactsFromDeviceCounter", "FailedGetContactsFromDevice")
	},
	[eventNamesModule.FailedFormatContactsFromDevice] = {
		name = game:DefineFastString("FailedFormatContactsFromDeviceCounter", "FailedFormatContactsFromDevice")
	},
	[eventNamesModule.FailedUploadContactsFromDevice] = {
		name = game:DefineFastString("FailedUploadContactsFromDeviceCounter", "FailedUploadContactsFromDevice")
	},
	[eventNamesModule.FailedFindContacts] = {
		name = game:DefineFastString("FailedFindContactsCounter", "FailedFindContacts")
	},
	[eventNamesModule.FailedGetContactEntities] = {
		name = game:DefineFastString("FailedGetContactEntitiesCounter", "FailedGetContactEntities")
	},
	[eventNamesModule.FindFriendsButtonClicked] = {
		name = game:DefineFastString("FindFriendsButtonClickedCounter", "FindFriendsButtonClicked")
	}
}
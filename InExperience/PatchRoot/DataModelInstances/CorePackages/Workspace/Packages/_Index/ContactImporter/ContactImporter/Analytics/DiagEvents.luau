local EventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[EventNamesModule.ContactImportModalPageLoad] = {
		name = game:DefineFastString("ContactImportModalPageLoadCounter", "ContactImportModalPageLoad")
	},
	[EventNamesModule.ContactImportModalClose] = {
		name = game:DefineFastString("ContactImportModalCloseCounter", "ContactImportModalClose")
	},
	[EventNamesModule.ContactImportModalContinue] = {
		name = game:DefineFastString("ContactImportModalContinueCounter", "ContactImportModalContinue")
	},
	[EventNamesModule.ContactImportModalAddFriends] = {
		name = game:DefineFastString("ContactImportModalAddFriendsCounter", "ContactImportModalAddFriends")
	},
	[EventNamesModule.ContactsListLoaded] = {
		name = game:DefineFastString("ContactsListLoadedCounter", "ContactsListLoaded")
	},
	[EventNamesModule.RequestFriendship] = {
		name = game:DefineFastString("ContactImporterRequestFriendshipCounter", "ContactImporterFriendshipRequest")
	},
	[EventNamesModule.InviteContact] = {
		name = game:DefineFastString("ContactImporterInviteContactCounter", "ContactImporterInviteContact")
	},
	[EventNamesModule.ContactImportingTime] = {
		name = game:DefineFastString("ContactImportingTimeStat", "ContactImportingTime")
	},
	[EventNamesModule.CloseContactListButton] = {
		name = game:DefineFastString("CloseContactListButtonCounter", "CloseContactListButton")
	},
	[EventNamesModule.CloseContactListCross] = {
		name = game:DefineFastString("CloseContactListCrossCounter", "CloseContactListCross")
	},
	[EventNamesModule.PhoneVerificationWebview] = {
		name = game:DefineFastString("PhoneVerificationWebviewCounter", "PhoneVerificationWebview")
	},
	[EventNamesModule.PhoneVerificationClose] = {
		name = game:DefineFastString("PhoneVerificationCloseCounter", "PhoneVerificationCloseWebview")
	},
	[EventNamesModule.FailedGetContactsFromDevice] = {
		name = game:DefineFastString("FailedGetContactsFromDeviceCounter", "FailedGetContactsFromDevice")
	},
	[EventNamesModule.FailedFormatContactsFromDevice] = {
		name = game:DefineFastString("FailedFormatContactsFromDeviceCounter", "FailedFormatContactsFromDevice")
	},
	[EventNamesModule.FailedUploadContactsFromDevice] = {
		name = game:DefineFastString("FailedUploadContactsFromDeviceCounter", "FailedUploadContactsFromDevice")
	},
	[EventNamesModule.FailedFindContacts] = {
		name = game:DefineFastString("FailedFindContactsCounter", "FailedFindContacts")
	},
	[EventNamesModule.FailedGetContactEntities] = {
		name = game:DefineFastString("FailedGetContactEntitiesCounter", "FailedGetContactEntities")
	},
	[EventNamesModule.FindFriendsButtonClicked] = {
		name = game:DefineFastString("FindFriendsButtonClickedCounter", "FindFriendsButtonClicked")
	}
}
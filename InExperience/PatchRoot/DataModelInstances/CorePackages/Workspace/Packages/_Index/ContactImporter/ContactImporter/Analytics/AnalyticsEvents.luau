local Parent = script.Parent.Parent
local EventNamesModule = require(script.Parent.Enums.EventNames)
local Enums = require(Parent.Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local BtnValuesModule = require(script.Parent.Enums.BtnValues)
local FieldNamesModule = require(script.Parent.FieldNames)
local GetFIntContactImporterUploadContactsMaxModule = require(Parent.Flags.getFIntContactImporterUploadContactsMax)
local GetFIntContactImporterUploadContactsMinModule = require(Parent.Flags.getFIntContactImporterUploadContactsMin)
local Identity = require(Parent.dependencies).Dash.identity

return {
	[EventNamesModule.ContactImportModalPageLoad] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ContactImportModalPageLoad
	},
	[EventNamesModule.ContactImportModalContinue] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ContactImportModalClick,
		additionalInfo = { btn = BtnValuesModule.ContactImporter }
	},
	[EventNamesModule.ContactImportModalAddFriends] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ContactImportModalClick,
		additionalInfo = { btn = BtnValuesModule.AddFriends },
		formatRulesForAdditionalInfo = { isLoaded = Identity, loadingTime = Identity }
	},
	[EventNamesModule.ContactImportModalClose] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ContactImportModalClick,
		additionalInfo = { btn = BtnValuesModule.Close },
		formatRulesForAdditionalInfo = { isLoaded = Identity, loadingTime = Identity }
	},
	[EventNamesModule.ContactsListLoaded] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ContactsListLoaded,
		formatRulesForAdditionalInfo = {
			[FieldNamesModule.NumTotalContactsImported] = Identity,
			[FieldNamesModule.NumMatchedContacts] = Identity,
			didBypassFetchContacts = Identity,
			[FieldNamesModule.NumTotalContactsOnDevice] = Identity,
			[FieldNamesModule.NumMaxContacts] = GetFIntContactImporterUploadContactsMaxModule,
			[FieldNamesModule.NumMinContacts] = GetFIntContactImporterUploadContactsMinModule
		}
	},
	[EventNamesModule.RequestFriendship] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.RequestFriendship },
		formatRulesForAdditionalInfo = { requestedId = Identity }
	},
	[EventNamesModule.InviteContact] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			isShortUrlEnabled = true,
			btn = BtnValuesModule.InviteContact
		},
		formatRulesForAdditionalInfo = { offNetworkFriendRequestLinkId = Identity }
	},
	[EventNamesModule.CloseContactListButton] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.CloseContactListButton },
		formatRulesForAdditionalInfo = { isLoading = Identity, loadingTime = Identity }
	},
	[EventNamesModule.CloseContactListCross] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.CloseContactListCross },
		formatRulesForAdditionalInfo = { isLoading = Identity, loadingTime = Identity }
	},
	[EventNamesModule.ContactImportingTime] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ContactImportingTime,
		formatRulesForAdditionalInfo = {
			isSuccessfulUpload = Identity,
			failedStep = Identity,
			[FieldNamesModule.NumTotalContactsImported] = Identity,
			[FieldNamesModule.NumMatchedContacts] = Identity,
			loadingTime = Identity,
			didBypassFetchContacts = Identity,
			[FieldNamesModule.NumTotalContactsOnDevice] = Identity,
			[FieldNamesModule.NumMaxContacts] = GetFIntContactImporterUploadContactsMaxModule,
			[FieldNamesModule.NumMinContacts] = GetFIntContactImporterUploadContactsMinModule
		}
	},
	[EventNamesModule.PhoneVerificationWebview] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.NavigateToPhoneVerification
	},
	[EventNamesModule.PhoneVerificationClose] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.PhoneVerificationClose,
		formatRulesForAdditionalInfo = { isPhoneVerified = Identity }
	},
	[EventNamesModule.FindFriendsButtonClicked] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.FindFriendsButton }
	}
}
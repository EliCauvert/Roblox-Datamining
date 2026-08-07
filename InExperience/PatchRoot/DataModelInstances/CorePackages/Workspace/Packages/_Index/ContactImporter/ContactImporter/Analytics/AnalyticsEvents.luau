local parent = script.Parent.Parent
local parent_1 = parent.Parent
local eventNamesModule = require(script.Parent.Enums.EventNames)
local dash = require(parent.dependencies).Dash
local enums = require(parent_1.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local btnValuesModule = require(script.Parent.Enums.BtnValues)
local fieldNamesModule = require(script.Parent.FieldNames)
local getFIntContactImporterUploadContactsMaxModule = require(parent.Flags.getFIntContactImporterUploadContactsMax)
local getFIntContactImporterUploadContactsMinModule = require(parent.Flags.getFIntContactImporterUploadContactsMin)
local identity = dash.identity

return {
	[eventNamesModule.ContactImportModalPageLoad] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ContactImportModalPageLoad
	},
	[eventNamesModule.ContactImportModalContinue] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ContactImportModalClick,
		additionalInfo = { btn = btnValuesModule.ContactImporter }
	},
	[eventNamesModule.ContactImportModalAddFriends] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ContactImportModalClick,
		additionalInfo = { btn = btnValuesModule.AddFriends },
		formatRulesForAdditionalInfo = { isLoaded = identity, loadingTime = identity }
	},
	[eventNamesModule.ContactImportModalClose] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ContactImportModalClick,
		additionalInfo = { btn = btnValuesModule.Close },
		formatRulesForAdditionalInfo = { isLoaded = identity, loadingTime = identity }
	},
	[eventNamesModule.ContactsListLoaded] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ContactsListLoaded,
		formatRulesForAdditionalInfo = {
			[fieldNamesModule.NumTotalContactsImported] = identity,
			[fieldNamesModule.NumMatchedContacts] = identity,
			didBypassFetchContacts = identity,
			[fieldNamesModule.NumTotalContactsOnDevice] = identity,
			[fieldNamesModule.NumMaxContacts] = getFIntContactImporterUploadContactsMaxModule,
			[fieldNamesModule.NumMinContacts] = getFIntContactImporterUploadContactsMinModule
		}
	},
	[eventNamesModule.RequestFriendship] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.RequestFriendship },
		formatRulesForAdditionalInfo = { requestedId = identity }
	},
	[eventNamesModule.InviteContact] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			isShortUrlEnabled = true,
			btn = btnValuesModule.InviteContact
		},
		formatRulesForAdditionalInfo = { offNetworkFriendRequestLinkId = identity }
	},
	[eventNamesModule.CloseContactListButton] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.CloseContactListButton },
		formatRulesForAdditionalInfo = { isLoading = identity, loadingTime = identity }
	},
	[eventNamesModule.CloseContactListCross] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.CloseContactListCross },
		formatRulesForAdditionalInfo = { isLoading = identity, loadingTime = identity }
	},
	[eventNamesModule.ContactImportingTime] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ContactImportingTime,
		formatRulesForAdditionalInfo = {
			isSuccessfulUpload = identity,
			failedStep = identity,
			[fieldNamesModule.NumTotalContactsImported] = identity,
			[fieldNamesModule.NumMatchedContacts] = identity,
			loadingTime = identity,
			didBypassFetchContacts = identity,
			[fieldNamesModule.NumTotalContactsOnDevice] = identity,
			[fieldNamesModule.NumMaxContacts] = getFIntContactImporterUploadContactsMaxModule,
			[fieldNamesModule.NumMinContacts] = getFIntContactImporterUploadContactsMinModule
		}
	},
	[eventNamesModule.PhoneVerificationWebview] = {
		context = contexts.ContactImport,
		eventType = eventTypes.NavigateToPhoneVerification
	},
	[eventNamesModule.PhoneVerificationClose] = {
		context = contexts.ContactImport,
		eventType = eventTypes.PhoneVerificationClose,
		formatRulesForAdditionalInfo = { isPhoneVerified = identity }
	},
	[eventNamesModule.FindFriendsButtonClicked] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.FindFriendsButton }
	}
}
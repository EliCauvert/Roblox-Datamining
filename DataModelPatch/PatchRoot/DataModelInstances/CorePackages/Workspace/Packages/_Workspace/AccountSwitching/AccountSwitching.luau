return {
	AccountSwitchingErrorOverlay = require(script.Components.AccountSwitchingErrorOverlay),
	OpenAccountSwitchingErrorOverlay = require(script.Thunks.OpenAccountSwitchingErrorOverlay),
	HandleNewAuthCompletion = require(script.Thunks.HandleNewAuthCompletion),
	GetAccountsList = require(script.Thunks.GetAccountsList),
	GetLoggedInUsersMetadata = require(script.Thunks.GetLoggedInUsersMetadata),
	GetAccountsListWithSignedOutAccounts = require(script.Thunks.GetAccountsListWithSignedOutAccounts),
	DeleteAccount = require(script.Thunks.DeleteAccount),
	dependencies = require(script.dependencies),
	["jest.config"] = script["jest.config"]
}
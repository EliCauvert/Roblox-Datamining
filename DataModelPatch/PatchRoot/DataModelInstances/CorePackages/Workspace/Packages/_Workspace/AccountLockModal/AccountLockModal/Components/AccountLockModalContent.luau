local AccountLockModal = script:FindFirstAncestor("AccountLockModal")
local EnumsModule = require(AccountLockModal.Common.Enums)
local AccountLockContextModule = require(AccountLockModal.Contexts.AccountLockContext)
local Parent = AccountLockModal.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Dialog = require(Parent.Foundation).Dialog

return ReactModule.memo(function(_)
	-- upvalues: AccountLockContextModule (copy), UseLocalizationFunction (copy), EnumsModule (copy), ReactModule (copy), Dialog (copy)
	local State = AccountLockContextModule.useAccountLockContext().state
	local UseLocalizationResult = UseLocalizationFunction({
		lockedDialog = "Feature.AccountLock.Content.LockedDialog",
		rateLimitedDialog = "Feature.AccountLock.Content.RateLimitDialog",
		errorDialog = {
			"Feature.AccountLock.Content.ErrorDialog",
			["continue"] = "<b>" .. UseLocalizationFunction({ continueBtn = "Feature.AccountLock.Action.Continue" }).continueBtn .. "</b>"
		}
	})
	
	return if State.status == EnumsModule.AccountLockStatusEnum.Locked then ReactModule.createElement(Dialog.Text, {
		LayoutOrder = 2,
		Text = UseLocalizationResult.lockedDialog
	}) elseif State.status == EnumsModule.AccountLockStatusEnum.RateLimited then ReactModule.createElement(Dialog.Text, {
		LayoutOrder = 2,
		Text = UseLocalizationResult.rateLimitedDialog
	}) else ReactModule.createElement(Dialog.Text, {
		LayoutOrder = 2,
		Text = UseLocalizationResult.errorDialog
	})
end)
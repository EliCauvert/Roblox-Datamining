local AccountLockModal = script:FindFirstAncestor("AccountLockModal")
local Parent = AccountLockModal.Parent
local EnumsModule = require(AccountLockModal.Common.Enums)
local AccountLockContextModule = require(AccountLockModal.Contexts.AccountLockContext)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Dialog = require(Parent.Foundation).Dialog

return ReactModule.memo(function(_)
	-- upvalues: AccountLockContextModule (copy), UseLocalizationFunction (copy), EnumsModule (copy), ReactModule (copy), Dialog (copy)
	local State = AccountLockContextModule.useAccountLockContext().state
	local Status = State.status
	local TimeUntilRetry: number = State.timeUntilRetry
	local UseLocalizationResult = UseLocalizationFunction({
		accountLocked = "Feature.AccountLock.Title.AccountLocked",
		tryAgain = "Feature.AccountLock.Title.TryAgain",
		rateLimit = {
			"Feature.AccountLock.Title.RateLimit",
			hh = TimeUntilRetry and string.format("%02d", (math.floor(TimeUntilRetry / 3600))) or "",
			mm = TimeUntilRetry and string.format("%02d", (math.floor(TimeUntilRetry % 3600 / 60))) or ""
		}
	})
	
	return if Status == EnumsModule.AccountLockStatusEnum.Locked then ReactModule.createElement(Dialog.Title, {
		LayoutOrder = 1,
		text = UseLocalizationResult.accountLocked
	}) elseif Status == EnumsModule.AccountLockStatusEnum.RateLimited then ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.rateLimit }) else ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.tryAgain })
end)
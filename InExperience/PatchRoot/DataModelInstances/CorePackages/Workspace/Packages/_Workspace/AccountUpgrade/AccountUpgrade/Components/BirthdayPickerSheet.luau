local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local authSignupModule = require(parent.AuthSignup)
local sharedFlagsModule = require(parent.SharedFlags)
local useRequireManualSelectionModule = require(accountUpgrade.Hooks.useRequireManualSelection)
local accountUpgradeDialogModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialog)
local accountUpgradeDialogActionsModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local birthdayPicker = authSignupModule.Components.BirthdayPicker
local useValidatedBirthday = authSignupModule.Hooks.useValidatedBirthday
local fIntSinglePageSignupMinimumAge = sharedFlagsModule.FIntSinglePageSignupMinimumAge
local buttonVariant = foundationModule.Enums.ButtonVariant

local function BirthdayPickerDialog(p1)
	-- upvalues: useValidatedBirthday (ref), fIntSinglePageSignupMinimumAge (ref), useRequireManualSelectionModule (ref), reactModule (ref), useLocalization (ref), accountUpgradeDialogModule (ref), birthdayPicker (ref), accountUpgradeDialogActionsModule (ref), buttonVariant (ref)
	local var1, var2 = useValidatedBirthday(fIntSinglePageSignupMinimumAge)
	local var3 = useRequireManualSelectionModule()
	local onConfirm = p1.onConfirm
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), onConfirm (ref)
		if var1 ~= nil then
			onConfirm(var1)
		end
	end, { var1, onConfirm })
	local onClose = p1.onClose
	local var5 = reactModule.useCallback(function(_)
		-- upvalues: onClose (ref)
		onClose()
	end, { onClose })
	local var6 = useLocalization({
		titleText = "Authentication.SignUp.Label.SelectBirthdaySentenceCase",
		confirmText = "Authentication.SignUp.Button.OKCaptialized"
	})
	local birthday = p1.birthday
	
	return reactModule.createElement(accountUpgradeDialogModule, {
		hasBackdrop = true,
		testId = "account-upgrade-birthday-dialog",
		title = var6.titleText,
		onClose = var5,
		children = {
			Picker = reactModule.createElement(birthdayPicker, {
				layoutOrder = 1,
				minAgeAllowed = fIntSinglePageSignupMinimumAge,
				requireManualSelection = var3,
				updateBirthday = var2,
				initialMonth = if birthday then birthday.Month else nil,
				initialDay = if birthday then birthday.Day else nil,
				initialYear = if birthday then birthday.Year else nil
			})
		},
		actions = reactModule.createElement(accountUpgradeDialogActionsModule, {
			LayoutOrder = 3,
			testId = "account-upgrade-birthday-dialog-actions",
			buttons = {
				{
					text = var6.confirmText,
					variant = buttonVariant.Emphasis,
					onActivated = var4,
					isDisabled = var1 == nil
				}
			}
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), BirthdayPickerDialog (ref)
	return if p1.isOpen then reactModule.createElement(BirthdayPickerDialog, p1) else nil
end